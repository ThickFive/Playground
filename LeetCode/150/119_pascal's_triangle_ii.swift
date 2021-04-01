/*	FILEPATH = "./LeetCode/150/119_pascal's_triangle_ii.swift"
 *	119. Pascal's Triangle II
	Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
	In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

	Example 1:
	Input: rowIndex = 3
	Output: [1,3,3,1]

	Example 2:
	Input: rowIndex = 0
	Output: [1]

	Example 3:
	Input: rowIndex = 1
	Output: [1,1]

	Constraints:
		0 <= rowIndex <= 33
	Follow up: Could you optimize your algorithm to use only O(rowIndex) extra space?
 */

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = Array(repeating: 0, count: rowIndex + 1)
		row[0] = 1
		var index = 0
		while index <= rowIndex {
			for i in 0...index / 2 {
				let a = i > 0 ? row[i - 1] : 0
				let b = row[i]
				row[index - i] = a + b
			}
			for i in 0...index / 2 {
				row[i] = row[index - i]
			}
			index += 1
		}
		return row
    }
}

/*
 *  TEST
 */
import Foundation
class Test {
    class func run(_ code:() -> ()) {
        let start = Date()
        print("\(start): Test start")
        code()
        let end = Date()
        print("\(end): Test end in \(Int((end.timeIntervalSince1970 - start.timeIntervalSince1970)*1000))ms")
    }
}

Test.run {
    print(Solution().getRow(3))
	print(Solution().getRow(0))
	print(Solution().getRow(1))
	print(Solution().getRow(33))
}