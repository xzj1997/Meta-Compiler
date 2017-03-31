package AST.Expression.BinaryOperation;


import AST.Constant.BoolConstant;
import AST.Constant.IntConstant;
import AST.Expression.Expression;
import AST.Type.*;
import Utility.CompilationError;
import Utility.Utility;

public class BinaryLessEqual extends Expression{
	private Expression leftExpression, rightExpression;

	private BinaryLessEqual(Expression leftExpression, Expression rightExpression){
		super(BoolType.getInstance(), false);
		this.leftExpression = leftExpression;
		this.rightExpression = rightExpression;
	}
	public static Expression getExpression(Expression leftExpression, Expression rightExpression){
		Type leftType = leftExpression.getType();
		Type rightType = rightExpression.getType();
		if(leftType instanceof IntType && rightType instanceof IntType){
			return new BinaryLessEqual(leftExpression, rightExpression);
		}
		if(leftType instanceof StringType && rightType instanceof StringType){
			return new BinaryLessEqual(leftExpression, rightExpression);
		}
		throw new CompilationError("binary less equal needs int or string");
	}
	@Override
	public String toString(){
		return "binary less equal";
	}
	@Override
	public String toString(int indents){
		return Utility.getIndent(indents) + "[binary less equal]\n"
				+ leftExpression.toString(indents + 1)
				+ rightExpression.toString(indents + 1);
	}
}