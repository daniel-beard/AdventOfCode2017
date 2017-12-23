
import Foundation

/**
You come across an experimental new kind of memory stored on an infinite two-dimensional grid.

Each square on the grid is allocated in a spiral pattern starting at a location marked 1 and then counting up while spiraling outward. For example, the first few squares are allocated like this:

17  16  15  14  13
18   5   4   3  12
19   6   1   2  11
20   7   8   9  10
21  22  23---> ...
While this is very space-efficient (no squares are skipped), requested data must be carried back to square 1 (the location of the only access port for this memory system) by programs that can only move up, down, left, or right. They always take the shortest path: the Manhattan Distance between the location of the data and square 1.

For example:

Data from square 1 is carried 0 steps, since it's at the access port.
Data from square 12 is carried 3 steps, such as: down, left, left.
Data from square 23 is carried only 2 steps: up twice.
Data from square 1024 must be carried 31 steps.
How many steps are required to carry the data from the square identified in your puzzle input all the way to the access port?
*/

class Array2D: CustomStringConvertible {

	let size: Int
	var matrix:[Int]

	init(size:Int, defaultValue:Int) {
		self.size = size
		matrix = Array(repeating: defaultValue, count: size*size)
	}

	subscript(col:Int, row:Int) -> Int {
		get { return matrix[size * row + col] }
		set { matrix[size * row + col] = newValue }
	}

	func twoDimensionalIndexFor(_ index: Int) -> (x: Int, y: Int)? {
		if index >= 0 && index < size * size {
			return (index % size, index / size)
		}
		return nil
	}
	
	var description: String {
		var result = ""
		for y in 0..<size { for x in 0..<size {
			result += "\(self[x, y]), "
		}; result += "\n" }
		return result
	}
}

struct Point: Equatable {
	var x: Int
	var y: Int
	init(_ x: Int, _ y: Int) {
		self.x = x
		self.y = y
	}

	static func +(lhs: Point, rhs: Point) -> Point {
		return Point(lhs.x + rhs.x, lhs.y + rhs.y)
	}

	static func ==(lhs: Point, rhs: Point) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
}

enum Side {
	case right
	case top
	case left
	case bottom

	func nextSide() -> Side {
		switch self {
		case .bottom: return .left
		case .left: return .top
		case .top: return .right
		case .right: return .bottom
		}
	}

	func direction() -> Point {
		switch self {
		case .right: return Point(0, 1)
		case .top: return Point(1, 0)
		case .left: return Point(0, -1)
		case .bottom: return Point(-1, 0)
		}
	}
}

func populateGrid(size: Int) -> Array2D {
	let grid = Array2D(size: size, defaultValue: 0)
	let center = size / 2
	var currentVal = 1
	var minLayerVal = 2
	var currentLayer = 2
	var side = Side.bottom

	var point = Point(center, center)
	grid[point.x, point.y] = currentVal
	currentVal = (currentLayer + 1) * (currentLayer + 1)
	while currentLayer < size {
		point = point + Point(1,1)
		side = .bottom
		while currentVal >= minLayerVal {
			let steps = currentLayer
			for _ in 0..<steps {
				grid[point.x, point.y] = currentVal
				point = point + side.direction()
				currentVal -= 1
			}
			side = side.nextSide()
		}
		minLayerVal = ((currentLayer + 1) * (currentLayer + 1)) + 1
		currentLayer += 2
		currentVal = (currentLayer + 1) * (currentLayer + 1)
	}
	return grid
}

func manhattanDistance(start: Int, grid: Array2D) -> Int {
	guard let index = grid.matrix.index(where: { $0 == start }) else {
		fatalError("Index not found")
	}
	let centerIndex = grid.size / 2
	let center = Point(centerIndex, centerIndex)
	let twoDimensionalIndex = grid.twoDimensionalIndexFor(index)!
	var current = Point(twoDimensionalIndex.x, twoDimensionalIndex.y)
	var steps = 0

	while current != center {
		if current.x > center.x { current = current + Point(-1, 0) }
		else if current.x < center.x { current = current + Point(1, 0) }
		else if current.y > center.y { current = current + Point(0, -1) }
		else if current.y < center.y { current = current + Point(0, 1) }
		steps += 1
	}

	return steps
}

var grid = populateGrid(size: 611)
guard let index = grid.matrix.index(where: { $0 == 361527 }) else {
	fatalError("Index not found")
}

assert(0 == manhattanDistance(start: 1, grid: grid))
assert(3 == manhattanDistance(start: 12, grid: grid))
assert(2 == manhattanDistance(start: 23, grid: grid))
assert(31 == manhattanDistance(start: 1024, grid: grid))

print("Part 1: \(manhattanDistance(start: 361527, grid: grid))")



