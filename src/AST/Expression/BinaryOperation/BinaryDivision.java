package AST.Expression.BinaryOperation;


import AST.Constant.IntConstant;
import AST.Expression.Expression;
import AST.Type.*;
import IR.BinaryInstruction;
import IR.Instruction;
import IR.RegisterManager;
import IR.VirtualRegister;
import Utility.CompilationError;
import Utility.Utility;

import java.util.List;

public class BinaryDivision extends Expression{
	private Expression leftExpression, rightExpression;

	private BinaryDivision(Expression leftExpression, Expression rightExpression){
		super(IntType.getInstance(), false);
		this.leftExpression = leftExpression;
		this.rightExpression = rightExpression;
	}
	public static Expression getExpression(Expression leftExpression, Expression rightExpression){
		if(!(leftExpression.getType() instanceof IntType) ||
				!(rightExpression.getType() instanceof IntType)){
			throw new CompilationError("binary division needs int");
		}
		if((leftExpression instanceof IntConstant) && (rightExpression instanceof IntConstant)){
			int leftValue = ((IntConstant) leftExpression).getValue();
			int rightValue = ((IntConstant) rightExpression).getValue();
			return new IntConstant(leftValue / rightValue);
		}
		return new BinaryDivision(leftExpression, rightExpression);
	}
	@Override
	public String toString(){
		return "binary division";
	}
	@Override
	public String toString(int indents){
		return Utility.getIndent(indents) + "[binary division]\n"
				+ leftExpression.toString(indents + 1)
				+ rightExpression.toString(indents + 1);
	}
	@Override
	public void generateInstruction(List<Instruction> instructionList){
		leftExpression.generateInstruction(instructionList);
		rightExpression.generateInstruction(instructionList);
		operand = RegisterManager.getTemporaryRegister();
		Instruction instruction = new BinaryInstruction(BinaryInstruction.BinaryOp.DIV, (VirtualRegister) operand, leftExpression.operand, rightExpression.operand);
		instructionList.add(instruction);
	}
}
