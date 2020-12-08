
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

#include "ast_visitor.h"

namespace cs160::frontend {

    class genTreeVisitor : public AstVisitor {
    public:
        genTreeVisitor() {}
        ~genTreeVisitor() {}

        const std::string GetOutput() const { return output_.str(); }

        void visitInteger(const Integer& exp) override {
            output_ << exp.value();
        }
        
        void visitNil(const NilExpr& exp) override {
            output_ << "nil";
        }

        void visitAccessPath(const AccessPath& path) override {
            path.root().Visit(this);
            for (auto const & f : path.fieldAccesses()) {
                output_ << "." << f;
            }
        }

        void visitTypeExpr(const TypeExpr& exp) override { output_ << exp.name(); }
        
        void visitAddExpr(const AddExpr& exp) override {
            output_ << "(+ ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitSubtractExpr(const SubtractExpr& exp) override {
            output_ << "(- ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitMultiplyExpr(const MultiplyExpr& exp) override {
            output_ << "(* ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitVariableExpr(const VariableExpr& exp) override {
            output_ << exp.name();
        }

        void visitNewExpr(const NewExpr& exp) override {
            output_ << "new " << exp.type();
        }

        void visitLessThanExpr(const LessThanExpr& exp) override {
            output_ << "(< ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitLessThanEqualToExpr(const LessThanEqualToExpr& exp) override {
            output_ << "(<= ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitEqualToExpr(const EqualToExpr& exp) override {
            output_ << "(= ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitLogicalAndExpr(const LogicalAndExpr& exp) override {
            output_ << "(&& ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitLogicalOrExpr(const LogicalOrExpr& exp) override {
            output_ << "(|| ";
            exp.lhs().visit(this);
            output_ << " ";
            exp.rhs().visit(this);
            output_ << ")";
        }

        void visitLogicalNotExpr(const LogicalNotExpr& exp) override {
            output_ << "(!";
            exp.operand().visit(this);
            output_ << ")";
        }

        void visitIntType(const IntType& exp) override { output_ << exp.value(); }
        void visitIntTypeExpr(const IntType& exp) override { output_ << exp.value(); }

        void visitBlockExpr(const BlockExpr& exp) override {
            for (auto it = exp.decls().begin(); it != exp.decls().end(); ++it) {
                (*it)->visit(this);
            }
            output_ << " ";
            for (auto it = exp.stmts().begin(); it != exp.stmts().end(); ++it) {
                (*it)->visit(this);
            }
        }

        void visitDeclaration(const Declaration& exp) override {
            output_ << "";
            exp.type().visit(this);
            output_ << " ";
            exp.id().visit(this);
            output_ << "; ";
        }

        void visitAssignment(const Assignment& exp) override {
            output_ << "";
            exp.lhs().visit(this);
            output_ << " := ";
            exp.rhs().visit(this);
            output_ << "; ";
        }

        void visitConditional(const Conditional& exp) override {
            output_ << "if ";
            exp.guard().visit(this);
            output_ << " {";
            exp.true_branch().visit(this);
            output_ << "} else {";
            exp.false_branch().visit(this);
            output_ << "}";
        }

        void visitWhileLoop(const Loop& exp) override {
            output_ << "while ";
            exp.guard().visit(this);
            output_ << " {";
            exp.body().visit(this);
            output_ << "}";
        }

        void visitFunctionCallExpr(const FunctionCall& exp) override {
            output_ << exp.callee_name() << "(";
            for (auto it = exp.arguments().begin(); it != exp.arguments().end(); ++it) {
                (*it)->visit(this);
            }
            output_ << ")";
        }

        void visitFunctionDef(const FunctionDef& exp) override {
            output_ << "def " << exp.function_name();
            output_ << "(";
            for (auto it = exp.parameters().begin(); it != exp.parameters().end();
                 ++it) {
                (*it).first->visit(this);
                output_ << " ";
                (*it).second->visit(this);
                if (std::next(it) != exp.parameters().end()) {
                    output_ << ", ";
                }
            }
            output_ << ") : ";
            exp.type().visit(this);
            output_ << " {";
            exp.function_body().visit(this);
            output_ << "return ";
            exp.retval().visit(this);
            output_ << "; }";
        }

        void visitProgram(const Program& exp) override {
            output_ << "Program(";
            for (auto it = exp.function_defs().begin(); it != exp.function_defs().end();
                 ++it) {
                (*it)->visit(this);
            }
            exp.statements().visit(this);
            output_ << "output ";
            exp.arithmetic_exp().visit(this);
            output_ << ");";
        }
        void visitTypeDef(const TypeDef & typeDef) override {
            output_ << "struct " << typeDef.type_name() << " {\n";
            for (auto & decl : typeDef.fields()) {
                decl.visit(this);
            }
            output_ << "\n};";
        }
        

    private:
        std::stringstream output_;

        // map of productions
        std::unordered_map<AstNode, std::vector<AstNode>> productions(
                                                                      {{AExpPrime, VariableExpr}});

    };  // namespace cs160::frontend
}  // namespace cs160::frontend
