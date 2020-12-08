#pragma once
#include "ast.h"

namespace cs160::frontend {

    // The visitor abstract base class for visiting abstract syntax trees.
    class AstVisitor {
    public:
        virtual ~AstVisitor() {}

        // These should be able to change members of the visitor, thus not const
        virtual void visitNil(const Nil& exp) = 0;
        virtual void visitInteger(const Integer& exp) = 0;
        virtual void visitVariable(const Variable& exp) = 0;
        virtual void visitAccessPath(const AccessPath&) = 0;
        virtual void visitType(const Type& exp) = 0;
        virtual void visitAddExpr(const AddExpr& exp) = 0;
        virtual void visitNewExpr(const NewExpr& exp) = 0;
        virtual void visitSubtractExpr(const SubtractExpr& exp) = 0;
        virtual void visitMultiplyExpr(const MultiplyExpr& exp) = 0;
        virtual void visitLessThanExpr(const LessThanExpr& exp) = 0;
        virtual void visitLessThanEqualToExpr(const LessThanEqualToExpr& exp) = 0;
        virtual void visitEqualToExpr(const EqualToExpr& exp) = 0;
        virtual void visitLogicalAndExpr(const LogicalAndExpr& exp) = 0;
        virtual void visitLogicalOrExpr(const LogicalOrExpr& exp) = 0;
        virtual void visitLogicalNotExpr(const LogicalNotExpr& exp) = 0;
        virtual void visitBlock(const Block& exp) = 0;
        virtual void visitDeclaration(const Declaration& exp) = 0;
        virtual void visitAssignment(const Assignment& assignment) = 0;
        virtual void visitConditional(const Conditional& conditional) = 0;
        virtual void visitWhileLoop(const WhileLoop& loop) = 0;
        virtual void visitForLoop(const ForLoop& loop) = 0;
        virtual void visitFunctionCallExpr(const FunctionCall& call) = 0;
        virtual void visitFunctionDef(const FunctionDef& def) = 0;
        virtual void visitProgram(const Program& program) = 0;
        virtual void visitTypeDef(const TypeDef& def) = 0;
    };

}  // namespace cs160::frontend
