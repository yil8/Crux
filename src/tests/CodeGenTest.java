package tests;

import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.StringBufferInputStream;
import java.io.StringReader;

import org.junit.Test;

import crux.Parser;
import crux.Scanner;
import types.*;

public class CodeGenTest {
	
	private String simulate(String code, String input)
	{
		try {
		Scanner s = new Scanner(new StringReader(code));
		Parser p = new Parser(s);
		ast.Command syntaxTree = p.parse();
		assertFalse(p.errorReport(), p.hasError());
		
		TypeChecker tc = new TypeChecker();
		tc.check(syntaxTree);
		assertFalse(tc.errorReport(), tc.hasError());
		
		mips.CodeGen cg = new mips.CodeGen(tc);
		cg.generate(syntaxTree);
		assertFalse(cg.errorReport(), cg.hasError());
		
		mips.Program prog = cg.getProgram();
		File asmFile = File.createTempFile("prog", ".asm");
		PrintStream ps = new PrintStream(asmFile);
		prog.print(ps);
		ps.close();
		
		Process spim = Runtime.getRuntime().exec("spim -file " + asmFile);
		spim.getOutputStream().write(input.getBytes());
		spim.getOutputStream().flush();
		
		// wait for spim to execute
		Thread.sleep(100);
		
		// read back what spim produced
		StringBuffer output = new StringBuffer();
		BufferedReader spimout = new BufferedReader(new InputStreamReader(spim.getInputStream()));
		for (int i=0; i<5; ++i) // skip spim preamble
			spimout.readLine();
		while(spimout.ready())
			output.append((char)spimout.read());
		return output.toString();
		
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	@Test
	public void testPrintBool()
	{
		String code = "func main() : void { ::printBool(true); }";
		assertEquals("true", simulate(code, ""));
	}

	@Test
	public void testPrintInt()
	{
		String code = "func main() : void { ::printInt(7); }";
		assertEquals("7", simulate(code, ""));
	}
	
	@Test
	public void testPrintFloat()
	{
		String code = "func main() : void { ::printFloat(0.5); }";
		assertEquals("0.50000000", simulate(code, ""));
	}
	
	@Test
	public void testPrintln()
	{
		String code = "func main() : void { ::println(); }";
		assertEquals("\n", simulate(code, ""));
	}
	
	@Test
	public void testReadInt()
	{
		String code = "func main() : void { ::readInt(); }";
		assertEquals("int?", simulate(code, "42\n"));
	}
	
	@Test
	public void testReadFloat()
	{
		String code = "func main() : void { ::readFloat(); }";
		assertEquals("float?", simulate(code, "0.5\n"));
	}
	
	@Test
	public void testReadPrintInt()
	{
		String code = "func main() : void { ::printInt(::readInt()); }";
		assertEquals("int?42", simulate(code, "42\n"));
	}
		
	@Test
	public void testReadPrintFloat()
	{
		String code = "func main() : void { ::printFloat(::readFloat()); }";
		assertEquals("float?0.50000000", simulate(code, "0.5\n"));
	}
	
	@Test
	public void testStoreGlobalInt()
	{
		String code = "var a:int; func main() : void { let a = ::readInt(); ::printInt(a); }";
		assertEquals("int?7", simulate(code, "7\n"));
	}	
	
	@Test
	public void testGlobalVarWithMipsName()
	{
		String code = "var addi:int; func main() : void { let addi = ::readInt(); ::printInt(addi); }";
		assertEquals("int?7", simulate(code, "7\n"));
	}
	
	@Test
	public void testFuncWithMipsName()
	{
		String code = "func addi() : void { ::printInt(7); } func main() : void { ::addi(); }";
		assertEquals("7", simulate(code, ""));
	}
	
	@Test
	public void testStoreGlobalArray()
	{
		String code = "var canary_begin:int; array x:int[3]; var canary_end:int;"
				    + "func main() : void {"
				    + "	let canary_begin = 0;"
				    + "	let canary_end = 0;"
				    + "   let x[0] = 222;"
				    + "   let x[1] = 333; "
				    + "   let x[2] = 444; "
				    + "   ::printInt(canary_begin);"
				    + "   ::printInt(x[0]); ::printInt(x[1]); ::printInt(x[2]);"
				    + "   ::printInt(canary_end);"
				    + "}";
		assertEquals("02223334440", simulate(code, ""));
	}
	
	@Test
	public void testCallFunctionZeroArgument()
	{
		String code = "func myPrint() : void { ::printInt(7); }"
				    + "func main() : void { ::myPrint(); }";
		assertEquals("7", simulate(code, ""));
	}
	
	@Test
	public void testCallFunctionOneArgument()
	{
		String code = "func myPrint(a:int) : void { ::printInt(a); }"
				    + "func main() : void { ::myPrint(1); }";
		assertEquals("1", simulate(code, ""));
	}
	
	@Test
	public void testCallFunctionTwoArgument()
	{
		String code = "func myPrint(a:int,b:int) : void { ::printInt(a); ::printInt(b); }"
				    + "func main() : void { ::myPrint(1,2); }";
		assertEquals("12", simulate(code, ""));
	}
		
	@Test
	public void testCallFunctionThreeArgument()
	{
		String code = "func myPrint(a:int,b:int,c:int) : void { ::printInt(a); ::printInt(b); ::printInt(c);}"
				    + "func main() : void { ::myPrint(1,2,3); }";
		assertEquals("123", simulate(code, ""));
	}
	
	@Test
	public void testCallFunctionFiveArgument()
	{
		String code = "func myPrint(a:int,b:int,c:int,d:int,e:int) : void {"
				    + " ::printInt(a); ::printInt(b); ::printInt(c); ::printInt(d); ::printInt(e);"
				    + "}"
				    + "func main() : void { ::myPrint(1,2,3,4,5); }";
		assertEquals("12345", simulate(code, ""));
	}
	
	@Test
	public void testCallFunctionSevenArgument()
	{
		String code = "func myPrint(a1:int,a2:int,a3:int,a4:int,a5:int,a6:int,a7:int) : void {"
				    + " ::printInt(a1); ::printInt(a2); ::printInt(a3); ::printInt(a4); ::printInt(a5);"
				    + " ::printInt(a6); ::printInt(a7);"
				    + "}"
				    + "func main() : void { ::myPrint(1,2,3,4,5,6,7); }";
		assertEquals("1234567", simulate(code, ""));
	}
	
	@Test
	public void testCallFunctionTwelveArgument()
	{
		String code = "func myPrint(a1:int,a2:int,a3:int,a4:int,a5:int,a6:int,a7:int,a8:int,a9:int,a10:int,a11:int,a12:int) : void {"
				    + " ::printInt(a1); ::printInt(a2); ::printInt(a3); ::printInt(a4); ::printInt(a5);"
				    + " ::printInt(a6); ::printInt(a7); ::printInt(a8); ::printInt(a9); ::printInt(a10);"
				    + " ::printInt(a11); ::printInt(a12);"
				    + "}"
				    + "func main() : void { ::myPrint(1,2,3,4,5,6,7,8,9,10,11,12); }";
		assertEquals("123456789101112", simulate(code, ""));
	}
	
	@Test
	public void testReturnInt()
	{
		String code = "func myInt() : int { return 7; }"
				    + "func main() : void { ::printInt(::myInt()); }";
		assertEquals("7", simulate(code, ""));
	}
		
	@Test
	public void testReturnFloat()
	{
		String code = "func myFloat() : float { return 0.5; }"
				    + "func main() : void { ::printFloat(::myFloat()); }";
		assertEquals("0.50000000", simulate(code, ""));
	}
	
	@Test
	public void testNonVoidStatements()
	{
		String code = "func myInt(a:int) : int { ::printInt(a); return a; }"
		            + "func myPrint() : void {"
		            + "   ::myInt(7);"
		            + "   ::myInt(8);"
		            + "   ::myInt(9);"
		            + "}"
		            + "func main() : void { ::myPrint(); }";
		assertEquals("789", simulate(code, ""));
	}
	
	@Test
	public void testAddFloat()
	{
		String code = "func main() : void { ::printFloat(0.5+0.5); }";
		assertEquals("1.00000000", simulate(code, ""));
	}
		
	@Test
	public void testAddInt()
	{
		String code = "func main() : void { ::printInt(1+2); }";
		assertEquals("3", simulate(code, ""));
	}
		
	@Test
	public void testSubFloat()
	{
		String code = "func main() : void { ::printFloat(0.5-0.125); }";
		assertEquals("0.37500000", simulate(code, ""));
	}
		
	@Test
	public void testSubInt()
	{
		String code = "func main() : void { ::printInt(7-5); }";
		assertEquals("2", simulate(code, ""));
	}
	
	@Test
	public void testMulFloat()
	{
		String code = "func main() : void { ::printFloat(0.5*2.0); }";
		assertEquals("1.00000000", simulate(code, ""));
	}
		
	@Test
	public void testMulInt()
	{
		String code = "func main() : void { ::printInt(7*5); }";
		assertEquals("35", simulate(code, ""));
	}

	@Test
	public void testDivFloat()
	{
		String code = "func main() : void { ::printFloat(0.5/2.0); }";
		assertEquals("0.25000000", simulate(code, ""));
	}
		
	@Test
	public void testDivInt()
	{
		String code = "func main() : void { ::printInt(35/5); }";
		assertEquals("7", simulate(code, ""));
	}
	
	@Test
	public void testIfElse()
	{
		String codeA = "func main() : void { if (true) { ::printInt(1); } ::printInt(0-1); }";
		assertEquals("1-1", simulate(codeA, ""));
		
		String codeB = "func main() : void { if (false) { ::printInt(1); } ::printInt(0-1); }";
		assertEquals("-1", simulate(codeB, ""));
		
		String codeC = "func main() : void { if (true) { ::printInt(1); } else {::printInt(0);} }";
		assertEquals("1", simulate(codeC, ""));
			
		String codeD = "func main() : void { if (false) { ::printInt(1); } else {::printInt(0);} }";
		assertEquals("0", simulate(codeD, ""));
		
		String codeE = "func main() : void { if (true) { ::printInt(1); } else {::printInt(0);} ::printInt(0-1); }";
		assertEquals("1-1", simulate(codeE, ""));
		
		String codeF = "func main() : void { if (false) { ::printInt(1); } else {::printInt(0);} ::printInt(0-1); }";
		assertEquals("0-1", simulate(codeF, ""));
	}
	
	// return jumps to epilogue
	@Test
	public void testIfElseReturns()
	{
		String codeA = "func t() : int { if (true) { return 1; } return 0-1; }"
				     + "func main() : void { ::printInt(::t()); }";
		assertEquals("1", simulate(codeA, ""));
		
		String codeB = "func f() : int { if (false) { return 1; } return 0-1; }"
				     + "func main() : void { ::printInt(::f()); }";
		assertEquals("-1", simulate(codeB, ""));
		
		String codeC = "func g() : int { if (true) { return 1; } else {return 0;} }"
				     + "func main() : void { ::printInt(::g()); }";
		assertEquals("1", simulate(codeC, ""));
			
		String codeD = "func h() : int { if (false) { return 1; } else {return 0;} }"
				     + "func main() : void { ::printInt(::h()); }";
		assertEquals("0", simulate(codeD, ""));
		
		String codeE = "func i() : int { if (true) { ::printInt(1); } else {::printInt(0);} return 0-1; }"
				     + "func main() : void { ::printInt(::i()); }";
		assertEquals("1-1", simulate(codeE, ""));
		
		String codeF = "func i() : int { if (false) { ::printInt(1); } else {::printInt(0);} return 0-1; }"
				     + "func main() : void { ::printInt(::i()); }";
		assertEquals("0-1", simulate(codeF, ""));
	}
	
	@Test
	public void testComparisonsInt()
	{
		String code = "func blt(a:int, b:int) : bool { return a < b; }"
				    + "func ble(a:int, b:int) : bool { return a <= b; }"
				    + "func beq(a:int, b:int) : bool { return a == b; }"
				    + "func bne(a:int, b:int) : bool { return a != b; }"
				    + "func bge(a:int, b:int) : bool { return a >= b; }"
				    + "func bgt(a:int, b:int) : bool { return a > b; }"
		            + "func main() : void {"
		            + "  ::printBool(::blt(1,2)); ::printBool(::blt(2,1)); ::printBool(::blt(1,1)); ::println();"
		            + "  ::printBool(::ble(1,2)); ::printBool(::ble(2,1)); ::printBool(::ble(1,1)); ::println();"
		            + "  ::printBool(::beq(1,2)); ::printBool(::beq(2,1)); ::printBool(::beq(1,1)); ::println();"
		            + "  ::printBool(::bne(1,2)); ::printBool(::bne(2,1)); ::printBool(::bne(1,1)); ::println();"
		            + "  ::printBool(::bge(1,2)); ::printBool(::bge(2,1)); ::printBool(::bge(1,1)); ::println();"
		            + "  ::printBool(::bgt(1,2)); ::printBool(::bgt(2,1)); ::printBool(::bgt(1,1)); ::println();"
		            + "}";
		assertEquals("truefalsefalse\ntruefalsetrue\nfalsefalsetrue\n" +
				     "truetruefalse\nfalsetruetrue\nfalsetruefalse\n", simulate(code, ""));
	}

	@Test
	public void testComparisonsFloat()
	{
		String code = "func blt(a:float, b:float) : bool { return a < b; }"
				    + "func ble(a:float, b:float) : bool { return a <= b; }"
				    + "func beq(a:float, b:float) : bool { return a == b; }"
				    + "func bne(a:float, b:float) : bool { return a != b; }"
				    + "func bge(a:float, b:float) : bool { return a >= b; }"
				    + "func bgt(a:float, b:float) : bool { return a > b; }"
		            + "func main() : void {"
		            + "  ::printBool(::blt(1.0,2.0)); ::printBool(::blt(2.0,1.0)); ::printBool(::blt(1.0,1.0)); ::println();"
		            + "  ::printBool(::ble(1.0,2.0)); ::printBool(::ble(2.0,1.0)); ::printBool(::ble(1.0,1.0)); ::println();"
		            + "  ::printBool(::beq(1.0,2.0)); ::printBool(::beq(2.0,1.0)); ::printBool(::beq(1.0,1.0)); ::println();"
		            + "  ::printBool(::bne(1.0,2.0)); ::printBool(::bne(2.0,1.0)); ::printBool(::bne(1.0,1.0)); ::println();"
		            + "  ::printBool(::bge(1.0,2.0)); ::printBool(::bge(2.0,1.0)); ::printBool(::bge(1.0,1.0)); ::println();"
		            + "  ::printBool(::bgt(1.0,2.0)); ::printBool(::bgt(2.0,1.0)); ::printBool(::bgt(1.0,1.0)); ::println();"
		            + "}";
		assertEquals("truefalsefalse\ntruefalsetrue\nfalsefalsetrue\n" +
				     "truetruefalse\nfalsetruetrue\nfalsetruefalse\n", simulate(code, ""));
	}
	
	@Test
	public void testLogicAnd() {
		String codeA = "func main() : void { ::printBool(true and true); }";
		assertEquals("true", simulate(codeA, ""));
		
		String codeB = "func main() : void { ::printBool(true and false); }";
		assertEquals("false", simulate(codeB, ""));
		
		String codeC = "func main() : void { ::printBool(false and true); }";
		assertEquals("false", simulate(codeC, ""));
		
		String codeD = "func main() : void { ::printBool(false and false); }";
		assertEquals("false", simulate(codeD, ""));
	}
	
	@Test
	public void testLogicOr() {
		String codeA = "func main() : void { ::printBool(true or true); }";
		assertEquals("true", simulate(codeA, ""));
		
		String codeB = "func main() : void { ::printBool(true or false); }";
		assertEquals("true", simulate(codeB, ""));
		
		String codeC = "func main() : void { ::printBool(false or true); }";
		assertEquals("true", simulate(codeC, ""));
		
		String codeD = "func main() : void { ::printBool(false or false); }";
		assertEquals("false", simulate(codeD, ""));
	}
	
	@Test
	public void testLogicNot() {
		String codeA = "func main() : void { ::printBool(not true); }";
		assertEquals("false", simulate(codeA, ""));
		
		String codeB = "func main() : void { ::printBool(not false); }";
		assertEquals("true", simulate(codeB, ""));
	}
	
	@Test
	public void testWhileLoop() {
		String code = "var a:int; func main() : void { let a=9; while a > 0 { ::printInt(a); let a = a - 1; } }";
		assertEquals("987654321", simulate(code, ""));
	}
	
	@Test
	public void testLocalVars() {
		String code = "func main() : void { var a:int; let a = 4; ::printInt(a); }";
		assertEquals("4", simulate(code, ""));
	}
	
	@Test
	public void testLocalArray() {
		String code = "func main() : void {"
				    + " var canary_begin:int;"
				    + " array x:int[3];"
				    + " var canary_end:int;"
				    + "	let canary_begin = 0;"
				    + "	let canary_end = 0;"
				    + "   let x[0] = 222;"
				    + "   let x[1] = 333;"
				    + "   let x[2] = 444;"
				    + "   ::printInt(canary_begin);"
				    + "   ::printInt(x[0]); ::printInt(x[1]); ::printInt(x[2]);"
				    + "   ::printInt(canary_end);"
				    + "}";
		assertEquals("02223334440", simulate(code, ""));
	}
	
	@Test
	public void testMultiArray() {
		String code = "func main() : void {"
				    + "  var canary_begin:int;"
				    + "  array x:int[3][5];"
				    + "  var canary_end:int;"
				    + "  var outer:int;"
				    + "  var inner:int;"
				    + "  let canary_begin = 0;"
				    + "  let canary_end = 0;"
				    + "  let outer = 4;"
				    + "  let inner = 2;"
				    + "  while (outer >= 0) {"
				    + "    while (inner >= 0) {"
				    + "      let x[inner][outer] = inner * 1000 + outer * 100 + 99;"
				    + "      let inner = inner - 1;"
				    + "    }"
				    + "    let inner = 2;"
				    + "    let outer = outer - 1;"
				    + "  }"
				    + "  let inner = 0;"
				    + "  let outer = 0;"
		            + "  while (outer < 5) {"
		            + "    while (inner < 3) { "
		            + "       ::printInt(x[inner][outer]);"
		            + "       let inner = inner + 1;"
		            + "     }"
		            + "     ::println();"
		            + "     let inner = 0;"
		            + "     let outer = outer + 1;"
		            + "  }"
		            + "  ::printInt(canary_begin);"
		            + "  ::printInt(canary_end);"
		            + "}";
		assertEquals("9910992099\n" +
					 "19911992199\n" +
				     "29912992299\n" +
					 "39913992399\n" +
				     "49914992499\n" +
					 "00", simulate(code, ""));
	}
	
	@Test
	public void testArrayAssignment() {
		String code = "func main() : void {"
				    + "  array a:int[3];"
				    + "  array b:int[10];"
				    + "  let b[5] = 2;"
				    + "  let a[b[5]] = 100;"
				    + "  ::printInt(a[2]);"
				    + "}";
		assertEquals("100", simulate(code, ""));
	}
	
	@Test
	public void testShadowVar() {
		String code = "var a:int;"
				    + "func param(a:int) : void {"
				    + "  let a = 7;"
				    + "  ::printInt(a);"
				    + "}"
				    + "func local() : void {"
				    + "  var a:int;"
				    + "  let a = 9;"
				    + "  ::printInt(a);"
				    + "}"
				    + "func main() : void {"
				    + "  let a = 5;"
				    + "  ::printInt(a);"
				    + "  ::param(8);"
				    + "  ::printInt(a);"
				    + "  ::local();"
				    + "  ::printInt(a);"
				    + "}";
		assertEquals("57595", simulate(code, ""));
	}
	
	@Test
	public void testCallingDifferentSizeFrames()
	{
		String codeA = "func myPrint(a:int) : void {::printInt(a);}"
				     + "func main() : void { array a:int[1]; ::myPrint(7); }";
		assertEquals("7", simulate(codeA, ""));
		
		String codeB = "func myPrint(a:int) : void {::printInt(a);}"
				     + "func main() : void { array a: int[2]; ::myPrint(7); }";
		assertEquals("7", simulate(codeB, ""));
		
		String codeC = "func myPrint(a:int) : void {::printInt(a);}"
				     + "func main() : void { array a: int[3]; ::myPrint(7); }";
		assertEquals("7", simulate(codeC, ""));		
		
		String codeD = "func myPrint(a:int) : void {::printInt(a);}"
				     + "func main() : void { array a: int[6]; ::myPrint(7); }";
		assertEquals("7", simulate(codeD, ""));	
		
		String codeE = "func myPrint(a:int) : void {::printInt(a);}"
				     + "func main() : void { array a: int[5]; ::myPrint(7); }";
		assertEquals("7", simulate(codeE, ""));		
		
		String codeF = "func myPrint(a:int) : void {::printInt(a);}"
				     + "func main() : void { array a: int[7]; ::myPrint(7); }";
		assertEquals("7", simulate(codeF, ""));
		
		String codeG = "func myPrint(a:int) : void {::printInt(a);}"
				     + "func main() : void { array a: int[12]; ::myPrint(7); }";
		assertEquals("7", simulate(codeG, ""));
	}
	
	@Test
	public void testRecursion()
	{
		String code = "func fib(a:int) : int {"
				    + "  if (a <= 0) { return 1; }"
				    + "  return ::fib(a-1) + ::fib(a-2);"
				    + "}"
				    + "func main() : void { ::printInt(::fib(5)); }";
		assertEquals("13", simulate(code, ""));
	}
	
	// test that have must have a function with signature
	// main():void
	
	// test lifting of vars to function scope
	//  => have to change the Symbol Lab, for lifting
	
	@Test
	public void testScopedAccess()
	{
		String code = "func main() : void {"
					+ "  var x : int;"
					+ "  let x = 7;"
					+ "  ::printInt(x);"
					+ "  if (true) { "
					+ "    var x : int;"
					+ "    let x = 8;"
					+ "    ::printInt(x);"
					+ "  }"
					+ "  ::printInt(x);"
					+ "}";
		assertEquals("787", simulate(code, ""));
	}

	
	@Test
	public void testFrameworkStopsInfiniteLoop()
	{
		String code = "func main() : void { var a:int; while (true) { let a = 7;} }";
		assertEquals("", simulate(code, ""));
	}
}
