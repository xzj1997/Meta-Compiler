package AST.Expression;


import IR.*;
import IR.Instruction.Instruction;
import IR.Instruction.MoveInstruction;
import Utility.CompilationError;
import Utility.Utility;

import java.util.List;

public class AssignmentExpression extends Expression {
	private Expression leftExpression, rightExpression;

	private AssignmentExpression(Expression leftExpression, Expression rightExpression) {
		super(leftExpression.getType(), true);
		this.leftExpression = leftExpression;
		this.rightExpression = rightExpression;
	}

	public static Expression getExpression(Expression leftExpression, Expression rightExpression) {
		if (!(leftExpression.getLeftValue())) {
			throw new CompilationError("The left expression in assignment should be left-value");
		}
		if (!(leftExpression.getType().compatibleWith(rightExpression.getType()))) {
			throw new CompilationError("Assignment needs two compatible type");
		}
		return new AssignmentExpression(leftExpression, rightExpression);
	}

	@Override
	public String toString() {
		return "assignment";
	}

	@Override
	public String toString(int indents) {
		return Utility.getIndent(indents) + "[assignment]\n"
				+ leftExpression.toString(indents + 1)
				+ rightExpression.toString(indents + 1);
	}

	@Override
	public void generateInstruction(List<Instruction> instructionList) {
		leftExpression.generateInstruction(instructionList);
		rightExpression.generateInstruction(instructionList);
		operand = leftExpression.operand;
		if (leftExpression.operand instanceof Address && rightExpression.operand instanceof Address) {
			VirtualRegister tmp = RegisterManager.getTemporaryRegister();
			instructionList.add(new MoveInstruction(tmp, rightExpression.operand));
			instructionList.add(new MoveInstruction(leftExpression.operand, tmp));
		} else {
			instructionList.add(new MoveInstruction(leftExpression.operand, rightExpression.operand));
		}
	}
}
