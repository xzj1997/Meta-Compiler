package AST.Expression;

import AST.Symbol.*;
import AST.Type.*;
import IR.*;
import IR.Instruction.*;
import Utility.*;

import java.util.ArrayList;
import java.util.List;

public class FunctionCallExpression extends Expression {
	private FunctionType function;
	private List<Expression> expressionList;

	private FunctionCallExpression(FunctionType function, List<Expression> expressionList) {
		super(function.getReturnType(), false);
		this.function = function;
		this.expressionList = expressionList;
	}

	public static Expression getExpression(Expression functionExpression, List<Expression> expressionList) {
		if (!(functionExpression.getType() instanceof FunctionType)) {
			throw new CompilationError("Can't find a function");
		}
		FunctionType function = (FunctionType) functionExpression.getType();
		List<Symbol> parameterList = function.getParameterList();
		if (functionExpression instanceof MemberExpression) {
			expressionList.add(0, ((MemberExpression) functionExpression).getExpression());
		} else if (function.getClassScope() != null) {
			expressionList.add(0, IdentifierExpression.getExpression("this"));
		}
		if (parameterList.size() != expressionList.size()) {
			System.out.println(parameterList.size() + " " + expressionList.size());
			throw new CompilationError("The number of parameters doesn't match");
		}
		for (int i = 0; i < parameterList.size(); i++) {
			Type parameterType = parameterList.get(i).getType();
			Type expressionType = expressionList.get(i).getType();
			if (i == 0 && functionExpression instanceof MemberExpression && parameterType == null) {
				continue;
			}
			if (!parameterType.compatibleWith(expressionType)) {
				throw new CompilationError("The type of parameters doesn't match");
			}
		}
		return new FunctionCallExpression(function, expressionList);
	}

	@Override
	public String toString() {
		return "function call";
	}

	@Override
	public String toString(int indents) {
		StringBuilder str = new StringBuilder();
		str.append(Utility.getIndent(indents) + "[function call] " + function.toString() + "\n");
		expressionList.forEach(expression ->
				str.append(expression.toString(indents + 1)));
		return str.toString();
	}

	@Override
	public void generateInstruction(List<Instruction> instructionList) {
		List<Operand> parameterList = new ArrayList<>();
		for (Expression exp : expressionList) {
			exp.generateInstruction(instructionList);
			parameterList.add(exp.operand);
		}
		VirtualRegister tmp = null;
		if (!(function.getReturnType() instanceof VoidType)) {
			tmp = RegisterManager.getTemporaryRegister();
			tmp.systemReg = "rax";
		}
		for (int i = 0; i < 6 && parameterList.size() > 0; i++) {
			VirtualRegister physical = RegisterManager.getTemporaryRegister();
			physical.systemReg = RegisterManager.parameterRegList.get(i);
			instructionList.add(new MoveInstruction(physical, parameterList.get(0)));
			parameterList.remove(0);
		}
		instructionList.add(new FunctionCallInstruction(function, tmp, parameterList));
		if (!(function.getReturnType() instanceof VoidType)) {
			operand = RegisterManager.getTemporaryRegister();
			instructionList.add(new MoveInstruction(operand, tmp));
		}
	}
}
