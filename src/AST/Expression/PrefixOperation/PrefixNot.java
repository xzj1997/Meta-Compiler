package AST.Expression.PrefixOperation;

import AST.Expression.Expression;
import AST.Type.*;
import IR.*;
import IR.Instruction.*;
import Utility.*;

import java.util.List;

public class PrefixNot extends Expression {
	Expression expression;

	private PrefixNot(Expression expression) {
		super(expression.getType(), false);
		this.expression = expression;
	}

	public static Expression getExpression(Expression expression) {
		if (!(expression.getType() instanceof BoolType)) {
			throw new CompilationError("prefix not needs bool");
		}
		return new PrefixNot(expression);
	}

	@Override
	public String toString() {
		return "prefix not";
	}

	@Override
	public String toString(int indents) {
		return Utility.getIndent(indents) + "[prefix not]\n"
				+ expression.toString(indents + 1);
	}

	@Override
	public void generateInstruction(List<Instruction> instructionList) {
		expression.generateInstruction(instructionList);
		operand = RegisterManager.getTemporaryRegister();
		instructionList.add(new MoveInstruction(operand, expression.operand));
		instructionList.add(new CompareInstruction(operand, new ImmediateOperand(1)));
		instructionList.add(new CsetInstruction(ProgramIR.ConditionOp.NEQ, operand));
	}
}
