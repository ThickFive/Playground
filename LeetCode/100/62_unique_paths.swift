/*	FILEPATH = "./LeetCode/100/62_unique_paths.swift"
 *	62. Unique Paths
	A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
	The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
	How many possible unique paths are there?

	Example 1:
	Input: m = 3, n = 7
	Output: 28

	Example 2:
	Input: m = 3, n = 2
	Output: 3
	Explanation:
	From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
	1. Right -> Down -> Down
	2. Down -> Down -> Right
	3. Down -> Right -> Down

	Example 3:
	Input: m = 7, n = 3
	Output: 28

	Example 4:
	Input: m = 3, n = 3
	Output: 6

	Constraints:
		1 <= m, n <= 100
		It's guaranteed that the answer will be less than or equal to 2 * 109.
 */

class Solution {
    //  动态规划
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        //  n 行 m 列
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                if i == 0 || j == 0 {
                    matrix[i][j] = 1
                } else {
                    matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
                }
            }
        }
        return matrix[n - 1][m - 1]
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
    // print(Solution().uniquePaths(3, 7))
    // print(Solution().uniquePaths(3, 2))
    // print(Solution().uniquePaths(7, 3))
    // print(Solution().uniquePaths(3, 3))
    print(Solution().uniquePaths(20, 20))
}