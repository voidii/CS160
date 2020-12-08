#include "frontend/parser.h"
#include <iostream>

namespace cs160::frontend {

    void Parser::matchToken(const TokenType& tok) {
        if (nextToken() && nextToken().value().type() == tok) {
            head++;
        } else {

            printf("%i \n", (int)TokenType::RelOp);
            printf("%i \n", (int)TokenType::Assign);

            //printf("%i \n", (int)TokenType::HasType);
            printf("TokeError  expecting %i\n",(int)tok);
            printf("TokeError  got %i\n",(int)nextToken().value().type());
            
            //            throw InvalidASTError("Invalid AST created: matchToken");
            throw InvalidASTError("Invalid AST created: matchToken" + nextToken().value().stringValue());
        }
    }

    std::optional<Token> Parser::nextToken(int peek) {
        if (head == (int)tokens.size() - 1) {
            return std::nullopt;
        } else {
            return tokens[head + peek];
        }
    }

    IntegerP Parser::parseInteger() {
        matchToken(TokenType::Num);
        return std::make_unique<const Integer>(tokens[head].intValue());
    }

    VariableP Parser::parseVariable() {
        matchToken(TokenType::Id);
        return std::make_unique<const Variable>(tokens[head].stringValue());
    }
    
    AccessPathP Parser::parseAccessPath() {
        //printf("access\n");
        // std::cout << "Parser::parseVariable" << std::endl;
        auto root = parseVariable();
        std::vector<std::string> fields;
        // Convert recursive descent to a while loop
        while (nextToken() && nextToken().value().type() == TokenType::Dot) {
            matchToken(TokenType::Dot);
            matchToken(TokenType::Id);
            fields.push_back(tokens[head].stringValue());
        }
        return std::make_unique<const AccessPath>(std::move(root), fields);
    }


    ArithmeticExprP Parser::parseAFactor() {
        if (nextToken() && nextToken().value().type() == TokenType::LParen) {
            matchToken(TokenType::LParen);
            //            printf("here(\n");
            auto ae = parseArithmeticExpr();
            //            printf("here)\n");
            matchToken(TokenType::RParen);
            //  printf("here! right here, this is the bug we should not reach here\n");
            return ae;
        } else if (nextToken() && nextToken().value().type() == TokenType::Num) {
            return parseInteger();
        } else if (nextToken() && nextToken().value().type() == TokenType::Id) {
            return parseAccessPath();
        } else if (nextToken() && nextToken().value().type() == TokenType::Nil) {
            matchToken(TokenType::Nil);
            return std::make_unique<Nil>();
        } else if (nextToken() && nextToken().value().type() == TokenType::New) {
            // std::cout << "new expr" << std::endl;
            matchToken(TokenType::New);
            matchToken(TokenType::Type);
            auto typeStr = tokens[head].stringValue();
            if (typeStr == "int") {
                // can't define int as a struct
                throw InvalidASTError("Invalid AST created: can't allocate for plain int");
            }
            return std::make_unique<const NewExpr>(typeStr);
        }
        
        
        throw InvalidASTError("Invalid AST created: parseAFactor Error");
    }

    ArithmeticExprP Parser::parseATermPrime() {
        if (nextToken() &&
            nextToken().value() == Token::makeArithOp(ArithOp::Times)) {
            matchToken(Token::makeArithOp(ArithOp::Times).type());

            auto l = parseAFactor();
            auto p = parseATermPrime();
            if (p) {
                return std::make_unique<const MultiplyExpr>(std::move(l), std::move(p));
            } else {
                return l;
            }
        } else {
            return nullptr;
        }
    }

    ArithmeticExprP Parser::parseATerm() {
        auto l = parseAFactor();
        auto p = parseATermPrime();
        if (p) {
            return std::make_unique<const MultiplyExpr>(std::move(l), std::move(p));
        } else {
            return l;
        }
    }

    std::pair<ArithmeticExprP, std::optional<Token>> Parser::parseAExpPrime() {
        if (nextToken() && nextToken().value() == Token::makeArithOp(ArithOp::Plus)) {
            matchToken(Token::makeArithOp(ArithOp::Plus).type());
            auto l = parseATerm();
            auto p = parseAExpPrime();
            if (p.first && p.second.value() == Token::makeArithOp(ArithOp::Plus)) {
                return std::make_pair(
                                      std::make_unique<const AddExpr>(std::move(l), std::move(p.first)),
                                      Token::makeArithOp(ArithOp::Plus));
            } else if (p.first &&
                       p.second.value() == Token::makeArithOp(ArithOp::Minus)) {
                return std::make_pair(std::make_unique<const SubtractExpr>(
                                                                           std::move(l), std::move(p.first)),
                                      Token::makeArithOp(ArithOp::Plus));

            } else {
                return std::make_pair(std::move(l), Token::makeArithOp(ArithOp::Plus));
            }
        }

        else if (nextToken() &&
                 nextToken().value() == Token::makeArithOp(ArithOp::Minus)) {
            //            printf("heref!\n");
            matchToken(Token::makeArithOp(ArithOp::Minus).type());
            auto l = parseATerm();
            //            printf("hereg!\n");
            auto p = parseAExpPrime();
            if (p.first && p.second.value() == Token::makeArithOp(ArithOp::Plus)) {
                return std::make_pair(
                                      std::make_unique<const AddExpr>(std::move(l), std::move(p.first)),
                                      Token::makeArithOp(ArithOp::Minus));
            } else if (p.first &&
                       p.second.value() == Token::makeArithOp(ArithOp::Minus)) {
                return std::make_pair(std::make_unique<const SubtractExpr>(
                                                                           std::move(l), std::move(p.first)),
                                      Token::makeArithOp(ArithOp::Minus));
            } else {
                return std::make_pair(std::move(l), Token::makeArithOp(ArithOp::Minus));
            }

        } else {
            //printf("here????\n");
            return std::make_pair(nullptr, std::nullopt);
        }
    }

    ArithmeticExprP Parser::parseArithmeticExpr() {
        //        printf("herea!\n");
        auto at = parseATerm();
        //        printf("hereb!\n");
        auto p = parseAExpPrime();
        //        printf("herec!\n");
        if (p.second && p.second.value() == Token::makeArithOp(ArithOp::Plus)) {
            //  printf("hered1!\n");
            return std::make_unique<const AddExpr>(std::move(at), std::move(p.first));
        }

        else if (p.second && p.second.value() == Token::makeArithOp(ArithOp::Minus)) {
            // printf("hered2!\n");
            return std::make_unique<const SubtractExpr>(std::move(at),
                                                        std::move(p.first));
        }

        else {
            // printf("hered     asdasdas!\n");
            return at;
        }
    }

    RelationalExprP Parser::parseCexp() {
        // printf("here1\n");
        auto ae1 = parseArithmeticExpr();
        // printf("here2\n");
        if (nextToken() && nextToken().value() == Token::makeRelOp(RelOp::LessThan)) {
            matchToken(Token::makeRelOp(RelOp::LessThan).type());
            auto ae2 = parseArithmeticExpr();
            return std::make_unique<const LessThanExpr>(std::move(ae1), std::move(ae2));

        } else if (nextToken() &&
                   nextToken().value() == Token::makeRelOp(RelOp::LessEq)) {
            matchToken(Token::makeRelOp(RelOp::LessEq).type());
            auto ae2 = parseArithmeticExpr();
            return std::make_unique<const LessThanEqualToExpr>(std::move(ae1),
                                                               std::move(ae2));

        } else if (nextToken() &&
                   nextToken().value() == Token::makeRelOp(RelOp::Equal)) {
            matchToken(Token::makeRelOp(RelOp::Equal).type());
            auto ae2 = parseArithmeticExpr();
            return std::make_unique<const EqualToExpr>(std::move(ae1), std::move(ae2));
        }
        
        throw InvalidASTError("Invalid AST created: parseCexp Error");
    }

    RelationalExprP Parser::parseRexp() {
        auto l = parseRexpPrime1();
        auto r = parseRexpRest1();
        if (r) {
            return std::make_unique<const LogicalOrExpr>(std::move(l),
                                                         std::move(r));
        } else {
            return l;
        }
    }

    RelationalExprP Parser::parseRexpRest1() {
        if (nextToken() && *nextToken() == Token::makeLBinOp(LBinOp::Or)) {
            matchToken(TokenType::LBinOp);
            auto l = parseRexpPrime1();
            auto r = parseRexpRest1();
            if (r) {
                return std::make_unique<const LogicalOrExpr>(std::move(l),
                                                             std::move(r));
            } else {
                return l;
            }
        }
        return RelationalExprP{};
    }

    RelationalExprP Parser::parseRexpPrime1() {
        auto l = parseRexpPrime2();
        auto r = parseRexpRest2();
        if (r) {
            return std::make_unique<const LogicalAndExpr>(std::move(l),
                                                          std::move(r));
        } else {
            return l;
        }
    }
  
    RelationalExprP Parser::parseRexpRest2() {
        if (nextToken() && *nextToken() == Token::makeLBinOp(LBinOp::And)) {
            matchToken(TokenType::LBinOp);
            auto l = parseRexpPrime2();
            auto r = parseRexpRest2();
            if (r) {
                return std::make_unique<const LogicalAndExpr>(std::move(l),
                                                              std::move(r));
            } else {
                return l;
            }
        }
        return RelationalExprP{};
    }

    RelationalExprP Parser::parseRexpPrime2() {
        if (nextToken() && nextToken().value() == Token::makeLNeg()) {
            matchToken(TokenType::LNeg);
            auto re = parseRexpPrime2();
            return std::make_unique<const LogicalNotExpr>(std::move(re));
        } else if (nextToken() && nextToken().value() == Token::makeLBracket()) {
            matchToken(TokenType::LBracket);
            auto re = parseRexp();
            matchToken(TokenType::RBracket);
            return re;
        } else {
            auto cexp = parseCexp();
            return cexp;
        }
        throw InvalidASTError("Invalid AST created: parseRexpPrime2 Error");
    }

    WhileLoopP Parser::parseWhileLoopP() {
        matchToken(TokenType::While);
        auto re = parseRexp();
        matchToken(TokenType::LBrace);
        auto blk = parseBlock();
        matchToken(TokenType::RBrace);
        return std::make_unique<const WhileLoop>(std::move(re), std::move(blk));
    }

    ForLoopP Parser::parseForLoopP() {
        matchToken(TokenType::For);
        auto loopVar = parseVariable();
        matchToken(TokenType::From);
        auto from = parseArithmeticExpr();
        matchToken(TokenType::To);
        auto to = parseArithmeticExpr();
        matchToken(TokenType::LBrace);
        auto body = parseBlock();
        matchToken(TokenType::RBrace);
        return std::make_unique<const ForLoop>(std::move(loopVar), std::move(from), std::move(to), std::move(body));
    }

    ConditionalP Parser::parseCondExprP() {
        matchToken(TokenType::If);

        auto re = parseRexp();

        matchToken(TokenType::LBrace);

        auto blk = parseBlock();

        matchToken(TokenType::RBrace);

        if (nextToken() && nextToken().value().type() == TokenType::Else) {
            matchToken(TokenType::Else);
            matchToken(TokenType::LBrace);

            auto blk2 = parseBlock();
            matchToken(TokenType::RBrace);

            return std::make_unique<const Conditional>(std::move(re), std::move(blk),
                                                       std::move(blk2));

        } else {
            std::vector<DeclarationP> d;
            std::vector<StatementP> s;
            return std::make_unique<const Conditional>(
                                                       std::move(re), std::move(blk),
                                                       Block{{},{}});
        }
    }

    AssignmentP Parser::parseAssignmentP() {
        auto lhs = parseAccessPath();
        //        std::cout << "assigning to " << lhs->root().name() << std::endl; 
        matchToken(TokenType::Assign);
        //        std::cout << "matched the assign token" << std::endl;

        if (nextToken(1) && nextToken(2) &&
            nextToken(1).value().type() == TokenType::Id &&
            nextToken(2).value().type() == TokenType::LParen) {
            auto c = parseFunCall();
            matchToken(TokenType::Semicolon);
            return std::make_unique<const Assignment>(std::move(lhs), std::move(c));

        } else {
            auto ae = parseArithmeticExpr();
            matchToken(TokenType::Semicolon);
            return std::make_unique<const Assignment>(std::move(lhs), std::move(ae));
        }
    }

    DeclarationP Parser::parseDeclarationP() {
        matchToken(TokenType::Type);  // change if extra types are added
        auto t = std::make_unique<const Type>(tokens[head].stringValue());
        auto id = parseVariable();
        matchToken(TokenType::Semicolon);
        return std::make_unique<const Declaration>(std::move(t), std::move(id));
    }

    vec_of_ptrs<Declaration> Parser::parseDecls() {
        vec_of_ptrs<Declaration> ret;
        if (nextToken() && (nextToken().value().type() == TokenType::Type)) {
            auto s = parseDeclarationP();
            auto v = parseDecls();
            v.insert(v.begin(), std::move(s));
            ret.insert(std::end(ret), std::make_move_iterator(std::begin(v)),
                       std::make_move_iterator(std::end(v)));
        }
        return ret;
    }

    StatementP Parser::parseStatementP() {
        if (nextToken() && nextToken().value().type() == TokenType::While) {
            return parseWhileLoopP();
        } else if (nextToken() && nextToken().value().type() == TokenType::For) {
            return parseForLoopP();
        } else if (nextToken() && nextToken().value().type() == TokenType::If) {
            return parseCondExprP();
        } else if (nextToken() && nextToken().value().type() == TokenType::Id) {
            return parseAssignmentP();
        }
        throw InvalidASTError("Invalid AST created: parseStatementP Error");
    }

    vec_of_ptrs<Statement> Parser::parseStmts() {
        vec_of_ptrs<Statement> ret;
        if (nextToken() && (nextToken().value().type() == TokenType::Id ||
                            nextToken().value().type() == TokenType::While ||
                            nextToken().value().type() == TokenType::For ||
                            nextToken().value().type() == TokenType::If)) {
            auto s = parseStatementP();
            auto v = parseStmts();
            v.insert(v.begin(), std::move(s));
            ret.insert(std::end(ret), std::make_move_iterator(std::begin(v)),
                       std::make_move_iterator(std::end(v)));
        }
        return ret;
    }

    Block Parser::parseBlock() {
        vec_of_ptrs<Declaration> d = parseDecls();
        vec_of_ptrs<Statement> s = parseStmts();
        return Block{std::move(d), std::move(s)};
    }

    std::vector<ArithmeticExprP> Parser::parseFunArgs() {
        std::vector<ArithmeticExprP> ret;

        while (nextToken() && (nextToken().value().type() == TokenType::Num ||
                               nextToken().value().type() == TokenType::Id ||
                               nextToken().value().type() == TokenType::ArithOp ||
                               nextToken().value().type() == TokenType::LParen)) {
            auto ae = parseArithmeticExpr();
            ret.push_back(std::move(ae));

            if (nextToken() && nextToken().value().type() == TokenType::Comma) {
                matchToken(TokenType::Comma);
            }
        }
        return ret;
    }

    FunctionCallP Parser::parseFunCall() {
        auto id = parseVariable();
        matchToken(TokenType::LParen);
        auto args = parseFunArgs();
        matchToken(TokenType::RParen);
        return std::make_unique<const FunctionCall>(id->name(), std::move(args));
    }

    std::vector<std::pair<TypeP,VariableP>> Parser::parseParams() {
        std::vector<std::pair<TypeP,VariableP>> ret;
        while (nextToken() && nextToken().value().type() == TokenType::Type) {
            matchToken(TokenType::Type);  
            auto t = tokens[head].stringValue();
            auto id = parseVariable();
            auto pair =
                std::make_pair(std::make_unique<const Type>(t), std::move(id));
            ret.push_back(std::move(pair));

            if (nextToken() && nextToken().value().type() == TokenType::Comma) {
                matchToken(TokenType::Comma);
            }
        }
        return ret;
    }

    std::vector<std::pair<TypeP, VariableP>> Parser::parseOptParams() {
        if (nextToken() && nextToken().value().type() == TokenType::Type) {
            return parseParams();
        } else {
            return {};
        }
    }

    FunctionDefP Parser::parseFunDef() {
        matchToken(TokenType::Def);
        auto id = parseVariable();

        matchToken(TokenType::LParen);
        auto optparams = parseOptParams();
        matchToken(TokenType::RParen);
        matchToken(TokenType::HasType);

        // auto t = parseType(); // change if we add more types
        matchToken(TokenType::Type);
        matchToken(TokenType::LBrace);

        auto b = parseBlock();
        matchToken(TokenType::Return);

        auto ae = parseArithmeticExpr();
        matchToken(TokenType::Semicolon);
        matchToken(TokenType::RBrace);
        return std::make_unique<const FunctionDef>(
                                                   id->name(), std::make_unique<const Type>("int"), std::move(optparams),
                                                   std::move(b), std::move(ae));
    }
        
    vec_of_ptrs<FunctionDef> Parser::parseFunDefs() {
        vec_of_ptrs<FunctionDef> ret;
        while (nextToken() && (nextToken().value().type() == TokenType::Def)) {
            auto f = parseFunDef();
            ret.push_back(std::move(f));
        }
        return ret;
    }

    TypeDefP Parser::parseTypeDef() {
        matchToken(TokenType::Struct);
        matchToken(TokenType::Type);

        auto typeStr = tokens[head].stringValue();
        if (typeStr == "int") {
            // can't define int as a struct
            throw InvalidASTError("Invalid AST created: can't define int as struct");
        }
        matchToken(TokenType::LBrace);
        auto decls = parseDecls();
        matchToken(TokenType::RBrace);
        matchToken(TokenType::Semicolon);
        
        return std::make_unique<const TypeDef>(typeStr, std::move(decls));
    }
    
    vec_of_ptrs<TypeDef> Parser::parseTypeDefs() {
        vec_of_ptrs<TypeDef> ret;
        while (nextToken() && (nextToken().value().type() == TokenType::Struct)) {
            auto f = parseTypeDef();
            ret.push_back(std::move(f));
        }
        return ret;
    }

    ProgramP Parser::parse() {
        vec_of_ptrs<TypeDef> p = parseTypeDefs();
        vec_of_ptrs<FunctionDef> f = parseFunDefs();
        auto s = parseBlock();

        matchToken(TokenType::Output);
        auto ae = parseArithmeticExpr();
        matchToken(TokenType::Semicolon);

        return std::make_unique<const Program>(std::move(p), std::move(f),
                                               std::move(s), std::move(ae));
    }
}  // namespace cs160::frontend
