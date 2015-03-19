package mips;

import ast.*;
import types.*;

public class CodeGen implements ast.CommandVisitor {
	
	private StringBuffer errorBuffer = new StringBuffer();
	private TypeChecker tc;
	private Program program;
	private ActivationRecord currentFunction;

	public CodeGen(TypeChecker tc)
	{
		this.tc = tc;
		this.program = new Program();
	}
	
	public boolean hasError()
	{
		return errorBuffer.length() != 0;
	}
	
	public String errorReport()
	{
		return errorBuffer.toString();
	}
	
	public boolean generate(Command ast)
	{
		currentFunction = ActivationRecord.newGlobalFrame();
		ast.accept(this);
		return !hasError();
	}
	
	public Program getProgram()
	{
		return program;
	}
	
	private String mangleName(String name)
	{
		if (name.equals("main")) {
			return name;
		}
		return "func." + name;
	}

	@Override
	public void visit(ExpressionList node) {
		program.appendInstruction("                     # begin " + node);
		for (Expression e : node)
			e.accept(this);
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(DeclarationList node) {
		program.appendInstruction("                     # begin " + node);
		for (Declaration d : node)
			d.accept(this);
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(StatementList node) {
		program.appendInstruction("                     # begin " + node);
		for (Statement s : node) {
			s.accept(this);
			if (!tc.getType((Command)s).equivalent(new VoidType()))
				program.popInt("$t0");
			if (tc.getType((Command)s) instanceof ErrorType)
				throw new RuntimeException("This should never happen");
		}
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(AddressOf node) {
		program.appendInstruction("                     # begin " + node);
		currentFunction.getAddress(program, "$t0", node.symbol());
		program.pushInt("$t0");
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(LiteralBool node) {
		program.appendInstruction("li $t0, " +node.value().ordinal());
		program.pushInt("$t0");
	}

	@Override
	public void visit(LiteralFloat node) {
		program.appendInstruction("                     # begin " + node);
		program.appendInstruction("li.s $f0, " + node.value() );
		program.pushFloat("$f0");
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(LiteralInt node) {
		program.appendInstruction("                     # begin " + node);
		program.appendInstruction("li  $t1, " + node.value());
		program.pushInt("$t1");
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(VariableDeclaration node) {
		currentFunction.add(program, node);
	}

	@Override
	public void visit(ArrayDeclaration node) {
		currentFunction.add(program, node);
	}

	@Override
	public void visit(FunctionDefinition node) {
		program.appendInstruction("                     # begin " + node);
		currentFunction = new ActivationRecord(node, currentFunction);
		
		int pos = program.appendInstruction(mangleName(node.function().name()) + ":");
		node.body().accept(this);
		
		//System.out.println("creating prologue of size " + currentFunction.stackSize() + " for " + node.function().name());
		program.insertPrologue(pos+1, currentFunction.stackSize());
	    program.appendInstruction(mangleName(currentFunction.name()) + ".epilogue:");
		program.appendEpilogue(currentFunction.stackSize());
		
		currentFunction = currentFunction.parent();
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(Addition node) {
		node.leftSide().accept(this);
		node.rightSide().accept(this);
		
		Type leftType = tc.getType((Command)node.leftSide());
		if (leftType instanceof FloatType) {
			program.popFloat("$f0");
			program.popFloat("$f1");
			program.appendInstruction("add.s $f0, $f0, $f1");
			program.pushFloat("$f0");
		} else if (leftType instanceof IntType) {
			program.popInt("$t0");
			program.popInt("$t1");
			program.appendInstruction("add $t0, $t0, $t1");
			program.pushInt("$t0");
		} else {
			throw new RuntimeException("Addition of " + leftType + "not implemented.");
		}
	}

	@Override
	public void visit(Subtraction node) {
		node.leftSide().accept(this);
		node.rightSide().accept(this);
		
		Type leftType = tc.getType((Command)node.leftSide());
		if (leftType instanceof FloatType) {
			program.popFloat("$f1");
			program.popFloat("$f0");
			program.appendInstruction("sub.s $f0, $f0, $f1");
			program.pushFloat("$f0");
		} else if (leftType instanceof IntType) {
			program.popInt("$t1");
			program.popInt("$t0");
			program.appendInstruction("sub $t0, $t0, $t1");
			program.pushInt("$t0");
		} else {
			throw new RuntimeException("Subtraction of " + leftType + "not implemented.");
		}
	}

	@Override
	public void visit(Multiplication node) {
		node.leftSide().accept(this);
		node.rightSide().accept(this);
		
		Type leftType = tc.getType((Command)node.leftSide());
		if (leftType instanceof FloatType) {
			program.popFloat("$f1");
			program.popFloat("$f0");
			program.appendInstruction("mul.s $f0, $f0, $f1");
			program.pushFloat("$f0");
		} else if (leftType instanceof IntType) {
			program.popInt("$t1");
			program.popInt("$t0");
			program.appendInstruction("mul $t0, $t0, $t1");
			program.pushInt("$t0");
		} else {
			throw new RuntimeException("Multiplication of " + leftType + "not implemented.");
		}
	}

	@Override
	public void visit(Division node) {
		node.leftSide().accept(this);
		node.rightSide().accept(this);
		
		Type leftType = tc.getType((Command)node.leftSide());
		if (leftType instanceof FloatType) {
			program.popFloat("$f1");
			program.popFloat("$f0");
			program.appendInstruction("div.s $f0, $f0, $f1");
			program.pushFloat("$f0");
		} else if (leftType instanceof IntType) {
			program.popInt("$t1");
			program.popInt("$t0");
			program.appendInstruction("div $t0, $t0, $t1");
			program.pushInt("$t0");
		} else {
			throw new RuntimeException("Division of " + leftType + "not implemented.");
		}
	}

	@Override
	public void visit(LogicalAnd node) {
		node.leftSide().accept(this);
		node.rightSide().accept(this);
		
		program.popInt("$t1");
		program.popInt("$t0");
		program.appendInstruction("and $t0, $t0, $t1");
		program.pushInt("$t0");
	}

	@Override
	public void visit(LogicalOr node) {
		node.leftSide().accept(this);
		node.rightSide().accept(this);
		
		program.popInt("$t1");
		program.popInt("$t0");
		program.appendInstruction("or $t0, $t0, $t1");
		program.pushInt("$t0");
	}
	
	@Override
	public void visit(LogicalNot node) {
		node.expression().accept(this);
		
		program.popInt("$t0");
		program.appendInstruction("seq $t0, $t0, $zero");
		program.pushInt("$t0");
	}

	@Override
	public void visit(Comparison node) {
		node.leftSide().accept(this);
		node.rightSide().accept(this);
		
		Type leftType = tc.getType((Command)node.leftSide());
		if (leftType instanceof IntType) {
			program.popInt("$t1");
			program.popInt("$t0");
			switch (node.operation()) {
			case LT: program.appendInstruction("slt $t0, $t0, $t1"); break;
			case LE: program.appendInstruction("sle $t0, $t0, $t1"); break;
			case EQ: program.appendInstruction("seq $t0, $t0, $t1"); break;
			case NE: program.appendInstruction("sne $t0, $t0, $t1"); break;
			case GT: program.appendInstruction("sgt $t0, $t0, $t1"); break;
			case GE: program.appendInstruction("sge $t0, $t0, $t1"); break;
			}
			program.pushInt("$t0");
			
		} else if (leftType instanceof FloatType) {
			program.popFloat("$f2");
			program.popFloat("$f0");
			String branch = "";
			switch (node.operation()) {
			case LT: program.appendInstruction("c.lt.s $f0, $f2"); branch = "bc1t"; break;
			case LE: program.appendInstruction("c.le.s $f0, $f2"); branch = "bc1t"; break;
			case EQ: program.appendInstruction("c.eq.s $f0, $f2"); branch = "bc1t"; break;
			case NE: program.appendInstruction("c.eq.s $f0, $f2"); branch = "bc1f"; break;
			case GE: program.appendInstruction("c.lt.s $f0, $f2"); branch = "bc1f"; break;
			case GT: program.appendInstruction("c.le.s $f0, $f2"); branch = "bc1f"; break;
			}
			String labelTrue = program.newLabel();
			String labelJoin = program.newLabel();
			program.appendInstruction(branch + " " +labelTrue);
			program.appendInstruction("li $t0, 0");
			program.appendInstruction("j " + labelJoin);
			program.appendInstruction(labelTrue+":");
			program.appendInstruction("li $t0, 1");
			program.appendInstruction(labelJoin+":");
			program.pushInt("$t0");
			
		} else {
			throw new RuntimeException("Comparison not implemented for " + leftType);
		}
	}

	@Override
	public void visit(Dereference node) {
		program.appendInstruction("                     # begin " + node);
		node.expression().accept(this);
		program.popInt("$t1");
		program.appendInstruction("lw $t1, 0($t1)");
		program.pushInt("$t1");
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(Index node) {
		program.appendInstruction("                     # begin " + node);
		node.base().accept(this);
		node.amount().accept(this);
		
		Type type = ((AddressType)(tc.getType(node))).base();
		program.popInt("$t2");
		program.popInt("$t1");
		program.appendInstruction("li   $t3, "+ ActivationRecord.numBytes(type));
		program.appendInstruction("mul  $t2, $t2, $t3");
		program.appendInstruction("add  $t1, $t1, $t2");
		program.pushInt("$t1");
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(Assignment node) {
		program.appendInstruction("                     # begin " + node);
		node.destination().accept(this);
		node.source().accept(this);
		
		program.popInt("$t1"); // source value
		program.popInt("$t2"); // destination address
		program.appendInstruction("sw $t1, 0($t2)");
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(Call node) {
		program.appendInstruction("                     # begin " + node);
		node.arguments().accept(this);
		program.appendInstruction("                     # end arguments");
		program.appendInstruction("jal " + mangleName(node.function().name()));
		// pop the arguments
		program.appendInstruction("addi $sp, $sp, "+ 4 * node.arguments().size());
		// put return on the stack, if a non-void function
		if (!tc.getType(node).equivalent(new VoidType()))
			program.pushInt("$v0");
		program.appendInstruction("                     # end " + node);
	}

	@Override
	public void visit(IfElseBranch node) {
		String labelJoin = program.newLabel();
		String labelElse = program.newLabel();
		
		node.condition().accept(this);
		program.popInt("$t1");
		program.appendInstruction("beqz $t1, " + labelElse);
		node.thenBlock().accept(this);
		program.appendInstruction("j " + labelJoin);
		program.appendInstruction(labelElse+":");
		node.elseBlock().accept(this);
		program.appendInstruction(labelJoin+":");
	}

	@Override
	public void visit(WhileLoop node) {
		String labelHeader = program.newLabel();
		String labelJoin = program.newLabel();
		
		program.appendInstruction(labelHeader+":");
		node.condition().accept(this);
		program.popInt("$t1");
		program.appendInstruction("beqz $t1, " + labelJoin);
		node.body().accept(this);
		program.appendInstruction("j " + labelHeader);
		program.appendInstruction(labelJoin+":");
	}

	@Override
	public void visit(Return node) {
		node.argument().accept(this);
		if (!tc.getType((Command)node.argument()).equivalent(new VoidType()))
			program.popInt("$v0");
		// jump to the epilogue
		program.appendInstruction("j " + mangleName(currentFunction.name()) + ".epilogue");
	}

	@Override
	public void visit(ast.Error node) {
		throw new RuntimeException("CodeGen cannot compile an ast.Error.");
	}
}
