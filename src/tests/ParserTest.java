package tests;

import java.io.StringReader;
import java.util.ArrayList;

import org.junit.Assert;
import org.junit.Test;

import crux.Parser;
import crux.Scanner;
import crux.Token;
import crux.Token.Kind;


public class ParserTest {
	
	@Test
	public void testLiteral()
	{
		String code = "4 5.2 true false";
		Scanner scanner = new Scanner(new StringReader(code));
        Parser parser = new Parser(scanner);

        parser.literal();
        parser.literal();
        parser.literal();
        parser.literal();
        Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
	}

	@Test
	public void testDesignator()
	{
		String code = "a a[1] a[4][4]";
		Scanner scanner = new Scanner(new StringReader(code));
        Parser parser = new Parser(scanner);

        parser.designator();
        parser.designator();
        parser.designator();
        Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
	}

	@Test
	public void testType()
	{
		String code = "void int float boolean";
		Scanner scanner = new Scanner(new StringReader(code));
        Parser parser = new Parser(scanner);

        parser.type();
        parser.type();
        parser.type();
        parser.type();
        Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
	}

	@Test
	public void testExpression0()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("5");
        codes.add("4 >= 4");
        codes.add("4 <= 4");
        codes.add("4 != 4");
        codes.add("4 == 4");
        codes.add("4 > 4");
        codes.add("4 < 4");
        codes.add("4 and 3 / not 5 < a[5] - 29 + ::foo(3)");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
			Parser parser = new Parser(scanner);

			parser.expression0();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
        }
	}

	@Test
	public void testExpression1()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("5");
        codes.add("4 + 4");
        codes.add("4 - 4");
        codes.add("4 or 4");
        codes.add("4 + 4 + 2 + 8 + 8");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
			Parser parser = new Parser(scanner);

			parser.expression1();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
	    }
	}

	@Test
	public void testExpression2()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("5");
        codes.add("4 * 4");
        codes.add("4 / 4");
        codes.add("4 and 4");
        codes.add("4 * 4 * 2 * 8 * 8");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
			Parser parser = new Parser(scanner);

			parser.expression2();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testExpression3()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("not 5");
        codes.add("(4)");
        codes.add("a[3]");
        codes.add("9");
        codes.add("::foo()");
        codes.add("3.2");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.expression3();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testCallExpression()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("::foo()");
        codes.add("::foo(3)");
        codes.add("::foo(3,4,7,8)");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.call_expression();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testExpressionList()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("");
        codes.add("3");
        codes.add("3,4,7,4 and 7");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.expression_list();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testParameter()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("a : void");
        codes.add("main : grue");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.parameter();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testParameterList()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("");
        codes.add("a : void");
        codes.add("main : grue, b : gorn, c:int, d:void");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.parameter_list();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testVariableDeclaration()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("var id : type;");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.variable_declaration();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testArrayDeclaration()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("array a : void[3];");
        codes.add("array a : void[3] [4] [5];");
        
		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.array_declaration();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testFunctionDefinition()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("func id() : type {}");
        codes.add("func id(id:void) : type {}");
        codes.add("func id(id1:void,id2:void,id3:void) : type {}");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.function_definition();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testDeclaration()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("var id : type;");
        codes.add("array a : void [3][4][5];");
        codes.add("func id(id1:void,id2:void,id3:void) : type {}");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.declaration();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testDeclarationList()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("");
        codes.add("var id : type;");
        codes.add("array a : void [3][4][5];");
        codes.add("func id(id1:void,id2:void,id3:void) : type {}");
        codes.add("var id:type; array a:void[3]; func id(id1:void,id2:void,id3:void):type{}");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.declaration_list();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
		
	@Test
	public void testAssignmentStatement()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("let a = 5;");
        codes.add("let a[4][0] = 7 and 9;");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.assignment_statement();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testCallStatement()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("::foo();");
        codes.add("::foo(a[4][0], 7 and 9);");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.call_statement();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testIfStatement()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("if a < b {}");
        codes.add("if (a>b) {} else {}");
        // TODO: force that the condition cannot be empty

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.if_statement();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}

	@Test
	public void testWhileStatement()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("while a < b {}");
        // TODO: force that the condition cannot be empty

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.while_statement();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
		
	@Test
	public void testReturnStatement()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("return ::gorn();");
        codes.add("return 02344;");
        codes.add("return 02344 + soeth - ou / 3;");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.return_statement();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testStatement()
	{
		ArrayList<String> codes = new ArrayList<String>();
	    codes.add("var id : type;");
        codes.add("array a : void[3][4][5];");
        codes.add("let a = 5;");
        codes.add("let a[4][0] = 7 and 9;");
        codes.add("::foo();");
        codes.add("::foo(a[4][0], 7 and 9);");
        codes.add("if a < b {}");
        codes.add("if (a>b) {} else {}");
        codes.add("while a < b {}");
        codes.add("return ::gorn();");
        codes.add("return 02344;");
        codes.add("return 02344 + soeth - ou / 3;");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);
        	
			parser.statement();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
		
	@Test
	public void testStatementList()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("");
        codes.add("let a=5;");
        codes.add("let a=5; let b=7; if (false) {} while (true) {}");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.statement_list();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testStatementBlock()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("{}");
        codes.add("{let a=5;}");
        codes.add("{let a=5; let b=7; if (false) {} while (true) {}}");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.statement_block();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testProgram()
	{
		ArrayList<String> codes = new ArrayList<String>();
        codes.add("");
        codes.add("func main() : void {let a=5;}");
        codes.add("func main():void{let a=5;} func foo():void{} array a:gorn[0]; var b:void;");

		for (String code : codes) {
			Scanner scanner = new Scanner(new StringReader(code));
        	Parser parser = new Parser(scanner);

			parser.program();
			Assert.assertTrue(scanner.next().is(Token.Kind.EOF));
		}
	}
	
	@Test
	public void testCode()
	{
		String code = "func random(): int { return 5; }";
		
		Scanner scanner = new Scanner(new StringReader(code));
		Parser parser = new Parser(scanner);
		
		parser.program();
	}
}
