package IR.Instruction;

import IR.Address;
import IR.Operand;
import IR.RegisterManager;
import IR.VirtualRegister;
import Translation.PhysicalOperand.PhysicalOperand;
import Translation.Translator;

public class ReturnInstruction extends Instruction {
	public Operand returnValue;

	public ReturnInstruction(Operand returnValue) {
		this.returnValue = returnValue;
		if (returnValue instanceof VirtualRegister) {
			useSet.add((VirtualRegister) returnValue);
		}
		if (returnValue instanceof Address) {
			useSet.add(((Address) returnValue).base);
		}
	}

	@Override
	public void Prepare() {
		RegisterManager.RegisterStatistics(returnValue);
	}

	@Override
	public String getInstructionOfNASM() {
		StringBuilder str = new StringBuilder();
		PhysicalOperand PhysicalReturnValue = PhysicalOperand.get(str, returnValue);
		str.append(Translator.getInstruction("mov", "rax", PhysicalReturnValue.toString()));
		//str.append(Translator.getInstruction("ret"));
		return str.toString();
	}

	@Override
	public String toString() {
		return String.format("ret %s", returnValue);
	}
}