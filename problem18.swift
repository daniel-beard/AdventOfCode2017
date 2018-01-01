import Foundation

/**
 You discover a tablet containing some strange assembly code labeled simply "Duet". Rather than bother the sound card with it, you decide to run the code yourself. Unfortunately, you don't see any documentation, so you're left to figure out what the instructions mean on your own.

 It seems like the assembly is meant to operate on a set of registers that are each named with a single letter and that can each hold a single integer. You suppose each register should start with a value of 0.

 There aren't that many instructions, so it shouldn't be hard to figure out what they do. Here's what you determine:

 snd X plays a sound with a frequency equal to the value of X.
 set X Y sets register X to the value of Y.
 add X Y increases register X by the value of Y.
 mul X Y sets register X to the result of multiplying the value contained in register X by the value of Y.
 mod X Y sets register X to the remainder of dividing the value contained in register X by the value of Y (that is, it sets X to the result of X modulo Y).
 rcv X recovers the frequency of the last sound played, but only when the value of X is not zero. (If it is zero, the command does nothing.)
 jgz X Y jumps with an offset of the value of Y, but only if the value of X is greater than zero. (An offset of 2 skips the next instruction, an offset of -1 jumps to the previous instruction, and so on.)
 Many of the instructions can take either a register (a single letter) or a number. The value of a register is the integer it contains; the value of a number is that number.

 After each jump instruction, the program continues with the instruction to which the jump jumped. After any other instruction, the program continues with the next instruction. Continuing (or jumping) off either end of the program terminates it.

 For example:

 set a 1
 add a 2
 mul a a
 mod a 5
 snd a
 set a 0
 rcv a
 jgz a -1
 set a 1
 jgz a -2
 The first four instructions set a to 1, add 2 to it, square it, and then set it to itself modulo 5, resulting in a value of 4.
 Then, a sound with frequency 4 (the value of a) is played.
 After that, a is set to 0, causing the subsequent rcv and jgz instructions to both be skipped (rcv because a is 0, and jgz because a is not greater than 0).
 Finally, a is set to 1, causing the next jgz instruction to activate, jumping back two instructions to another jump, which jumps again to the rcv, which ultimately triggers the recover operation.
 At the time the recover operation is executed, the frequency of the last sound played is 4.

 What is the value of the recovered frequency (the value of the most recently played sound) the first time a rcv instruction is executed with a non-zero value?
 */

enum Value {
	case register(String)
	case integer(Int)

	init(_ string: String) {
		self = string.isIdentifier() ? .register(string) : .integer((string as NSString).integerValue)
	}

	func value(registers: [String: Int]) -> Int {
		switch self {
		case .integer(let value): return value
		case .register(let name): return registers[name, default: 0]
		}
	}
}

class SharedMessageQueue {
	private var messageQueue: [Int: [Int]] = [Int: [Int]]()
	var sendCount: Int = 0

	func sendMessage(fromID: Int, value: Int) {
		let id = fromID == 0 ? 1 : 0
		messageQueue[id, default: [Int]()].append(value)
		if fromID == 1 { sendCount += 1 }
	}

	func receiveMessage(id: Int) -> Int? {
		let existingQueue = messageQueue[id, default: [Int]()]
		guard let result = existingQueue.first else { return nil }
		messageQueue[id] = Array<Int>(existingQueue.dropFirst())
		return result
	}
}

extension String {
	mutating func take(until: String) -> String {
		let result = String(self.prefix(while: { String($0) != until }))
		self = String(self.dropFirst(result.count))
		return result
	}

	mutating func eatWhitespace() {
		let result = String(self.prefix(while: { String($0) == " " }))
		self = String(self.dropFirst(result.count))
	}

	func isIdentifier() -> Bool {
		let range = "A"..."z"
		return range.contains(String(prefix(1)))
	}
}

struct ProgramState {
	var registers = [String: Int]()
	var index = 0
	var programID: Int
	var messageQueue = SharedMessageQueue()
	var isPart1: Bool
	var waiting = false

	init(registers: [String: Int] = [String: Int](), index: Int = 0, programID: Int, isPart1: Bool = true, messageQueue: SharedMessageQueue = SharedMessageQueue(), waiting: Bool = false) {
		self.registers = registers
		self.index = index
		self.programID = programID
		self.messageQueue = messageQueue
		self.isPart1 = isPart1
		self.waiting = waiting
	}
}

enum Instruction {
	case `set`(Value, Value)
	case add(Value, Value)
	case mul(Value, Value)
	case mod(Value, Value)
	case snd(Value)
	case rcv(Value)
	case jgz(Value, Value)

	static func instructionFromString(input: String) -> Instruction {
		var input = input
		let instructionName = input.take(until: " ")
		input.eatWhitespace()
		let firstValue = Value(input.take(until: " "))
		input.eatWhitespace()
		let secondValue = Value(input.take(until: " "))
		switch instructionName {
		case "set": return .set(firstValue, secondValue)
		case "add": return .add(firstValue, secondValue)
		case "mul": return .mul(firstValue, secondValue)
		case "mod": return .mod(firstValue, secondValue)
		case "snd": return .snd(firstValue)
		case "rcv": return .rcv(firstValue)
		case "jgz": return .jgz(firstValue, secondValue)
		default: fatalError("Unrecognized instruction: \(instructionName)")
		}
	}

	static func evalulate(instructions: [Instruction], state: ProgramState) -> ProgramState {
		var index = state.index
		let instruction = instructions[index]
		let soundKey = "lastsound"
		let recoverKey = "recover"
		var registers = state.registers
		var isWaiting = state.waiting

		switch instruction {
		case .snd(let v):
			let value = v.value(registers: registers)
			if state.isPart1 {
				registers[soundKey] = value
				index += 1
			} else {
				state.messageQueue.sendMessage(fromID: state.programID, value: value)
				index += 1
			}
		case .rcv(let .register(r)):
			if state.isPart1 {
				let registerValue = registers[r, default: 0]
				index += 1
				if registerValue != 0 {
					registers[recoverKey] = registers[soundKey]
					index = -1
				}
			} else {
				if let receivedValue = state.messageQueue.receiveMessage(id: state.programID) {
					registers[r] = receivedValue
					isWaiting = false
					index += 1
				} else {
					isWaiting = true
				}
			}
		case .set(let .register(r), let v):
			registers[r] = v.value(registers: registers)
			index += 1
		case .add(let .register(r), let v):
			registers[r, default: 0] += v.value(registers: registers)
			index += 1
		case .mul(let .register(r), let v):
			registers[r, default: 0] *= v.value(registers: registers)
			index += 1
		case .mod(let .register(r), let v):
			registers[r, default: 0] %= v.value(registers: registers)
			index += 1
		case .jgz(let .register(r), let v):
			let offset = v.value(registers: registers)
			let registerValue = registers[r, default: 0]
			index += (registerValue > 0) ? offset : 1
		case .jgz(let .integer(v1), let .integer(v2)):
			let offset = v2
			index += (v1 > 0) ? offset : 1
		default:
			fatalError("Unknown instruction type / value: \(instruction)")
		}

		return ProgramState(registers: registers,
							index: index,
							programID: state.programID,
							isPart1: state.isPart1,
							messageQueue: state.messageQueue,
							waiting: isWaiting)
	}
}

let input = """
set i 31
set a 1
mul p 17
jgz p p
mul a 2
add i -1
jgz i -2
add a -1
set i 127
set p 622
mul p 8505
mod p a
mul p 129749
add p 12345
mod p a
set b p
mod b 10000
snd b
add i -1
jgz i -9
jgz a 3
rcv b
jgz b -1
set f 0
set i 126
rcv a
rcv b
set p a
mul p -1
add p b
jgz p 4
snd a
set a b
jgz 1 3
snd b
set f 1
add i -1
jgz i -11
snd a
jgz f -16
jgz a -19
"""

class Driver {

	let source: String
	let isPart1: Bool
	private var instructions = [Instruction]()
	init(program: String, isPart1: Bool) {
		source = program
		self.isPart1 = isPart1
	}

	func parse() {
		instructions = [Instruction]()
		let lines = source.split(separator: "\n").map{ String($0) }
		for line in lines {
			instructions.append(Instruction.instructionFromString(input: line))
		}
	}

	func run() {
		if isPart1 { runPart1() } else { runPart2() }
	}

	private func runPart1() {
		var state = ProgramState(programID: 0, isPart1: isPart1)
		while state.index >= 0 && state.index <= instructions.count {
			state = Instruction.evalulate(instructions: instructions, state: state)
		}
		print("Part1: \(state.registers["recover"]!)")
	}

	private func runPart2() {
		let sharedMessageQueue = SharedMessageQueue()
		var program0 = ProgramState(programID: 0, isPart1: isPart1, messageQueue: sharedMessageQueue)
		var program1 = ProgramState(programID: 1, isPart1: isPart1, messageQueue: sharedMessageQueue)
		program0.registers["p"] = 0
		program1.registers["p"] = 1

		while program0.waiting == false || program1.waiting == false {
			program0 = Instruction.evalulate(instructions: instructions, state: program0)
			program1 = Instruction.evalulate(instructions: instructions, state: program1)
		}
		print("Part2: \(program1.messageQueue.sendCount)")
	}
}

// Part 1
let driver = Driver(program: input, isPart1: true)
driver.parse()
driver.run()

// Part2
let driver2 = Driver(program: input, isPart1: false)
driver2.parse()
driver2.run()
