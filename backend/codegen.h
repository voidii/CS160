#pragma once

#include "frontend/ast.h"
#include "frontend/ast_visitor.h"
#include <string>
#include <vector>
#include <stdexcept>
#include <memory>
#include <unordered_map>
#include <optional>
#include <iostream>

using namespace cs160::frontend;

namespace cs160::backend {

    struct CodeGenError : public std::runtime_error {
        explicit CodeGenError(const std::string & message) : runtime_error(message) {}
    };

    // Stores offset, typename
    using VarInfo = std::pair<int32_t, const std::string>;

    // A nested context containing variable information with lexical scoping
    struct Context {
        //std::unordered_map<std::string, int> var2offset;
        std::unordered_map<std::string, VarInfo> var2Info;
        
        std::unique_ptr<Context> parent;
        // Information about the stack space and the current local variable context
        uint32_t nextOffset = 12; 
        uint32_t maxSize = 0;

        std::optional<VarInfo> lookup(std::string const& x);
    };

    // Function information that keeps track of argument and return types
    struct FnInfo {
        std::vector<std::string> argTypes;
        std::string retType;
    };

    // Type information that keeps track of offsets and types of each field
    struct TypeInfo {
        // Type name information is for debugging purposes
        const std::string name;
        // Fields are represented as pairs of variables and types
        std::vector<std::pair<std::string, std::string>> fields;

        int32_t offsetOf(std::string const & field) const {
            return varInfoOf(field).first;
        }

        const std::string typeOf(std::string const & field) const {
            return varInfoOf(field).second;
        }

        VarInfo varInfoOf(std::string const & field) const {
            // std::cout << "looking for: " << field << std::endl;
            // std::cout << "name " << name << std::endl;
            // std::cout << "fields.size() " << fields.size() << std::endl;
            for (size_t i = 0; i < fields.size(); ++i) {
                
                if (fields[i].first == field) {
                    //std::cout <<  "It is: " << fields[i].first << std::endl << std::endl;
                    return VarInfo{static_cast<int32_t>(i), fields[i].second};
                }
                //                std::cout <<  "It's not: " << fields[i].first << std::endl;
            }
            
            throw std::logic_error { std::string("Field ") + field + " is not found in struct " + name };
        }

        // Compute the tag needed by GC
        uint32_t tag() const {
            auto tag = (uint32_t)fields.size() << 24;
            for (size_t i = 0; i < fields.size(); ++i) {
                if (fields[i].second != "int") {
                    // the field is a pointer set the relevant bit in tag
                    tag |= 1 << (i + 1);
                }
            }

            // set the mark bit so the GC will know that this is not a follow ptr
            tag |= 1;

            return tag;
        }
    };
    

    // Symbol table, implementation detail
    struct SymbolTable {
        //        std::unordered_map<std::string, uint32_t> arity;
        std::unordered_map<std::string, TypeInfo> typeInfo;
        std::unordered_map<std::string, FnInfo> fnInfo;


        Context ctx;
        static const std::string tmpPrefix;
        uint32_t nextTmp = 0;

        // Check and add function definition
        void addFnDef(const FunctionDef & fnDef);

        uint32_t getArity(const std::string & f);

        // Reset local variable information, used when entering a new function definition
        void resetLocalsInfo();

        // Allocate stack space for a new local variable
        void allocateVar(const std::string x, const std::string type);

        // Deallocate stack space for the given temporary variable
        void deallocateVar(std::string x);

        // Create a new scope, used when entering a block
        void openScope();

        // Clear the current scope and go back to the parent
        void closeScope();

        // Dump the symbol table to std::cerr for inspection
        void dump();
    };

    // The code generator is implemented as an AST visitor that will generate the relevant pieces of code as it traverses a node
    class CodeGen final : public AstVisitor {
    public:
        // Entry point of the code generator. This function should visit given program and return generated code as a list of instructions and labels.
        std::vector<std::string> generateCode(const Program & program);

        // Visitor functions

        void visitNil(const Nil& exp) override;
        void visitAccessPath(const AccessPath&) override;
        void visitType(const Type& exp) override;
        void visitInteger(const Integer& exp) override;
        void visitVariable(const Variable& exp) override;
        void visitAddExpr(const AddExpr& exp) override;
        void visitNewExpr(const NewExpr& exp) override;
        void visitSubtractExpr(const SubtractExpr& exp) override;
        void visitMultiplyExpr(const MultiplyExpr& exp) override;
        void visitLessThanExpr(const LessThanExpr& exp) override;
        void visitLessThanEqualToExpr(const LessThanEqualToExpr& exp) override;
        void visitEqualToExpr(const EqualToExpr& exp) override;
        void visitLogicalAndExpr(const LogicalAndExpr& exp) override;
        void visitLogicalOrExpr(const LogicalOrExpr& exp) override;
        void visitLogicalNotExpr(const LogicalNotExpr& exp) override;
        void visitBlock(const Block& exp) override;
        void visitDeclaration(const Declaration& exp) override;
        void visitAssignment(const Assignment& assignment) override;
        void visitConditional(const Conditional& conditional) override;
        void visitWhileLoop(const WhileLoop& loop) override;
        void visitForLoop(const ForLoop& loop) override;
        void visitFunctionCallExpr(const FunctionCall& call) override;
        void visitFunctionDef(const FunctionDef& def) override;
        void visitProgram(const Program& program) override;
        void visitTypeDef(const TypeDef& progam) override;
       

    private:
        // Implementation details, remove in student solution

        // Next index for label generation
        uint32_t nextIndex = 0;
  
        uint32_t freshIndex() {
            return nextIndex++;
        }

        // Whether we are currently generating left hand-side of an
        // assignment. This flag is used for keeping the address for an
        // access path.
        bool inLhsOfAssignment = false;


        // List of instructions generated so far
        std::vector<std::string> insns;
        // Symbol table
        SymbolTable symbolTable;
        // A flag to check if we are in the global scope or top level of a function body, this is needed for the top-level variables to be alive until the argument of `output`/`return`.
        bool inTopLevelScope;

        // allocated temporary variable, this class is used with RAII to generate code to remove the temporary when it is longer used
        class TmpVar {
            std::string name;
            CodeGen & codegen;
        public:
            explicit TmpVar(const std::string & name, CodeGen &codegen);
            TmpVar(const TmpVar&) = delete;
            ~TmpVar();
            int32_t operator * () const;
        };

        // Create a fresh temporary variable that is managed via RAII
        TmpVar freshTmp();
    };

}
