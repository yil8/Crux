package tests;

import static org.junit.Assert.*;
import java.io.StringReader;
import org.junit.Test;

import crux.Parser;
import crux.Scanner;
import types.*;

public class TypeTest {
	
	private TypeChecker compile(String code)
	{
		Scanner s = new Scanner(new StringReader(code));
		Parser p = new Parser(s);
		ast.Command syntaxTree = p.parse();
		assert(!p.hasError());
		TypeChecker tc = new TypeChecker();
		tc.check(syntaxTree);
		return tc;
	}

	@Test
	public void testVoidRecursion() {
		String code = "func main() : void { return ::main(); }";
		TypeChecker tc = compile(code);
		
		assertFalse(tc.errorReport(), tc.hasError());
	}
	
	@Test
	public void testRecursiveCallWithParams() {
		String code = "func main(p:int) : int { return ::main(p); }";
		TypeChecker tc = compile(code);
		
		assertFalse(tc.errorReport(), tc.hasError());
	}
	
	@Test
	public void testReturnMatchesFunction() {
		String codeInt = "func main(a:int) : int { return a; }";
		TypeChecker tcInt = compile(codeInt);
		assertFalse(tcInt.errorReport(), tcInt.hasError());
		
		String codeFloat = "func main(a:float) : float { return a; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertFalse(tcFloat.errorReport(), tcFloat.hasError());
		
		String codeBool = "func main(a:bool) : bool { return a; }";
		TypeChecker tcBool = compile(codeBool);
		assertFalse(tcBool.errorReport(), tcBool.hasError());
		
		String codeIntFloat = "func main(a:int) : float { return a; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("returns float not int"));
		
		String codeIntBool = "func main(a:int) : bool { return a; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("returns bool not int"));
		
		String codeBoolFloat = "func main(a:bool) : float { return a; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("returns float not bool"));
		
		String codeBoolInt = "func main(a:bool) : int { return a; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("returns int not bool"));
		
		String codeFloatInt = "func main(a:float) : int { return a; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("returns int not float"));
		
		String codeFloatBool = "func main(a:float) : bool { return a; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("returns bool not float"));
	}
	
	@Test 
	public void testNoVoidArguments()
	{
		String code = "func main(p1:void) : void { return ::main(p1); }";
		TypeChecker tc = compile(code);
		assertTrue(tc.errorReport().contains("has a void argument"));
	}
		
	@Test
	public void testErrorArguments()
	{
		String code = "func main(p1:error) : void { return ::main(p1); }";
		TypeChecker tc = compile(code);
		assertTrue(tc.errorReport().contains("has an error in argument"));
	}
	
	@Test
	public void testAddition() {
		String codeInt = "func main(p1:int, p2:int) : int { return p1+p2; }";
		TypeChecker tcInt = compile(codeInt);
		assertFalse(tcInt.errorReport(), tcInt.hasError());
		
		String codeFloat = "func main(p1:float, p2:float) : float { return p1+p2; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertFalse(tcFloat.errorReport(), tcFloat.hasError());
		
		String codeBool = "func main(p1:bool, p2:bool) : void { return p1+p2; }";
		TypeChecker tcBool = compile(codeBool);
		assertTrue(tcBool.errorReport().contains("Cannot add bool with bool"));
		
		String codeFloatInt = "func main(p1:float, p2:int) : void { return p1+p2; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("Cannot add float with int"));
		
		String codeIntFloat = "func main(p1:int, p2:float) : void { return p1+p2; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("Cannot add int with float"));
		
		String codeFloatBool = "func main(p1:float, p2:bool) : void { return p1+p2; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("Cannot add float with bool"));
		
		String codeIntBool = "func main(p1:int, p2:bool) : void { return p1+p2; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("Cannot add int with bool"));
		
		String codeBoolFloat = "func main(p1:bool, p2:float) : void { return p1+p2; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("Cannot add bool with float"));
		
		String codeBoolInt = "func main(p1:bool, p2:int) : void { return p1+p2; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("Cannot add bool with int"));
	}

	
	@Test
	public void testSubtraction() {
		String codeInt = "func main(p1:int, p2:int) : int { return p1-p2; }";
		TypeChecker tcInt = compile(codeInt);
		assertFalse(tcInt.errorReport(), tcInt.hasError());
		
		String codeFloat = "func main(p1:float, p2:float) : float { return p1-p2; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertFalse(tcFloat.errorReport(), tcFloat.hasError());
		
		String codeBool = "func main(p1:bool, p2:bool) : void { return p1-p2; }";
		TypeChecker tcBool = compile(codeBool);
		assertTrue(tcBool.errorReport().contains("Cannot subtract bool from bool"));
		
		String codeFloatInt = "func main(p1:float, p2:int) : void { return p1-p2; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("Cannot subtract int from float"));
		
		String codeIntFloat = "func main(p1:int, p2:float) : void { return p1-p2; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("Cannot subtract float from int"));
		
		String codeFloatBool = "func main(p1:float, p2:bool) : void { return p1-p2; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("Cannot subtract bool from float"));
		
		String codeIntBool = "func main(p1:int, p2:bool) : void { return p1-p2; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("Cannot subtract bool from int"));
		
		String codeBoolFloat = "func main(p1:bool, p2:float) : void { return p1-p2; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("Cannot subtract float from bool"));
		
		String codeBoolInt = "func main(p1:bool, p2:int) : void { return p1-p2; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("Cannot subtract int from bool"));
	}
	
	@Test
	public void testMultiplication() {
		String codeInt = "func main(p1:int, p2:int) : int { return p1*p2; }";
		TypeChecker tcInt = compile(codeInt);
		assertFalse(tcInt.errorReport(), tcInt.hasError());
		
		String codeFloat = "func main(p1:float, p2:float) : float { return p1*p2; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertFalse(tcFloat.errorReport(), tcFloat.hasError());
		
		String codeBool = "func main(p1:bool, p2:bool) : void { return p1*p2; }";
		TypeChecker tcBool = compile(codeBool);
		assertTrue(tcBool.errorReport().contains("Cannot multiply bool with bool"));
		
		String codeFloatInt = "func main(p1:float, p2:int) : void { return p1*p2; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("Cannot multiply float with int"));
		
		String codeIntFloat = "func main(p1:int, p2:float) : void { return p1*p2; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("Cannot multiply int with float"));
		
		String codeFloatBool = "func main(p1:float, p2:bool) : void { return p1*p2; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("Cannot multiply float with bool"));
		
		String codeIntBool = "func main(p1:int, p2:bool) : void { return p1*p2; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("Cannot multiply int with bool"));
		
		String codeBoolFloat = "func main(p1:bool, p2:float) : void { return p1*p2; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("Cannot multiply bool with float"));
		
		String codeBoolInt = "func main(p1:bool, p2:int) : void { return p1*p2; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("Cannot multiply bool with int"));
	}

	@Test
	public void testDivision() {
		String codeInt = "func main(p1:int, p2:int) : int { return p1/p2; }";
		TypeChecker tcInt = compile(codeInt);
		assertFalse(tcInt.errorReport(), tcInt.hasError());
		
		String codeFloat = "func main(p1:float, p2:float) : float { return p1/p2; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertFalse(tcFloat.errorReport(), tcFloat.hasError());
		
		String codeBool = "func main(p1:bool, p2:bool) : void { return p1/p2; }";
		TypeChecker tcBool = compile(codeBool);
		assertTrue(tcBool.errorReport().contains("Cannot divide bool by bool"));
		
		String codeFloatInt = "func main(p1:float, p2:int) : void { return p1/p2; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("Cannot divide float by int"));
		
		String codeIntFloat = "func main(p1:int, p2:float) : void { return p1/p2; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("Cannot divide int by float"));
		
		String codeFloatBool = "func main(p1:float, p2:bool) : void { return p1/p2; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("Cannot divide float by bool"));
		
		String codeIntBool = "func main(p1:int, p2:bool) : void { return p1/p2; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("Cannot divide int by bool"));
		
		String codeBoolFloat = "func main(p1:bool, p2:float) : void { return p1/p2; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("Cannot divide bool by float"));
		
		String codeBoolInt = "func main(p1:bool, p2:int) : void { return p1/p2; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("Cannot divide bool by int"));
	}

	@Test
	public void testComparison()
	{
		String codeInt = "func main(p1:int, p2:int) : bool { return p1 >= p2; }";
		TypeChecker tcInt = compile(codeInt);
		assertFalse(tcInt.errorReport(), tcInt.hasError());
		
		String codeFloat = "func main(p1:float, p2:float) : bool { return p1 >= p2; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertFalse(tcFloat.errorReport(), tcFloat.hasError());
		
		String codeBool = "func main(p1:bool, p2:bool) : void { return p1 >= p2; }";
		TypeChecker tcBool = compile(codeBool);
		assertTrue(tcBool.errorReport().contains("Cannot compare bool with bool"));
		
		String codeFloatInt = "func main(p1:float, p2:int) : void { return p1 >= p2; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("Cannot compare float with int"));
		
		String codeIntFloat = "func main(p1:int, p2:float) : void { return p1 >= p2; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("Cannot compare int with float"));
		
		String codeFloatBool = "func main(p1:float, p2:bool) : void { return p1 >= p2; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("Cannot compare float with bool"));
		
		String codeIntBool = "func main(p1:int, p2:bool) : void { return p1 >= p2; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("Cannot compare int with bool"));
		
		String codeBoolFloat = "func main(p1:bool, p2:float) : void { return p1 >= p2; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("Cannot compare bool with float"));
		
		String codeBoolInt = "func main(p1:bool, p2:int) : void { return p1 >= p2; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("Cannot compare bool with int"));
	}
	
	@Test
	public void testLogicalAnd()
	{
		String codeInt = "func main(p1:int, p2:int) : void { return p1 and p2; }";
		TypeChecker tcInt = compile(codeInt);
		assertTrue(tcInt.errorReport().contains("Cannot compute int and int"));
		
		String codeFloat = "func main(p1:float, p2:float) : void { return p1 and p2; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertTrue(tcFloat.errorReport().contains("Cannot compute float and float"));
		
		String codeBool = "func main(p1:bool, p2:bool) : bool { return p1 and p2; }";
		TypeChecker tcBool = compile(codeBool);
		assertFalse(tcBool.errorReport(), tcBool.hasError());
		
		String codeFloatInt = "func main(p1:float, p2:int) : void { return p1 and p2; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("Cannot compute float and int"));
		
		String codeIntFloat = "func main(p1:int, p2:float) : void { return p1 and p2; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("Cannot compute int and float"));
		
		String codeFloatBool = "func main(p1:float, p2:bool) : void { return p1 and p2; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("Cannot compute float and bool"));
		
		String codeIntBool = "func main(p1:int, p2:bool) : void { return p1 and p2; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("Cannot compute int and bool"));
		
		String codeBoolFloat = "func main(p1:bool, p2:float) : void { return p1 and p2; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("Cannot compute bool and float"));
		
		String codeBoolInt = "func main(p1:bool, p2:int) : void { return p1 and p2; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("Cannot compute bool and int"));
	}
	
	@Test
	public void testLogicalOr()
	{
		String codeInt = "func main(p1:int, p2:int) : void { return p1 or p2; }";
		TypeChecker tcInt = compile(codeInt);
		assertTrue(tcInt.errorReport().contains("Cannot compute int or int"));
		
		String codeFloat = "func main(p1:float, p2:float) : void { return p1 or p2; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertTrue(tcFloat.errorReport().contains("Cannot compute float or float"));
		
		String codeBool = "func main(p1:bool, p2:bool) : bool { return p1 or p2; }";
		TypeChecker tcBool = compile(codeBool);
		assertFalse(tcBool.errorReport(), tcBool.hasError());
		
		String codeFloatInt = "func main(p1:float, p2:int) : void { return p1 or p2; }";
		TypeChecker tcFloatInt = compile(codeFloatInt);
		assertTrue(tcFloatInt.errorReport().contains("Cannot compute float or int"));
		
		String codeIntFloat = "func main(p1:int, p2:float) : void { return p1 or p2; }";
		TypeChecker tcIntFloat = compile(codeIntFloat);
		assertTrue(tcIntFloat.errorReport().contains("Cannot compute int or float"));
		
		String codeFloatBool = "func main(p1:float, p2:bool) : void { return p1 or p2; }";
		TypeChecker tcFloatBool = compile(codeFloatBool);
		assertTrue(tcFloatBool.errorReport().contains("Cannot compute float or bool"));
		
		String codeIntBool = "func main(p1:int, p2:bool) : void { return p1 or p2; }";
		TypeChecker tcIntBool = compile(codeIntBool);
		assertTrue(tcIntBool.errorReport().contains("Cannot compute int or bool"));
		
		String codeBoolFloat = "func main(p1:bool, p2:float) : void { return p1 or p2; }";
		TypeChecker tcBoolFloat = compile(codeBoolFloat);
		assertTrue(tcBoolFloat.errorReport().contains("Cannot compute bool or float"));
		
		String codeBoolInt = "func main(p1:bool, p2:int) : void { return p1 or p2; }";
		TypeChecker tcBoolInt = compile(codeBoolInt);
		assertTrue(tcBoolInt.errorReport().contains("Cannot compute bool or int"));
	}
	
	@Test
	public void testLogicalNot()
	{
		String codeInt = "func main(p1:int) : void { return not p1; }";
		TypeChecker tcInt = compile(codeInt);
		assertTrue(tcInt.errorReport().contains("Cannot negate int"));
		
		String codeFloat = "func main(p1:float) : void { return not p1; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertTrue(tcFloat.errorReport().contains("Cannot negate float"));
		
		String codeBool = "func main(p1:bool) : bool { return not p1; }";
		TypeChecker tcBool = compile(codeBool);
		assertFalse(tcBool.errorReport(), tcBool.hasError());
	}
	
	@Test
	public void testIfElseBranchRequireBooleanCondition()
	{
		String codeInt = "func main(arg:int) : int { if (arg) {let arg = 3;} return arg; }";
		TypeChecker tcInt = compile(codeInt);
		assertTrue(tcInt.errorReport().contains("IfElseBranch requires bool condition not int")); 
		
		String codeFloat = "func main(arg:float) : float { if (arg) {let arg = 3;} return arg; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertTrue(tcFloat.errorReport().contains("IfElseBranch requires bool condition not float")); 
		
		String codeBool = "func main(arg:bool) : bool { if (arg) {let arg = true;} return arg; }";
		TypeChecker tcBool = compile(codeBool);
		assertFalse(tcBool.errorReport(), tcBool.hasError());
	}
	
	@Test
	public void testWhileLoopRequireBooleanCondition()
	{
		String codeInt = "func main(arg:int) : int { while (arg) {let arg = 3;} return arg; }";
		TypeChecker tcInt = compile(codeInt);
		assertTrue(tcInt.errorReport().contains("WhileLoop requires bool condition not int")); 
		
		String codeFloat = "func main(arg:float) : float { while (arg) {let arg = 3;} return arg; }";
		TypeChecker tcFloat = compile(codeFloat);
		assertTrue(tcFloat.errorReport().contains("WhileLoop requires bool condition not float")); 
		
		String codeBool = "func main(arg:bool) : bool { while (arg) {let arg = true;} return arg; }";
		TypeChecker tcBool = compile(codeBool);
		assertFalse(tcBool.errorReport(), tcBool.hasError());
	}

	@Test
	public void testFunctionMustReturn()
	{
		String codeA = "func main(arg:int) : int { return arg; }";
		TypeChecker tcA = compile(codeA);
		assertFalse(tcA.errorReport(), tcA.hasError());
		
		String codeB = "func main(arg:int) : int { if (true) { return arg; } }";
		TypeChecker tcB = compile(codeB);
		assertTrue(tcB.errorReport().contains("Not all paths"));
		
		String codeC = "func main(arg:int) : int { if (true) { return arg; } else { let arg = 3; } }";
		TypeChecker tcC = compile(codeC);
		assertTrue(tcC.errorReport().contains("Not all paths"));
		
		String codeD = "func main(arg:int) : int { if (true) { return arg; } else { let arg = 3; } let arg = 4; }";
		TypeChecker tcD = compile(codeD);
		assertTrue(tcD.errorReport().contains("Not all paths"));
		
		String codeE = "func main(arg:int) : int { if (true) { let arg = 3; } else { return arg; } }";
		TypeChecker tcE = compile(codeE);
		assertTrue(tcE.errorReport().contains("Not all paths"));
		
		String codeF = "func main(arg:int) : int { if (true) { let arg = 3; } else { return arg; } let arg = 4; }";
		TypeChecker tcF = compile(codeF);
		assertTrue(tcF.errorReport().contains("Not all paths"));
		
		String codeG = "func main(arg:int) : int { if (true) { let arg = 3; } else { return arg; } return arg; }";
		TypeChecker tcG = compile(codeG);
		assertFalse(tcG.errorReport(), tcG.hasError());
		
		String codeH = "func main(arg:int) : int { if (true) { return arg; } else { let arg = 3; } return arg; }";
		TypeChecker tcH = compile(codeH);
		assertFalse(tcH.errorReport(), tcH.hasError());
		
		String codeI = "func main(arg:int) : int { while (true) { let arg = 3; } return arg; }";
		TypeChecker tcI = compile(codeI);
		assertFalse(tcI.errorReport(), tcI.hasError());
		
		String codeJ = "func main(arg:int) : int { while (true) { return arg; } }";
		TypeChecker tcJ = compile(codeJ);
		assertTrue(tcJ.errorReport().contains("Not all paths"));
		
		String codeK = "func main(arg:int) : int { while (true) { return arg; } return arg; }";
		TypeChecker tcK = compile(codeK);
		assertFalse(tcK.errorReport(), tcK.hasError());
	}
	
	@Test
	public void testArrayAccess()
	{
		String codeA = "array x : int[4]; func main() : void { ::printInt(x); }";
		TypeChecker tcA = compile(codeA);
		assertTrue(tcA.errorReport().contains("Cannot call"));
		
		String codeB = "array x : int[4][5]; func main() : void { ::printInt(x[1]); }";
		TypeChecker tcB = compile(codeB);
		assertTrue(tcB.errorReport().contains("Cannot call"));
		
		String codeC = "array x : int[4]; func main() : void { ::printInt(x[1][1]); }";
		TypeChecker tcC = compile(codeC);
		assertTrue(tcC.errorReport().contains("Cannot call"));
		
		String codeD = "array x : int[4][5]; func main() : void { ::printInt(x[1][1][1]); }";
		TypeChecker tcD = compile(codeD);
		assertTrue(tcD.errorReport().contains("Cannot call"));
		
		String codeE = "array x : int[4]; func main() : void { let x[1] = 1; }";
		TypeChecker tcE = compile(codeE);
		assertFalse(tcE.errorReport(), tcE.hasError());
		
		String codeF = "array x : int[4]; var a:int; func main() : void { let a = x[1]; }";
		TypeChecker tcF = compile(codeF);
		assertFalse(tcF.errorReport(), tcF.hasError());
		
		String codeG = "array x : int[4]; array y : int[7][9]; func main() : void { let x[y[1][2]] = x[y[1][1]]; }";
		TypeChecker tcG = compile(codeG);
		assertFalse(tcG.errorReport(), tcF.hasError());
	}
	
	@Test
	public void testASTErrorFailsTypeCheck()
	{
		TypeChecker tc = new TypeChecker();
		tc.check(new ast.Error(0,0, "Empty AST"));
		
		assertTrue(tc.hasError());
	}
}
