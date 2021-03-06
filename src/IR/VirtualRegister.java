package IR;

public class VirtualRegister extends Operand {
	public String name;
	public String systemReg;
	public boolean global;

	public VirtualRegister(String name) {
		this.name = name;
		this.systemReg = null;
		this.global = false;
	}

	public String getName() {
		return name;
	}

	@Override
	public String toString() {
		if(ProgramIR.nowFunction != null && ProgramIR.nowFunction.registerMap.containsKey(this)){
			return "$" + name + "(" + ProgramIR.nowFunction.registerMap.get(this) + ")";
		}
		return "$" + name + "(" + systemReg + ")";
	}
}
