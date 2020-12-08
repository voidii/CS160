#pragma once
#include <optional>
#include <stdexcept>
#include <vector>
#include "frontend/ast.h"
#include "frontend/token.h"

namespace cs160::frontend {
    
    // This is meant as a general error
    struct InvalidASTError : public std::runtime_error {
    InvalidASTError() : runtime_error("Invalid AST created") {}
    InvalidASTError(std::string msg) : runtime_error(msg) {}
    };
    
    // This is the parser class you need to implement. The function you need to
    // implement is the parsify() method. You can define other class members such as
    // fields or helper functions.
    class Parser final {
    public:
        // The entry point of the parser you need to implement. It takes the output of
        // the lexer as the argument and produces an abstract syntax tree as the
        // result of parsing the tokens.
        Parser(const std::vector<Token> &lexer_tokens) : tokens(lexer_tokens) {}

        std::optional<Token> nextToken(int peek = 1);
        void matchToken(const TokenType &);

        std::unique_ptr<const AccessPath> parseAccessPath();
        VariableP parseVariable();
        IntegerP parseInteger();

        ArithmeticExprP parseArithmeticExpr();
        std::pair<ArithmeticExprP, std::optional<Token>> parseAExpPrime();
        ArithmeticExprP parseATerm();
        ArithmeticExprP parseATermPrime();
        ArithmeticExprP parseAFactor();

        RelationalExprP parseRexp();
        RelationalExprP parseRexpPrime1();
        RelationalExprP parseRexpPrime2();
        RelationalExprP parseRexpRest1();
        RelationalExprP parseRexpRest2();
        RelationalExprP parseRFactor();
        RelationalExprP parseCexp();

        DeclarationP parseDeclarationP();
        vec_of_ptrs<Declaration> parseDecls();

        StatementP parseStatementP();
        ForLoopP parseForLoopP();
        WhileLoopP parseWhileLoopP();
        ConditionalP parseCondExprP();
        AssignmentP parseAssignmentP();
        vec_of_ptrs<Statement> parseStmts();
        Block parseBlock();

        std::vector<std::pair<std::unique_ptr<const Type>, std::unique_ptr<const Variable>>>
        parseParams();
        std::vector<std::pair<std::unique_ptr<const Type>, std::unique_ptr<const Variable>>>
        parseOptParams();

        TypeDefP parseTypeDef();
        vec_of_ptrs<TypeDef> parseTypeDefs();
        
        std::vector<ArithmeticExprP> parseFunArgs();
        FunctionDefP parseFunDef();
        vec_of_ptrs<FunctionDef> parseFunDefs();

        FunctionCallP parseFunCall();

        ProgramP parse();

    private:
        const std::vector<Token> tokens;
        int head = -1;  // we start at one before the token list
    };
};  // namespace cs160::frontend
