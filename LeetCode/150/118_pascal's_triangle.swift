/*	FILEPATH = "./LeetCode/150/118_pascal's_triangle.swift"
 *	118. Pascal's Triangle
	Given an integer numRows, return the first numRows of Pascal's triangle.
	In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

	Example 1:
	Input: numRows = 5
	Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

	Example 2:
	Input: numRows = 1
	Output: [[1]]

	Constraints:
		1 <= numRows <= 30
 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
		var res: [[Int]] = []
		for i in 0..<numRows {
			var nums: [Int] = []
			for j in 0...i {
				var num = 1
				if j > 0 && j < i {
					num = res[i - 1][j - 1] + res[i - 1][j]
				} 
				nums.append(num)
			}
			res.append(nums)
		}
        return res
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
	print(Solution().generate(1))
	print(Solution().generate(5))
}