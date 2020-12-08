#include "backend/codegen.h"

#include <algorithm>
#include <sstream>
#include <cassert>
#include <stdexcept>
#include <iostream>
#include <iomanip>


namespace cs160::backend {

    // Assembly instruction operands, short names
    struct Operand {
        virtual const std::string toString() const = 0;
    };

    // register
    struct R final : public Operand {
        std::string value;

        R(std::string v) : value(std::move(v)) {}

        const std::string toString() const override {
            return '\%' + value;
        }
    };

    // label
    struct L final : public Operand {
        std::string value;

        L(std::string v) : value(std::move(v)) {}

        const std::string toString() const override {
            return value;
        }
    };

    // pre-defined registers
    static const R EAX{"eax"};
    static const R EDX{"edx"};
    static const R ESP{"esp"};
    static const R EBP{"ebp"};

    // integer constant
    struct C final : public Operand {
        int32_t value;

        C(int32_t v) : value(v) {}

        const std::string toString() const override {
            return '$' + std::to_string(value);
        }
    };

    // unsigned integer constant, printed in hexadecimal for easier reading
    struct H final : public Operand {
        uint32_t value;
        
        H(uint32_t v) : value(v) {}
        
        const std::string toString() const override {
            std::ostringstream s;
            s << "$0x" << std::hex << std::setfill('0') << std::setw(8) << value;
            return s.str();
        }
    };
    
    // offset
    struct O final : public Operand {
        int32_t offset;
        R reg;

        O(int32_t offset, R reg) : offset(offset), reg(reg) {}

        const std::string toString() const override {
            std::ostringstream s;
            s << (-offset) << "(" << reg.toString() << ")";
            return s.str();
        }
    };

    // Helper functions for producing assembly code

    // overload for nullary case
    std::string Insn(const std::string & opcode) {
        return "  " + opcode;
    }

    // overload for non-nullary case
    template<typename OpT1, typename ... OpT>
    std::string Insn(std::string opcode, OpT1 first, OpT... rest) {
        std::ostringstream insn;
        insn << "  " << opcode << " " << first.toString();

        // use fold expression to print the rest
        ((insn << ", " << rest.toString()), ...);  

        return insn.str();
    }

    std::optional<VarInfo> Context::lookup(std::string const& x) {
        auto info = var2Info.find(x);

        if (info != var2Info.end()) {
            return info->second;
        }

        // x is not defined in current scope, check parents
        if (parent) {
            return parent->lookup(std::move(x));
        } else {
            return std::nullopt;
        }
    }

    // Symbol table methods

    const std::string SymbolTable::tmpPrefix = "tmp_";

    // Check and add function definition
    void SymbolTable::addFnDef(const FunctionDef & fnDef) {
        if (fnInfo.count(fnDef.function_name()) != 0) {
            throw CodeGenError {"Function " + fnDef.function_name() + " is defined more than once"};
        }

        std::vector<std::string> paramTypes;
        
        for (auto & [type, _] : fnDef.parameters()) {
            paramTypes.push_back(type->name());
        }

        fnInfo.emplace(std::string(fnDef.function_name()), FnInfo{std::move(paramTypes), std::string(fnDef.type().name())});
    }

    uint32_t SymbolTable::getArity(const std::string & f) {
        auto a = fnInfo.find(f);
        if (a == fnInfo.end()) {
            throw CodeGenError {"Trying to use undefined function " + f};
        }

        return a->second.argTypes.size();
    }

    // Reset local variable information, used when entering a new function definition
    void SymbolTable::resetLocalsInfo() {
        ctx = {};
    }

    // Allocate stack space for a new local variable
    void SymbolTable::allocateVar(const std::string x,  const std::string type) {
        if (ctx.var2Info.count(x)) {
            throw CodeGenError { x + " is already defined in the same scope" };
        }
        // std::cerr << "allocating " << x << "\nbefore allocation:";
        // this->dump();
        // auto y = x;
        ctx.var2Info.emplace(std::move(x), VarInfo{ctx.nextOffset, type});
        //        std::cout << "allocating: " << y << ": " <<  ctx.lookup(y)->second << std::endl;

        //        ctx.var2offset.emplace(std::move(x), ctx.nextOffset);
        // move the offset counter by 4
        ctx.nextOffset += 4;

        // update the maximum size
        auto oldOffset = ctx.parent ? ctx.parent->nextOffset : 4;
        auto size = ctx.nextOffset - oldOffset;
        if (ctx.maxSize < size) {
            ctx.maxSize = size;
        }
        // std::cerr << "\nafter allocation:\n";
        // this->dump();
        // std::cerr << "\n";
    }

    // Deallocate given temporary variable
    void SymbolTable::deallocateVar(const std::string x) {
        //        std::cout << "deallocate: " << x << std::endl;
        if (ctx.var2Info.count(x) == 0) {
            throw CodeGenError { x + " is not in this scope" };
        }
        auto offset = ctx.var2Info.at(x).first;
        ctx.var2Info.erase(x);
        // move the offset counter by 4 if this was the lastly-allocated variable
        if (offset == int(ctx.nextOffset) - 4) {
            ctx.nextOffset -= 4;
        } else {
            std::cerr << "symbol table:\n";
            this->dump();
            std::cerr << std::endl;
            throw std::logic_error{"variable offset mismatch, can't deallocate temporary"};
        }
    }

    void SymbolTable::dump() {
        std::cerr << "nextTmp = " << nextTmp << "\n";
        Context const * ctx = &this->ctx;
        std::string indent = "";
        while (ctx) {
            std::cerr << indent << "nextOffset = " << ctx->nextOffset << "\n";
            std::cerr << indent << "maxSize = " << ctx->maxSize << "\n";
            std::cerr << indent << "vars: [\n";
            for (const auto & [x, info] : ctx->var2Info) {
                std::cerr << indent << "  " << x << " @ " << info.first << "\n";
            }
            std::cerr << indent << "]\n";
            if (ctx->parent) {
                std::cerr << "parent: \n";
            }

            ctx = ctx->parent.get();
            indent += "  ";
        }
    }

    // Create a new scope, used when entering a block
    void SymbolTable::openScope() {
        auto oldOffset = ctx.nextOffset;
        ctx = Context{{}, std::make_unique<Context>(std::move(ctx)), oldOffset};
    }

    // Clear the current scope and go back to the parent
    void SymbolTable::closeScope() {
        std::unique_ptr<Context> parent;
        ctx.parent.swap(parent);
        ctx = std::move(*parent);
    }

    // Temporary variable implementation

    CodeGen::TmpVar::TmpVar(const std::string & name, CodeGen &codegen) : name(name), codegen(codegen) {
        codegen.symbolTable.allocateVar(name, "int");
    }

    CodeGen::TmpVar::~TmpVar() {
        codegen.symbolTable.deallocateVar(name);
    }

    int32_t CodeGen::TmpVar::operator * () const {
        return codegen.symbolTable.ctx.lookup(name)->first;
    }

    // Code generator methods

    CodeGen::TmpVar CodeGen::freshTmp() {
        auto name = SymbolTable::tmpPrefix + std::to_string(symbolTable.nextTmp++);
        return TmpVar(name, *this);
    }

    std::vector<std::string> CodeGen::generateCode(const Program & program) {
        // reset instructions, label counter, symbol table, etc.
        insns = {"  .extern allocate"};
        nextIndex = 0;
        symbolTable = {};
        inTopLevelScope = true;
        // actual code gen
        visitProgram(program);
        return insns;
    }

    void CodeGen::visitInteger(const Integer& exp) {
        // Store the constant in the result register
        insns.push_back(Insn("movl", C{exp.value()}, EAX));
    }

    
    void CodeGen::visitVariable(const Variable& exp) {
        // Load the address of the variable to result register. More efficient code can
        // be generated using LEA instruction.
        auto varInfo = symbolTable.ctx.lookup(exp.name());
        
        if (!varInfo) {
            throw CodeGenError {"reference to undefined variable " + exp.name()};
        }
        
        insns.push_back(Insn("movl", EBP, EAX));
        insns.push_back(Insn("sub", C{varInfo->first}, EAX) + "  /* load address of " + exp.name() + " */");
    }
    
    void CodeGen::visitAccessPath(const AccessPath& exp){
        // Note: the algorithm here computes the address to the access path
        // iteratively so it does dereferences and offset calculation in
        // separate instructions. A more efficient algorithm could put all
        // offset calculations to movl instructions, except for the last
        // `add` instruction.
        
        exp.root().visit(this);
        //        std::cout << "visiting root: " << exp.root().name() << std::endl;
        //  std::cout << "with fields: " << std::endl;
        // for (auto f : exp.fieldAccesses()){
        //     std::cout << f << std::endl;
        // }
        
        // Dereference field addresses
        //        std::cout <<  "visiting: " << exp.root().name() << std::endl; 
        //        std::cout <<  symbolTable.ctx.lookup(exp.root().name()) << std::endl;
        //        std::cout <<  symbolTable.ctx.lookup(exp.root().name())->first << std::endl;
        //        std::cout <<  symbolTable.ctx.lookup(exp.root().name())->second << std::endl;
        auto type = symbolTable.ctx.lookup(exp.root().name())->second;
        //        std::cout << "looking for type: " << std::endl;
        for (auto field : exp.fieldAccesses()) {
            auto [offset, fieldType] = symbolTable.typeInfo[type].varInfoOf(field);
            // dereference field address
            insns.push_back(Insn("movl", O{-0, EAX}, EAX) + " /* dereference the address at EAX */");
            insns.push_back(Insn("add", C{offset * 4}, EAX) + " /* load address of field ." + field + " */");
            // update the type
            type = fieldType;
        }
        // Dereference the last part if we are not in lhs
        if (! inLhsOfAssignment) {
            insns.push_back(Insn("movl", O{-0, EAX}, EAX) + "/* dereference the address because we are not in lhs of an assignment */");
        }
    }

    void CodeGen::visitNil(const Nil& exp){
        insns.push_back(Insn("movl", C{0}, EAX));
    }

    void CodeGen::visitNewExpr(const NewExpr& exp){
        //        std::cout << "hello!!! " << std::endl;
        auto typeInfo = symbolTable.typeInfo.find(exp.type());
        if (typeInfo == symbolTable.typeInfo.end()) {
            throw CodeGenError { "Type " + exp.type() + " is not defined" };
        }
        
        auto size = static_cast<int32_t>(typeInfo->second.fields.size());
        // call allocate(int32_t size)
        insns.push_back("  // ALLOCATE FOR NEW " + exp.type());
        insns.push_back(Insn("pushl", C{size}));
        insns.push_back(Insn("call", L{"allocate"}));
        insns.push_back(Insn("add", C{4}, ESP));
        insns.push_back("  // SET TAG");
        // set up the tag
        insns.push_back(Insn("movl", H{typeInfo->second.tag()}, O{4, EAX}));
        insns.push_back("  // INITIALIZE FIELDS");
        // initialize fields to 0
        for (int32_t i = 0; i < size; ++i) {
            insns.push_back(Insn("movl", C{0}, O{i * -4, EAX}));
        }
        insns.push_back("  // END NEW " + exp.type());
    }
    
    
    void CodeGen::visitType(const Type& exp){}
    
    void CodeGen::visitTypeDef(const TypeDef& def){
        // Add this type definition to symbol table
        //        printf("hello?\n");
        
        if (symbolTable.typeInfo.count(def.type_name()) != 0) {
            throw CodeGenError { "Type " + def.type_name() + " is already defined" };
        }
  
        std::vector<std::pair<std::string, std::string>> fields;
        
        for (auto & decl : def.fields()) {
            fields.push_back({decl->id().name(), decl->type().name()});
            //            std::cout << decl->id().name() << "     " << decl->type().name() << std::endl;
        }


        
        symbolTable.typeInfo.emplace(std::string(def.type_name()), TypeInfo{std::string(def.type_name()), std::move(fields)});
    }
    
    void CodeGen::visitAddExpr(const AddExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back(Insn("add", EDX, EAX));
    }
    void CodeGen::visitSubtractExpr(const SubtractExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back(Insn("sub", EAX, EDX));
        insns.push_back(Insn("movl", EDX, EAX));
    }
    void CodeGen::visitMultiplyExpr(const MultiplyExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back(Insn("imul", EDX, EAX));
    }
    void CodeGen::visitLessThanExpr(const LessThanExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back("  cmp %eax, %edx");
        insns.push_back("  setl %al");
        insns.push_back("  movzbl %al, %eax");
    }
    void CodeGen::visitLessThanEqualToExpr(const LessThanEqualToExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back("  cmp %eax, %edx");
        insns.push_back("  setle %al");
        insns.push_back("  movzbl %al, %eax");
    }
    void CodeGen::visitEqualToExpr(const EqualToExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back("  cmp %eax, %edx");
        insns.push_back("  sete %al");
        insns.push_back("  movzbl %al, %eax");
    }
    void CodeGen::visitLogicalAndExpr(const LogicalAndExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back(Insn("andl", EDX, EAX));
    }
    void CodeGen::visitLogicalOrExpr(const LogicalOrExpr& exp) {
        exp.lhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{ *tmpVar, EBP}));
        exp.rhs().visit(this);
        insns.push_back(Insn("movl", O{ *tmpVar, EBP}, EDX));

        // LHS is at EDX, RHS is at EAX
        insns.push_back(Insn("orl", EDX, EAX));
    }
    void CodeGen::visitLogicalNotExpr(const LogicalNotExpr& exp) {
        exp.operand().visit(this);
        // Result is in eax, use branch-free not implementation
        insns.push_back("  cmp $0, %eax");
        insns.push_back("  sete %al");
        insns.push_back("  movzbl %al, %eax");
    }
    void CodeGen::visitBlock(const Block& exp) {
        // Save whether we were in global scope
        bool wasInTopLevelScope = inTopLevelScope;
        inTopLevelScope = false;

        // Reserve stack space
        auto stackSize = C{static_cast<int32_t>(exp.decls().size()) * 4};
        insns.push_back(Insn("sub", stackSize, ESP));
        auto adjustI = insns.size() - 1;

        // To simplify garbage collection, we do not allow variables
        // declared in inner scopes in L2
        if (!wasInTopLevelScope && stackSize.value > 0) {
            throw CodeGenError {"Local variables in inner scopes are not allowed in L2"};
        }
                
        // Create new scope in symbol table
        symbolTable.openScope();


        // Insert declared variables to symbol table and initialize them to 0
        for (auto & d : exp.decls()) {
            d->visit(this);
            insns.push_back(Insn("movl", C{0}, O{symbolTable.ctx.lookup(d->id().name())->first, EBP}));
        }
        // Generate code for the statements, note that this may create additional temporaries
        for (auto & s : exp.stmts()) {
            s->visit(this);
        }

        // Re-calculate the stack size based on the scope information
        assert(int32_t(symbolTable.ctx.maxSize) >= stackSize.value); //TODO might need this
        stackSize = C{static_cast<int32_t>(symbolTable.ctx.maxSize)};
        insns.at(adjustI) = Insn("sub", stackSize, ESP);

        // Adjust the stack size back if we are not in global scope
        if (!wasInTopLevelScope) {
            insns.push_back(Insn("add", stackSize, ESP));
            symbolTable.closeScope();
        }
        // Restore global status
        inTopLevelScope = wasInTopLevelScope;
    }

    void CodeGen::visitDeclaration(const Declaration& exp) {
        symbolTable.allocateVar(exp.id().name(), exp.type().name());
    }

    void CodeGen::visitAssignment(const Assignment& assignment) {
        // generate code for rhs, this will put the result in EAX
        assignment.rhs().visit(this);
        auto tmpVar = freshTmp();
        insns.push_back(Insn("movl", EAX, O{(*tmpVar), EBP}));
        // resolve address of LHS
        inLhsOfAssignment = true;
        assignment.lhs().visit(this);
        inLhsOfAssignment = false;
        // Address of LHS should be in EAX

        insns.push_back(Insn("movl", O{(*tmpVar), EBP}, EDX));
        insns.push_back(Insn("movl", EDX, O{0, EAX}));
    }
    
    void CodeGen::visitConditional(const Conditional& conditional) {
        auto n = std::to_string(freshIndex());
        auto falseLabel = L{"IF_FALSE_" + n};
        auto endLabel = L{"IF_END_" + n};
        conditional.guard().visit(this);
        insns.push_back(Insn("cmp", C{0}, EAX));
        insns.push_back(Insn("je", falseLabel));
        conditional.true_branch().visit(this);
        insns.push_back(Insn("jmp", endLabel));
        insns.push_back(falseLabel.value + ":");
        conditional.false_branch().visit(this);
        insns.push_back(endLabel.value + ":");
    }
    void CodeGen::visitWhileLoop(const WhileLoop& loop) {
        auto n = std::to_string(freshIndex());
        auto startLabel = L{"WHILE_START_" + n};
        auto endLabel = L{"WHILE_END_" + n};
        insns.push_back(startLabel.value + ":");
        loop.guard().visit(this);
        insns.push_back(Insn("cmp", C{0}, EAX));
        insns.push_back(Insn("je", endLabel));
        loop.body().visit(this);
        insns.push_back(Insn("jmp", startLabel));
        insns.push_back(endLabel.value + ":");
    }
    void CodeGen::visitForLoop(const ForLoop& loop) {
        auto n = std::to_string(freshIndex());
        auto guardLabel = L{"FOR_GUARD_" + n};
        auto endLabel = L{"FOR_END_" + n};
        // add to symbol table declaraction of variable
        symbolTable.openScope();
        symbolTable.allocateVar(loop.loopVar().name(), "int");
        // allocate the space for x and tmpVar
        insns.push_back(Insn("sub", C{4}, ESP));
        auto adjustI = insns.size() - 1;
        auto varOffset = symbolTable.ctx.lookup(loop.loopVar().name())->first;
        // new scope for the temporary
        {
            // declared variable initialized to loop.from() valueza
            loop.from().visit(this);
            insns.push_back(Insn("movl", EAX, O{varOffset, EBP})); 
            // tmp variable initialized and permanently set to loop.to() value
            loop.to().visit(this);
            auto tmpVar = freshTmp();
            insns.push_back(Insn("movl", EAX, O{*tmpVar, EBP}));
            insns.push_back(guardLabel.value + ":");
            // compare value of variable, jump if counter is greater than temporary value
            insns.push_back(Insn("movl", O{varOffset, EBP}, EAX)); 
            insns.push_back(Insn("movl", O{*tmpVar, EBP}, EDX));
            insns.push_back(Insn("cmp", EDX, EAX));
            insns.push_back(Insn("jg", endLabel));
            // go to body
            loop.body().visit(this);
            // increment counter
            insns.push_back(Insn("movl", O{varOffset, EBP}, EAX));
            insns.push_back(Insn("add", C{1}, EAX));
            insns.push_back(Insn("movl", EAX, O{varOffset, EBP}));  
            // jump back to the start of the for loop.
            insns.push_back(Insn("jmp", guardLabel));
            insns.push_back(endLabel.value + ":");
            // Re-calculate the stack size based on the scope information
            auto stackSize = C{static_cast<int32_t>(symbolTable.ctx.maxSize)};
            insns.at(adjustI) = Insn("sub", stackSize, ESP);
            insns.push_back(Insn("add", stackSize, ESP));
        }
        // close the scope
        symbolTable.closeScope();
    }
    void CodeGen::visitFunctionCallExpr(const FunctionCall& call) {
        // create temporaries for each argument, the code to deallocate them will be created when we are done.
        auto stackSpace = static_cast<int32_t>(call.arguments().size() * 4);

        // Handle the arguments in reverse
        for (auto arg = call.arguments().rbegin(), end = call.arguments().rend(); arg != end; ++arg) {
            // code to compute the argument
            (*arg)->visit(this);
            // push the argument
            insns.push_back(Insn("push", EAX));
            //            symbolTable.ctx.nextOffset += 4;
        }

        // call the function
        insns.push_back(Insn("call", L{call.callee_name()}));
        // free the stack space
        insns.push_back(Insn("add", C{stackSpace}, ESP));
    }

    void CodeGen::visitFunctionDef(const FunctionDef& def) {
        uint32_t argInfo = 0;
        size_t i = 0;
        for (auto & [type, _] : def.parameters()) {
            if (! type->isIntType()) {
                argInfo |= 1 << i;
            }
            ++i;
        }
  
        uint32_t localsInfo = 0;
        i = 0;
        for (auto & decl : def.function_body().decls()) {
            if (! decl->type().isIntType()) {
                localsInfo |= 1 << i;
            }
            ++i;
        }

        
        symbolTable.resetLocalsInfo();
        insns.push_back(def.function_name() + ":");
        // prologue
        insns.push_back("  // FUNCTION PROLOGUE");
        // save the stack frame
        insns.push_back(Insn("push", EBP));
        insns.push_back(Insn("movl", ESP, EBP));
        // push argument and local info
        insns.push_back("  // ARGUMENT INFO");
        insns.push_back(Insn("pushl", H{argInfo}));
        insns.push_back("  // LOCAL INFO");
        insns.push_back(Insn("pushl", H{localsInfo}));
        // end prologue
        insns.push_back("  // BODY");
        
        // symbolTable.resetLocalsInfo();
        // // prologue
        // insns.push_back(def.function_name() + ":");
        // // save the stack frame
        // insns.push_back(Insn("push", EBP));
        // insns.push_back(Insn("movl", ESP, EBP));
        // // end prologue

        // add parameters to current context
        symbolTable.openScope();
        int32_t currentParamOffset = -8;
        for (auto & [type, param] : def.parameters()) {
            // we use offsets in the other direction (as if the stack is growing up), toString method of Offset class negates the offset so the offsets are calculated as if the stack is growing down.
            auto v_info  = std::pair<int32_t, const std::string&>(currentParamOffset, type->name());
            symbolTable.ctx.var2Info.insert({param->name(),v_info}); 
            currentParamOffset -= 4;
        }

        auto adjustI = insns.size(); // the next instruction will be the sub
        // generate code for the body
        def.function_body().visit(this);
        // generate code for the return expression, the result will be in EAX conveniently
        def.retval().visit(this);

        // free stack space
        auto stackSize = C{static_cast<int32_t>(symbolTable.ctx.maxSize)};
        insns.push_back(Insn("add", stackSize, ESP));
        // adjust the allocated space to account for the return expression
        insns.at(adjustI) = Insn("sub", stackSize, ESP);

        // epilogue 
        // restore the stack frame
        insns.push_back(Insn("movl", EBP, ESP));
        insns.push_back(Insn("pop", EBP));
        // return
        insns.push_back(Insn("ret"));
        // end prologue

        // remove parameters from current context
        symbolTable.closeScope();
    }
    void CodeGen::visitProgram(const Program& program) {

        
        for (const auto & typeDef : program.type_defs()) {
            typeDef->visit(this);
        }

        // fill the function symbol table
        for (const auto & fnDef : program.function_defs()) {
            symbolTable.addFnDef(*fnDef);
        }

        // generate definitions
        for (const auto & fnDef : program.function_defs()) {
            fnDef->visit(this);
        }

        uint32_t localsInfo = 0;
        size_t i = 0;
        for (auto & decl : program.statements().decls()) {
            if (! decl->type().isIntType()) {
                localsInfo |= 1 << i;
            }
            ++i;
        }

        insns.push_back("  .globl Entry");
        insns.push_back("  .type Entry, @function");
        insns.push_back("Entry:");
        //program entry prologue
        insns.push_back("  // BOOTSTRAP ENTRY");
        insns.push_back(Insn("push", EBP));
        insns.push_back(Insn("movl", ESP, EBP));
        insns.push_back("  // ARGUMENT INFO");
        insns.push_back(Insn("pushl", H{0}));
        insns.push_back("  // LOCAL INFO");
        insns.push_back(Insn("pushl", H{localsInfo}));
        //end prologue
        auto adjustI = insns.size(); // the next instruction will be the sub
        program.statements().visit(this);
        program.arithmetic_exp().visit(this);
        // adjust the allocated space, then free stack space
        auto stackSize = C{static_cast<int32_t>(symbolTable.ctx.maxSize)};
        insns.at(adjustI) = Insn("sub", stackSize, ESP);
        insns.push_back(Insn("add", stackSize, ESP));
        // program exit epilogue
        insns.push_back(Insn("movl", EBP, ESP));
        insns.push_back(Insn("pop", EBP));
        insns.push_back(Insn("ret"));
    }

}  // namespace cs160::backend
