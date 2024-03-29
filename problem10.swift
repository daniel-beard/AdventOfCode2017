import Foundation

/**
You come across some programs that are trying to implement a software emulation of a hash based on knot-tying. The hash these programs are implementing isn't very strong, but you decide to help them anyway. You make a mental note to remind the Elves later not to invent their own cryptographic functions.

This hash function simulates tying a knot in a circle of string with 256 marks on it. Based on the input to be hashed, the function repeatedly selects a span of string, brings the ends together, and gives the span a half-twist to reverse the order of the marks within it. After doing this many times, the order of the marks is used to build the resulting hash.

	4--5   pinch   4  5           4   1
 /    \  5,0,1  / \/ \  twist  / \ / \
3      0  -->  3      0  -->  3   X   0
 \    /         \ /\ /         \ / \ /
	2--1           2  1           2   5
To achieve this, begin with a list of numbers from 0 to 255, a current position which begins at 0 (the first element in the list), a skip size (which starts at 0), and a sequence of lengths (your puzzle input). Then, for each length:

Reverse the order of that length of elements in the list, starting with the element at the current position.
Move the current position forward by that length plus the skip size.
Increase the skip size by one.
The list is circular; if the current position and the length try to reverse elements beyond the end of the list, the operation reverses using as many extra elements as it needs from the front of the list. If the current position moves past the end of the list, it wraps around to the front. Lengths larger than the size of the list are invalid.

Here's an example using a smaller list:

Suppose we instead only had a circular list containing five elements, 0, 1, 2, 3, 4, and were given input lengths of 3, 4, 1, 5.

The list begins as [0] 1 2 3 4 (where square brackets indicate the current position).
The first length, 3, selects ([0] 1 2) 3 4 (where parentheses indicate the sublist to be reversed).
After reversing that section (0 1 2 into 2 1 0), we get ([2] 1 0) 3 4.
Then, the current position moves forward by the length, 3, plus the skip size, 0: 2 1 0 [3] 4. Finally, the skip size increases to 1.
The second length, 4, selects a section which wraps: 2 1) 0 ([3] 4.
The sublist 3 4 2 1 is reversed to form 1 2 4 3: 4 3) 0 ([1] 2.
The current position moves forward by the length plus the skip size, a total of 5, causing it not to move because it wraps around: 4 3 0 [1] 2. The skip size increases to 2.
The third length, 1, selects a sublist of a single element, and so reversing it has no effect.
The current position moves forward by the length (1) plus the skip size (2): 4 [3] 0 1 2. The skip size increases to 3.
The fourth length, 5, selects every element starting with the second: 4) ([3] 0 1 2. Reversing this sublist (3 0 1 2 4 into 4 2 1 0 3) produces: 3) ([4] 2 1 0.
Finally, the current position moves forward by 8: 3 4 2 1 [0]. The skip size increases to 4.
In this example, the first two numbers in the list end up being 3 and 4; to check the process, you can multiply them together to produce 12.

However, you should instead use the standard list size of 256 (with values 0 to 255) and the sequence of lengths in your puzzle input. Once this process is complete, what is the result of multiplying the first two numbers in the list?
*/

extension Array where Element == Int {
	mutating func replaceCircularSubrange(start: Int, length: Int) {
		var subrange = Array(circularSubrange(start: start, length: length).reversed())
		var index = start
		while !subrange.isEmpty {
			self[index] = subrange.first!
			subrange = Array(subrange.dropFirst())
			index += 1
			if index >= self.count {
				index -= self.count
			}
		}
	}
	
	private func circularSubrange(start: Int, length: Int) -> [Int] {
		var result = [Int]()
		var index = start
		while result.count < length {
			result.append(self[index])
			index += 1
			if index >= self.count {
				index -= self.count
			} 
		}
		return result
	}
}

extension String {
	func toASCIIArray() -> [Int] {
		var result = [Int]()
		for character in self {
			guard character.unicodeScalars.count == 1 else { fatalError("Unexpected scalar count") }
			result.append(Int(character.unicodeScalars.first!.value))
		}	
		return result	
	}
}

func knotHash(input: [Int], lengths: [Int], index: Int = 0, skipSize: Int = 0) -> (list: [Int], position: Int, skipSize: Int) {
	var input = input
	var lengths = lengths
	var index = index
	var skipSize = skipSize	
	while !lengths.isEmpty {
		let length = lengths.first!
		input.replaceCircularSubrange(start: index, length: length)
		lengths = Array(lengths.dropFirst())
		index += length + skipSize
		skipSize += 1
		while index >= input.count {
			index -= input.count
		}
	}
	return (input, index, skipSize)
}

// Part 1
let input = Array<Int>(0...255)
let (part1, _, _) = knotHash(input: input, lengths: [130,126,1,11,140,2,255,207,18,254,246,164,29,104,0,224])
let result = part1[0] * part1[1]
print("Part 1: \(result)")

func part2(lengths: String) -> String {
	var part2input = Array<Int>(0...255)
	let part2lengths = lengths.toASCIIArray() + [17, 31, 73, 47, 23]
	var index = 0
	var skipSize = 0
	for _ in 0..<64 {
		(part2input, index, skipSize) = knotHash(input: part2input, lengths: part2lengths, index: index, skipSize: skipSize)
	}
	
	// XOR to find denseHash
	var denseHash = [Int]()
	while !part2input.isEmpty {
		let next = Array<Int>(part2input.prefix(16))
		part2input = Array<Int>(part2input.dropFirst(16))
		denseHash.append(next.reduce(0, ^))
	}
	
	// convert to hexidecimal hash
	return denseHash.map({ String(format: "%2X", $0 ) }).reduce("", +).lowercased().replacingOccurrences(of: " ", with: "0")
}
assert(part2(lengths: "") == "a2582a3a0e66e6e86e3812dcb672a272")
assert(part2(lengths: "AoC 2017") == "33efeb34ea91902bb2f59c9920caa6cd")
assert(part2(lengths: "1,2,3") == "3efbe78a8d82f29979031a4aa0b16a9d")
assert(part2(lengths: "1,2,4") == "63960835bcdc130f0b66d7ff4f6a5a8e")

let result2 = part2(lengths: "130,126,1,11,140,2,255,207,18,254,246,164,29,104,0,224")
print("Part 2: \(result2)")
