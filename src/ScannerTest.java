package crux;

import static org.junit.Assert.*;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.LinkedList;

import org.junit.Assert;
import org.junit.Test;


public class ScannerTest {
	
	@Test
	public void testAssign()
	{
		String test = "=";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("=", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testEqual()
	{
		String test = "==";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("==", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testEqualAssign()
	{
		String test = "===";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("==", 1, 1));
		expected.add(new Token("=", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testEqualEqual()
	{
		String test = "====";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("==", 1, 1));
		expected.add(new Token("==", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testBangNotEqualAssign()
	{
	    String test = "!!==";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(Token.Error("Unexpected character: !", 1, 1));
		expected.add(new Token("!=", 1, 2));
		expected.add(new Token("=", 1, 4));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testHTMLcomment()
	{
		String test = "<!--";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("<", 1, 1));
		expected.add(Token.Error("Unexpected character: !", 1, 2));
		expected.add(new Token("-", 1, 3));
		expected.add(new Token("-", 1, 4));
			
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner) {
			System.out.println(tok);
			actual.add(tok);
		}
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testLessThan()
	{
		String test = "<";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("<", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testLesserEqual()
	{
		String test = "<=";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("<=", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testLesserEqualAssign()
	{
		String test = "<==";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("<=", 1, 1));
		expected.add(new Token("=", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testLesserEqualEqual()
	{
		String test = "<===";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("<=", 1, 1));
		expected.add(new Token("==", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testGreaterThan()
	{
		String test = ">";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token(">", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testGreaterEqual()
	{
		String test = ">=";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token(">=", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testGreaterEqualAssign()
	{
		String test = ">==";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token(">=", 1, 1));
		expected.add(new Token("=", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testGreaterEqualEqual()
	{
		String test = ">===";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token(">=", 1, 1));
		expected.add(new Token("==", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testColon()
	{
		String test = ":";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token(":", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
		
	@Test
	public void testCall()
	{
		String test = "::";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("::", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testCallColon()
	{
		String test = ":::";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("::", 1, 1));
		expected.add(new Token(":", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testCallCall()
	{
		String test = "::::";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(new Token("::", 1, 1));
		expected.add(new Token("::", 1, 3));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testInteger()
	{
		String test = "1";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(Token.Integer("1", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
				
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testFloatWithoutTrailing()
	{
		String test = "1.";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(Token.Float("1.", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testFloatWithTrailing()
	{
		String test = "1.0";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(Token.Float("1.0", 1, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testConcatenatedFloats()
	{
		String test = "1.0.8.9";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(Token.Float("1.0", 1, 1));
		expected.add(Token.Error("Unexpected character: .", 1, 4));
		expected.add(Token.Float("8.9", 1, 5));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(test));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testKeywords()
	{
		String code = "or and not let var array func true false if else while return";
		
		ArrayList<Token.Kind> expected = new ArrayList<Token.Kind>();
		expected.add(Token.Kind.OR);
		expected.add(Token.Kind.AND);
		expected.add(Token.Kind.NOT);
		expected.add(Token.Kind.LET);
		expected.add(Token.Kind.VAR);
		expected.add(Token.Kind.ARRAY);
		expected.add(Token.Kind.FUNC);
		expected.add(Token.Kind.TRUE);
		expected.add(Token.Kind.FALSE);
		expected.add(Token.Kind.IF);
		expected.add(Token.Kind.ELSE);
		expected.add(Token.Kind.WHILE);
		expected.add(Token.Kind.RETURN);
		
		Scanner scanner = new Scanner(new StringReader(code));
		int index = 0;
		for (Token tok : scanner)
			Assert.assertTrue(tok.is(expected.get(index++)));
	}
	
	@Test
	public void testOperations()
	{
		String code = "(){}[]+-*/>=<=!===>< =,; : ::";
		
		ArrayList<Token.Kind> expected = new ArrayList<Token.Kind>();
		expected.add(Token.Kind.OPEN_PAREN);
		expected.add(Token.Kind.CLOSE_PAREN);
		expected.add(Token.Kind.OPEN_BRACE);
		expected.add(Token.Kind.CLOSE_BRACE);
		expected.add(Token.Kind.OPEN_BRACKET);
		expected.add(Token.Kind.CLOSE_BRACKET);
		expected.add(Token.Kind.ADD);
		expected.add(Token.Kind.SUB);
		expected.add(Token.Kind.MUL);
		expected.add(Token.Kind.DIV);
		expected.add(Token.Kind.GREATER_EQUAL);
		expected.add(Token.Kind.LESSER_EQUAL);
		expected.add(Token.Kind.NOT_EQUAL);
		expected.add(Token.Kind.EQUAL);
		expected.add(Token.Kind.GREATER_THAN);
		expected.add(Token.Kind.LESS_THAN);
		expected.add(Token.Kind.ASSIGN);
		expected.add(Token.Kind.COMMA);
		expected.add(Token.Kind.SEMICOLON);
		expected.add(Token.Kind.COLON);
		expected.add(Token.Kind.CALL);
	
		Scanner scanner = new Scanner(new StringReader(code));
		
		int index = 0;
		for (Token tok : scanner) {
			Assert.assertTrue(tok.is(expected.get(index++)));
		}
	}
	
	@Test
	public void testTokenNamesAreIdentifiers()
	{
		String code = "";
		ArrayList<Token.Kind> expected = new ArrayList<Token.Kind>();
		for (Token.Kind kind : Token.Kind.values()) {
			code += kind.name() + " ";
			expected.add(Token.Kind.IDENTIFIER);
		}
		expected.add(Token.Kind.EOF);
	
		Scanner scanner = new Scanner(new StringReader(code));
		
		int index = 0;
		for (Token tok : scanner) {
			Assert.assertTrue(tok.is(expected.get(index++)));
		}
	}
	
	@Test
	public void testComment()
	{
		String code = "test //==gorn;\nmain";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(Token.Identifier("test", 1, 1));
		expected.add(Token.Identifier("main", 2, 1));
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(code));
		for (Token tok : scanner)
			actual.add(tok);
		
	    Assert.assertEquals(expected, actual);
	}
		
	@Test
	public void testIdentifierPatterns()
	{
		String code = "_gorn\n__\nGoRn\n_0234_3";
		
		ArrayList<Token> expected = new ArrayList<Token>();
		expected.add(Token.Identifier("_gorn", 1, 1));
		expected.add(Token.Identifier("__", 2, 1));
		expected.add(Token.Identifier("GoRn", 3, 1));
		expected.add(Token.Identifier("_0234_3", 4, 1)); 
		
		ArrayList<Token> actual = new ArrayList<Token>();
		Scanner scanner = new Scanner(new StringReader(code));
		for (Token tok : scanner) {
			System.out.println("received: " + tok);
			actual.add(tok);
		}
		
	    Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void testBooleanLiterals()
	{
		String code = "true false";
		
		ArrayList<Token.Kind> expected = new ArrayList<Token.Kind>();
		expected.add(Token.Kind.TRUE);
		expected.add(Token.Kind.FALSE);
		expected.add(Token.Kind.EOF);
		
		Scanner scanner = new Scanner(new StringReader(code));
		
		int index = 0;
		for (Token tok : scanner)
			Assert.assertTrue(tok.is(expected.get(index++)));
	}
	
}
