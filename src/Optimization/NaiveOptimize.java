package Optimization;

import AST.ProgramAST;
import IR.*;
import IR.Instruction.*;
import jdk.nashorn.internal.runtime.FunctionInitializer;

import java.util.HashMap;
import java.util.Map;

public class NaiveOptimize {
	static public void printOptimize(FunctionIR functionIR){
		for(Block block: functionIR.blockList){
			for(int i = 0; i + 3 < block.instructionList.size(); i++){
				if(block.instructionList.get(i) instanceof FunctionCallInstruction &&
						block.instructionList.get(i + 1) instanceof MoveInstruction &&
						block.instructionList.get(i + 2) instanceof MoveInstruction &&
						block.instructionList.get(i + 3) instanceof FunctionCallInstruction){
					FunctionCallInstruction i0 = (FunctionCallInstruction) block.instructionList.get(i);
					MoveInstruction i1 = (MoveInstruction) block.instructionList.get(i + 1);
					MoveInstruction i2 = (MoveInstruction) block.instructionList.get(i + 2);
					FunctionCallInstruction i3 = (FunctionCallInstruction) block.instructionList.get(i + 3);
					if(i0.function.getName().equals("toString") &&
							i1.source instanceof VirtualRegister && functionIR.registerMap.containsKey((VirtualRegister) i1.source) && functionIR.registerMap.get((VirtualRegister) i1.source).equals("rax") &&
							i2.target instanceof VirtualRegister && functionIR.registerMap.containsKey((VirtualRegister) i2.target) && functionIR.registerMap.get((VirtualRegister) i2.target).equals("rdi") &&
							i1.target instanceof VirtualRegister && i1.target == i2.source){
						if(i3.function.getName().equals("print")){
							i3.function = ProgramAST.globalFunctionTable.getFunctionType("print_Int");
							block.instructionList.remove(i);
							block.instructionList.remove(i);
							block.instructionList.remove(i);
						}
						if(i3.function.getName().equals("println")){
							i3.function = ProgramAST.globalFunctionTable.getFunctionType("println_Int");
							block.instructionList.remove(i);
							block.instructionList.remove(i);
							block.instructionList.remove(i);
						}
					}
				}
			}
		}
	}

	static public void moveMerge(FunctionIR functionIR){
		boolean flag = true;
		while (flag) {
			flag = false;
			for (Block block : functionIR.blockList) {
				for (Instruction instruction : block.instructionList) {
					if (instruction instanceof MoveInstruction) {
						Operand target = ((MoveInstruction) instruction).target;
						Operand source = ((MoveInstruction) instruction).source;
						if (target instanceof VirtualRegister && source instanceof VirtualRegister && target != source && !functionIR.registerMap.containsKey((VirtualRegister) target) && !functionIR.registerMap.containsKey((VirtualRegister) source)){
							if(!LivenessAnalysis.edgeMap.containsKey(target)){
								System.out.println(target);
							}
							if(!LivenessAnalysis.edgeMap.get((VirtualRegister) target).contains((VirtualRegister) source)) {
								merge((VirtualRegister) target, (VirtualRegister) source, functionIR);
								flag = true;
								break;
							}
						}
					}
				}
				if (flag) {
					break;
				}
			}
		}
	}

	static public void loopConditionImprovement(FunctionIR functionIR){
		for(Block block: functionIR.blockList){
			for(int i = 0; i + 3 < block.instructionList.size(); i++){
				Instruction i0 = block.instructionList.get(i);
				Instruction i1 = block.instructionList.get(i + 1);
				Instruction i2 = block.instructionList.get(i + 2);
				Instruction i3 = block.instructionList.get(i + 3);
				if(i0 instanceof CompareInstruction && i1 instanceof CsetInstruction && i2 instanceof CompareInstruction && i3 instanceof CjumpInstruction){
					CsetInstruction Cset = (CsetInstruction) i1;
					CompareInstruction Cmp = (CompareInstruction) i2;
					CjumpInstruction Cjump = (CjumpInstruction) i3;
					if(Cset.target == Cmp.leftOperand && Cmp.rightOperand instanceof ImmediateOperand && ((ImmediateOperand) Cmp.rightOperand).value == 1 && Cjump.op == ProgramIR.ConditionOp.EQ){
						Cjump.op = Cset.op;
						block.instructionList.remove(i + 1);
						block.instructionList.remove(i + 1);
					}
				}
			}
		}
	}

	static public void removeEmptyBlock(FunctionIR functionIR) {
		boolean flag = true;
		while (flag) {
			flag = false;

			Map<LabelInstruction, LabelInstruction> labelMap = new HashMap<>();
			for (int i = 0; i < functionIR.blockList.size(); i++) {
				Block block = functionIR.blockList.get(i);
				if (block.instructionList.size() == 1 && block.instructionList.get(0) instanceof JumpInstruction) {
					LabelInstruction jumpTo = ((JumpInstruction) block.instructionList.get(0)).target;
					labelMap.put(block.labelInstruction, jumpTo);
					flag = true;
					functionIR.blockList.remove(i);
					i--;
					continue;
				}
				if (block.instructionList.isEmpty() && block.labelInstruction != functionIR.exitBlock) {
					LabelInstruction jumpTo = functionIR.blockList.get(i + 1).labelInstruction;
					labelMap.put(block.labelInstruction, jumpTo);
					functionIR.blockList.remove(i);
					i--;
					continue;
				}
			}
			for (Block block : functionIR.blockList) {
				for (Instruction instruction : block.instructionList) {
					if (instruction instanceof JumpInstruction) {
						((JumpInstruction) instruction).target = labelGetFa(labelMap, ((JumpInstruction) instruction).target);
					}
					if (instruction instanceof CjumpInstruction) {
						((CjumpInstruction) instruction).target = labelGetFa(labelMap, ((CjumpInstruction) instruction).target);
					}
				}
			}
		}
	}

	static public void removeUselessJump(FunctionIR functionIR) {
		for (int i = 0; i < functionIR.blockList.size() - 1; i++) {
			Block block = functionIR.blockList.get(i);
			if (block.instructionList.isEmpty()) {
				continue;
			}
			int pos = block.instructionList.size() - 1;
			Instruction instruction = block.instructionList.get(pos);
			if (instruction instanceof JumpInstruction && ((JumpInstruction) instruction).target == functionIR.blockList.get(i + 1).labelInstruction) {
				block.instructionList.remove(pos);
			}
		}
	}

	private static LabelInstruction labelGetFa(Map<LabelInstruction, LabelInstruction> labelMap, LabelInstruction instruction) {
		while (labelMap.containsKey(instruction)) {
			instruction = labelMap.get(instruction);
		}
		return instruction;
	}

	private static void merge(VirtualRegister target, VirtualRegister source, FunctionIR functionIR){
		for(Block block: functionIR.blockList){
			for(Instruction instruction: block.instructionList){
				instruction.merge(target, source);
			}
		}
		for(VirtualRegister reg: LivenessAnalysis.edgeMap.get(target)) {
			if (LivenessAnalysis.virtualRegisterMap.containsKey(reg)) {
				LivenessAnalysis.edgeMap.get(source).add(reg);
				LivenessAnalysis.edgeMap.get(reg).add(source);
			}
		}
		LivenessAnalysis.edgeMap.remove(target);
		LivenessAnalysis.virtualRegisterMap.remove(target);
	}
}
