
#include "ast.h"
#include "ast_visitor.h"
#include "print_visitor.h"

namespace cs160::frontend {

    std::string AstNode::toString() const {
        PrintVisitor pv;
        this->visit(&pv);
        return pv.GetOutput();
    }

    void AddExpr::visit(AstVisitor* visitor) const { visitor->visitAddExpr(*this); }
    void Integer::visit(AstVisitor* visitor) const {
        visitor->visitInteger(*this);
    }
    void NewExpr::visit(AstVisitor* visitor) const {
        visitor->visitNewExpr(*this);
    }
    void Nil::visit(AstVisitor* visitor) const {
        visitor->visitNil(*this);
    }
    void AccessPath::visit(AstVisitor* visitor) const {
        visitor->visitAccessPath(*this);
    }
    void Type::visit(AstVisitor* visitor) const {
        visitor->visitType(*this);
    }
    void Variable::visit(AstVisitor* visitor) const {
        visitor->visitVariable(*this);
    }
    void SubtractExpr::visit(AstVisitor* visitor) const {
        visitor->visitSubtractExpr(*this);
    }
    void MultiplyExpr::visit(AstVisitor* visitor) const {
        visitor->visitMultiplyExpr(*this);
    }
    void LessThanExpr::visit(AstVisitor* visitor) const {
        visitor->visitLessThanExpr(*this);
    }
    void LessThanEqualToExpr::visit(AstVisitor* visitor) const {
        visitor->visitLessThanEqualToExpr(*this);
    }
    void EqualToExpr::visit(AstVisitor* visitor) const {
        visitor->visitEqualToExpr(*this);
    }
    void LogicalAndExpr::visit(AstVisitor* visitor) const {
        visitor->visitLogicalAndExpr(*this);
    }
    void LogicalOrExpr::visit(AstVisitor* visitor) const {
        visitor->visitLogicalOrExpr(*this);
    }
    void LogicalNotExpr::visit(AstVisitor* visitor) const {
        visitor->visitLogicalNotExpr(*this);
    }
    void Block::visit(AstVisitor* visitor) const {
        visitor->visitBlock(*this);
    }
    void Declaration::visit(AstVisitor* visitor) const {
        visitor->visitDeclaration(*this);
    }
    void Assignment::visit(AstVisitor* visitor) const {
        visitor->visitAssignment(*this);
    }
    void Conditional::visit(AstVisitor* visitor) const {
        visitor->visitConditional(*this);
    }
    void WhileLoop::visit(AstVisitor* visitor) const { 
        visitor->visitWhileLoop(*this); 
    }
    void ForLoop::visit(AstVisitor* visitor) const { 
        visitor->visitForLoop(*this); 
    }
    void FunctionDef::visit(AstVisitor* visitor) const {
        visitor->visitFunctionDef(*this);
    }
    void FunctionCall::visit(AstVisitor* visitor) const {
        visitor->visitFunctionCallExpr(*this);
    }
    void Program::visit(AstVisitor* visitor) const {
        visitor->visitProgram(*this);
    }
    void TypeDef::visit(AstVisitor* visitor) const {
        visitor->visitTypeDef(*this);
    }
    


}  // namespace cs160::frontend
