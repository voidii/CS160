#define CATCH_CONFIG_MAIN

#include "frontend/parser.h"
#include "catch2/catch.hpp"
#include "frontend/lexer.h"
#include "frontend/token.h"

using namespace cs160::frontend;
using Catch::Matchers::Equals;
using Catch::Matchers::Message;

TEST_CASE("Basic coverage tests", "[parser]") {
  // integer expression: 4
  auto parsed =
      Parser{std::vector<Token>{Token::makeOutput(), Token::makeNum(4),
                                Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> di;
  vec_of_ptrs<Statement> si;
  auto expected =
      Program(vec_of_ptrs<FunctionDef>(),
              Block(std::move(di), std::move(si)),
              std::make_unique<const Integer>(4));
  REQUIRE(parsed->toString() == expected.toString());


  //  addition expression: 1+2
  auto parsed_plus =
      Parser{std::vector<Token>{Token::makeOutput(), Token::makeNum(1),
                                Token::makeArithOp(ArithOp::Plus),
                                Token::makeNum(2), Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> dp;
  vec_of_ptrs<Statement> sp;
  auto expected_plus = Program(
      vec_of_ptrs<FunctionDef>(),
      Block(std::move(dp), std::move(sp)),
      std::make_unique<const AddExpr>(std::make_unique<const Integer>(1),
                                      std::make_unique<const Integer>(2)));
  REQUIRE(parsed_plus->toString() == expected_plus.toString());

  //
  //  assignment: x:=4; output x;
  auto parsed_assign =
      Parser{std::vector<Token>{Token::makeId("x"), Token::makeAssign(),
                                Token::makeNum(4), Token::makeSemicolon(),
                                Token::makeOutput(), Token::makeId("x"),
                                Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> da;
  vec_of_ptrs<Statement> sa;
  sa.push_back(std::make_unique<const Assignment>
               (std::make_unique<const AccessPath>(std::make_unique<const Variable>("x"),std::vector<std::string>({})),
                std::make_unique<const Integer>(4)));
  auto expected_assign =
      Program(vec_of_ptrs<FunctionDef>(),
              Block(std::move(da), std::move(sa)),
              std::make_unique<const Variable>("x"));
  REQUIRE(parsed_assign->toString() == expected_assign.toString());

  //
  //  conditional: if 1<2 {} output 4;
  auto parsed_cond =
      Parser{std::vector<Token>{
                 Token::makeIf(), Token::makeNum(1),
                 Token::makeRelOp(RelOp::LessThan), Token::makeNum(2),
                 Token::makeLBrace(),
                 Token::makeRBrace(),  // nothing doing
                 Token::makeOutput(), Token::makeNum(4),
                 Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> dc;
  vec_of_ptrs<Statement> sc;
  vec_of_ptrs<Declaration> true_branch_decls;
  vec_of_ptrs<Statement> true_branch_stmts;
  vec_of_ptrs<Declaration> false_branch_decls;
  vec_of_ptrs<Statement> false_branch_stmts;
  sc.push_back(std::make_unique<const Conditional>(
      std::make_unique<const LessThanExpr>(
          std::make_unique<const Integer>(1),
          std::make_unique<const Integer>(2)),
      Block(std::move(true_branch_decls),
                                        std::move(true_branch_stmts)),
      Block(std::move(false_branch_decls),
                                        std::move(false_branch_stmts))));
  auto expected_cond =
      Program(vec_of_ptrs<FunctionDef>(),
              Block(std::move(dc), std::move(sc)),
              std::make_unique<const Integer>(4));
  REQUIRE(parsed_cond->toString() == expected_cond.toString());


  //
  //  whileloop: while 1<2 {} output 4; 
  auto parsed_whileloop =
      Parser{std::vector<Token>{
                 Token::makeWhile(), Token::makeNum(1),
                 Token::makeRelOp(RelOp::LessThan), Token::makeNum(2),
                 Token::makeLBrace(),
                 Token::makeRBrace(),  // no statements
                 Token::makeOutput(), Token::makeNum(4),
                 Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> dwl;
  vec_of_ptrs<Statement> swl;
  vec_of_ptrs<Declaration> whileloop_body_decls;
  vec_of_ptrs<Statement> whileloop_body_stmts;
  swl.push_back(std::make_unique<const WhileLoop>(
      std::make_unique<const LessThanExpr>(
          std::make_unique<const Integer>(1),
          std::make_unique<const Integer>(2)),
      Block(std::move(whileloop_body_decls),
                                        std::move(whileloop_body_stmts))));
  auto expected_whileloop =
      Program(vec_of_ptrs<FunctionDef>(),
              Block(std::move(dwl), std::move(swl)),
              std::make_unique<const Integer>(4));
  REQUIRE(parsed_whileloop->toString() == expected_whileloop.toString());

  //
  //  forloop: for i from 1 to 2 {} output 4;
  auto parsed_forloop =
      Parser{std::vector<Token>{
                 Token::makeFor(), Token::makeId("i"),
                 Token::makeFrom(), Token::makeNum(1), 
                 Token::makeTo(), Token::makeNum(2),
                 Token::makeLBrace(), Token::makeRBrace(),
                 Token::makeOutput(), Token::makeNum(4),
                 Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> dfl;
  vec_of_ptrs<Statement> sfl;
  vec_of_ptrs<Declaration> forloop_body_decls;
  vec_of_ptrs<Statement> forloop_body_stmts;
  sfl.push_back(std::make_unique<const ForLoop>
                (std::make_unique<const Variable>("i"),
                 std::make_unique<const Integer>(1),
                 std::make_unique<const Integer>(2),
                 Block(std::move(forloop_body_decls), std::move(forloop_body_stmts))));
  auto expected_forloop =
      Program(vec_of_ptrs<FunctionDef>(),
              Block(std::move(dfl), std::move(sfl)),
              std::make_unique<const Integer>(4));
  REQUIRE(parsed_forloop->toString() == expected_forloop.toString());

  //
  //  declaration: int x; output 4;
  auto parsed_declaration =
      Parser{std::vector<Token>{Token::makeType("int"), Token::makeId("x"),
                                Token::makeSemicolon(), Token::makeOutput(),
                                Token::makeNum(4), Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> dd;
  vec_of_ptrs<Statement> sd;
  dd.push_back(std::make_unique<const Declaration>(
      std::make_unique<const Type>("int"),
      std::make_unique<const Variable>("x")));
  auto expected_declaration =
      Program(vec_of_ptrs<FunctionDef>(),
              Block(std::move(dd), std::move(sd)),
              std::make_unique<const Integer>(4));
  REQUIRE(parsed_declaration->toString() == expected_declaration.toString());

  //
  // function def: def f() :int { return 4; } output 4;
  auto parsed_fdef =
      Parser{std::vector<Token>{Token::makeDef(), Token::makeId("f"),
                                Token::makeLParen(), Token::makeRParen(),
                                Token::makeHasType(), Token::makeType("int"),
                                Token::makeLBrace(), Token::makeReturn(),
                                Token::makeNum(4), Token::makeSemicolon(),
                                Token::makeRBrace(), Token::makeOutput(),
                                Token::makeNum(4), Token::makeSemicolon()}}
          .parse();

  vec_of_ptrs<Declaration> empty_defs;
  vec_of_ptrs<Statement> empty_stmts;
  vec_of_ptrs<FunctionDef> fdef_body;
  std::vector<std::pair<TypeP, VariableP>> parameters;
  fdef_body.push_back(std::make_unique<const FunctionDef>(
      "f",                                // function name
      std::make_unique<const Type>("int"),  // return type
      std::move(parameters),              // no parameters
      Block(
          std::move(empty_defs), std::move(empty_stmts)),  // no function body
      std::make_unique<const Integer>(4)));            // return value

  auto expected_fdef =
      Program(std::move(fdef_body),
              Block(std::move(empty_defs),
                                                std::move(empty_stmts)),
              std::make_unique<const Integer>(4));
  REQUIRE(parsed_fdef->toString() == expected_fdef.toString());
}


TEST_CASE("Type definition test", "[parser]") {
  
    //type and function def: struct %list { int value; %list next; } def f() :int { return 4; } output 4;
  auto parsed_fdef =
      Parser{std::vector<Token>{
          Token::makeStruct(),
          Token::makeType("%list"),
          Token::makeLBrace(),
          Token::makeType("int"), Token::makeId("value"), Token::makeSemicolon(),
          Token::makeType("%list"), Token::makeId("next"), Token::makeSemicolon(),
          Token::makeRBrace(), Token::makeSemicolon(),
          Token::makeDef(), Token::makeId("f"),
          Token::makeLParen(), Token::makeRParen(),
          Token::makeHasType(), Token::makeType("int"),
          Token::makeLBrace(), Token::makeReturn(),
          Token::makeNum(4), Token::makeSemicolon(),
          Token::makeRBrace(), Token::makeOutput(),
          Token::makeNum(4), Token::makeSemicolon()}}
      .parse();
  

  vec_of_ptrs<Declaration> empty_defs;
  vec_of_ptrs<Statement> empty_stmts;
  vec_of_ptrs<FunctionDef> fdef_body;
  std::vector<std::pair<TypeP, VariableP>> parameters;

  fdef_body.push_back(std::make_unique<const FunctionDef>(
      "f",                                // function name
      std::make_unique<const Type>("int"),  // return type
      std::move(parameters),              // no parameters
      Block(std::move(empty_defs), std::move(empty_stmts)),  // no function body
      std::make_unique<const Integer>(4)));            // return value


  // vec_of_ptrs<const Declaration> type_fields;
  // type_fields.push_back(std::make_unique<const Declaration>
  //                       (std::make_unique<const Type>("int"),
  //                        std::make_unique<const Variable>("value")));
  // type_fields.push_back(std::make_unique<const Declaration>
  //                       (std::make_unique<const Type>("list"),
  //                        std::make_unique<const Variable>("next")));


  // vec_of_ptrs<const TypeDef> type_defs;
  // type_defs.push_back(std::make_unique<const TypeDef>("list", std::move(type_fields)));
  
  // auto expected_fdef =
  //     Program(std::move(type_defs),
  //             std::move(fdef_body),
  //             Block(std::move(empty_defs), std::move(empty_stmts)),
  //             std::make_unique<const Integer>(4));
  //REQUIRE(parsed_fdef->toString() == expected_fdef.toString());
}



TEST_CASE("Simple invalid parser tests", "[Parser{}]") {
    auto tok = std::vector<Token>{
        Token::makeId("x"), Token::makeArithOp(ArithOp::Plus),
        Token::makeArithOp(ArithOp::Times), Token::makeId("y")};
    REQUIRE_THROWS_AS(Parser{tok}.parse(), InvalidASTError);
}
