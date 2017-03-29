package AST.Expression.BinaryOperation;


import AST.Constant.BoolConstant;
import AST.Constant.IntConstant;
import AST.Expression.Expression;
import AST.Type.*;
import Utility.CompilationError;
import Utility.Utility;

public class BinaryGreaterEqual extends Expression{
	private Expression leftExpression, rightExpression;

	private BinaryGreaterEqual(Expression leftExpression, Expression rightExpressoin){
		super(BoolType.getInstance(), false);
		this.leftExpression = leftExpression;
		this.rightExpression = rightExpressoin;
	}
	public Expression getExpression(Expression leftExpression, Expression rightExpressoin){
		if(!(leftExpression.getType() instanceof IntType) ||
				!(rightExpressoin.getType() instanceof IntType)){
			throw new CompilationError("binary greater equal needs int");
		}
		return new BinaryGreaterEqual(leftExpression, rightExpressoin);
	}
	@Override
	public String toString(){
		return "binary greater equal";
	}
	@Override
	public String toString(int indents){
		return Utility.getIndent(indents) + "[binary greater equal]\n"
				+ leftExpression.toString(indents + 1)
				+ rightExpression.toString(indents + 1);
	}
}
