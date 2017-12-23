
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
	
	func withinBounds(point: Point) -> Bool {
		return point.x < size && point.x >= 0 && point.y < size && point.y >= 0
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
		case .bottom: return .right
		case .left: return .bottom
		case .top: return .left
		case .right: return .top
		}
	}

	func direction() -> Point {
		switch self {
		case .right: return Point(0, -1)
		case .top: return Point(-1, 0)
		case .left: return Point(0, 1)
		case .bottom: return Point(1, 0)
		}
	}
}

func steps(for side: Side, currentLayer: Int, size: Int) -> Int {
	var steps = currentLayer-1
	if side == .right { steps = currentLayer - 2  }
	else if side == .bottom { steps = currentLayer }
	return steps
}

func calcValueForPoint(point: Point, grid: Array2D) -> Int {
	let adjacents = [
		Point(1, 0), 	  // east
		Point(1, 1),   // southeast
		Point(0, 1),   // south
		Point(-1, -1), // southwest
		Point(-1, 0),  // west
		Point(-1, 1),  // northwest
		Point(0, -1),  // north
		Point(1, -1)   // northeast 
	]
	let positions = adjacents.map { point + $0 }.filter{ grid.withinBounds(point: $0) }
	return positions.map({ grid[$0.x, $0.y] }).reduce(0, +)
}

func populateGrid(size: Int, part2: Bool = false, expectedPart2Value: Int = 0) -> (grid: Array2D, part2Val: Int) {
	let grid = Array2D(size: size, defaultValue: 0)
	var currentVal = 1
	var maxLayerVal = 9
	var currentLayer = 3
	var side = Side.bottom

	// prime center point
	var point = Point(size / 2, size / 2)
	grid[point.x, point.y] = currentVal
	currentVal += 1
	point = point + Point(1,0)

	// generate spiral
	while currentLayer <= size {
		side = .right
		while currentVal <= maxLayerVal {
			for _ in 0..<steps(for: side, currentLayer: currentLayer, size: size) {
				if part2 {
					let part2Value = calcValueForPoint(point: point, grid: grid)
					if part2Value > expectedPart2Value { return (grid, part2Value) }
					grid[point.x, point.y] = part2Value
				} else {
					grid[point.x, point.y] = currentVal
				}
				point = point + side.direction()
				currentVal += 1
			}
			side = side.nextSide()
		}
		currentLayer += 2
		maxLayerVal = ((currentLayer) * (currentLayer))
	}
	return (grid, 0)
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

var grid = populateGrid(size: 611).grid
assert(0 == manhattanDistance(start: 1, grid: grid))
assert(3 == manhattanDistance(start: 12, grid: grid))
assert(2 == manhattanDistance(start: 23, grid: grid))
assert(31 == manhattanDistance(start: 1024, grid: grid))
print("Part 1: \(manhattanDistance(start: 361527, grid: grid))")

/**
As a stress test on the system, the programs here clear the grid and then store the value 1 in square 1. Then, in the same allocation order as shown above, they store the sum of the values in all adjacent squares, including diagonals.

So, the first few squares' values are chosen as follows:

Square 1 starts with the value 1.
Square 2 has only one adjacent filled square (with value 1), so it also stores 1.
Square 3 has both of the above squares as neighbors and stores the sum of their values, 2.
Square 4 has all three of the aforementioned squares as neighbors and stores the sum of their values, 4.
Square 5 only has the first and fourth squares as neighbors, so it gets the value 5.
Once a square is written, its value does not change. Therefore, the first few squares would receive the following values:

147  142  133  122   59
304    5    4    2   57
330   10    1    1   54
351   11   23   25   26
362  747  806--->   ...
What is the first value written that is larger than your puzzle input?
*/

var result = populateGrid(size: 21, part2: true, expectedPart2Value: 361527)
print("Part 2: \(result.part2Val)")
