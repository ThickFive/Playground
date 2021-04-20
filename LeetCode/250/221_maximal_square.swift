/*	FILEPATH = "./LeetCode/250/221_maximal_square.swift"
 *	221. Maximal Square
	Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

	Example 1:
	Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
	Output: 4

	Example 2:
	Input: matrix = [["0","1"],["1","0"]]
	Output: 1

	Example 3:
	Input: matrix = [["0"]]
	Output: 0

	Constraints:
		m == matrix.length
		n == matrix[i].length
		1 <= m, n <= 300
		matrix[i][j] is '0' or '1'.
 */

class Solution {
    //  0 0 1 0
    //  0 1 1 0
    //  1 1 1 0
    //  0 0 1 0
    //  dp[i][j] 表示 以 (i, j) 为右下角的 (正方形的边长, 左边连续的 1 的个数, 上边连续的 1 的个数)
    //  e.g. dp[0][0] = (0, 0, 0) dp[1][1] = (1, 1, 1) dp[1][2] = (1, 2, 2) dp[2][2] = (2, 3, 3) 
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var maximal = 0 //  length
        let row = matrix.count
        let col = matrix[0].count
        var dp: [[(Int, Int, Int)]] = Array(repeating: Array(repeating: (0, 0, 0), count: col), count: row)
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == "0" {
                    dp[i][j] = (0, 0, 0)
                } else {
                    if i == 0 || j == 0 {
                        let x = (i > 0 ? dp[i - 1][j].1 : 0) + 1
                        let y = (j > 0 ? dp[i][j - 1].2 : 0) + 1
                        dp[i][j] = (1, x, y)
                    } else {
                        dp[i][j] = (min(1 + dp[i - 1][j - 1].0, 1 + dp[i - 1][j].1, 1 + dp[i][j - 1].2), 1 + dp[i - 1][j].1, 1 + dp[i][j - 1].2)
                    }
                }
                maximal = max(dp[i][j].0, maximal)
            }
        }
        return maximal * maximal
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
    print(Solution().maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
    print(Solution().maximalSquare([["0","1"],["1","0"]]))
    print(Solution().maximalSquare([["0","0","0","1"],["1","1","0","1"],["1","1","1","1"],["0","1","1","1"],["0","1","1","1"]]))
}