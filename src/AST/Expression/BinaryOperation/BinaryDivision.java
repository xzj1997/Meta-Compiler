package AST.Expression.BinaryOperation;


import AST.Constant.IntConstant;
import AST.Expression.Expression;
import AST.Type.*;
import IR.ImmediateOperand;
import IR.Instruction.*;
import IR.Operand;
import IR.RegisterManager;
import Utility.CompilationError;
import Utility.Utility;

import java.util.List;

public class BinaryDivision extends Expression {
	private Expression leftExpression, rightExpression;

	private BinaryDivision(Expression leftExpression, Expression rightExpression) {
		super(IntType.getInstance(), false);
		this.leftExpression = leftExpression;
		this.rightExpression = rightExpression;
	}

	public static Expression getExpression(Expression leftExpression, Expression rightExpression) {
		if (!(leftExpression.getType() instanceof IntType) ||
				!(rightExpression.getType() instanceof IntType)) {
			throw new CompilationError("binary division needs int");
		}
		if ((leftExpression instanceof IntConstant) && (rightExpression instanceof IntConstant)) {
			int leftValue = ((IntConstant) leftExpression).getValue();
			int rightValue = ((IntConstant) rightExpression).getValue();
			return new IntConstant(leftValue / rightValue);
		}
		return new BinaryDivision(leftExpression, rightExpression);
	}

	@Override
	public String toString() {
		return "binary division";
	}

	@Override
	public String toString(int indents) {
		return Utility.getIndent(indents) + "[binary division]\n"
				+ leftExpression.toString(indents + 1)
				+ rightExpression.toString(indents + 1);
	}

	@Override
	public void generateInstruction(List<Instruction> instructionList) {
		leftExpression.generateInstruction(instructionList);
		rightExpression.generateInstruction(instructionList);
		Operand left = leftExpression.operand;
		Operand right = rightExpression.operand;
		if (left == right || (left instanceof ImmediateOperand && right instanceof ImmediateOperand && ((ImmediateOperand) left).value == ((ImmediateOperand) right).value)) {
			operand = new ImmediateOperand(1);
			return;
		}
		if (right instanceof ImmediateOperand && ((ImmediateOperand) right).value == 1) {
			operand = left;
			return;
		}
		operand = RegisterManager.getTemporaryRegister();
		instructionList.add(new MoveInstruction(operand, leftExpression.operand));
		Instruction instruction;
		if (right instanceof ImmediateOperand && ((ImmediateOperand) right).value == 2) {
			instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.SHR, operand, new ImmediateOperand(1));
		}else if (right instanceof ImmediateOperand && ((ImmediateOperand) right).value == 4) {
			instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.SHR, operand, new ImmediateOperand(2));
		}else if (right instanceof ImmediateOperand && ((ImmediateOperand) right).value == 8) {
			instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.SHR, operand, new ImmediateOperand(3));
		}else if (right instanceof ImmediateOperand && ((ImmediateOperand) right).value == 16) {
			instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.SHR, operand, new ImmediateOperand(4));
		}else if (right instanceof ImmediateOperand && ((ImmediateOperand) right).value == 32) {
			instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.SHR, operand, new ImmediateOperand(5));
		}else if (right instanceof ImmediateOperand && ((ImmediateOperand) right).value == 64) {
			instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.SHR, operand, new ImmediateOperand(6));
		}else {
			instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.DIV, operand, rightExpression.operand);
		}
		instructionList.add(instruction);
	}
}
