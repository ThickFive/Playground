/*	FILEPATH = "./LeetCode/100/85_maximal_rectangle.swift"
 *	85. Maximal Rectangle
	Given a rows x cols binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.

	Example 1:
	Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
	Output: 6
	Explanation: The maximal rectangle is shown in the above picture.

	Example 2:
	Input: matrix = []
	Output: 0

	Example 3:
	Input: matrix = [["0"]]
	Output: 0

	Example 4:
	Input: matrix = [["1"]]
	Output: 1

	Example 5:
	Input: matrix = [["0","0"]]
	Output: 0

	Constraints:
		rows == matrix.length
		cols == matrix[i].length
		0 <= row, cols <= 200
		matrix[i][j] is '0' or '1'.
 */

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 || matrix[0].count == 0 {
            return 0
        }
        var max = 0
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let area = helper(matrix, i, j, matrix.count,  matrix[0].count)
                max = max > area ? max : area
            }
        }
        return max
    }

    //  求以(i, j)为左上角起点的最大矩形面积, (max_i, max_j)表示右下角的坐标
    func helper(_ matrix: [[Character]], _ i: Int, _ j: Int, _ max_i: Int, _ max_j: Int) -> Int {
        if matrix[i][j] == "0" || max_i == i || max_j == j {
            return 0
        }
        var x = -1
        var y = -1
        loop: for row in i..<max_i {
            for col in j..<max_j {
                if matrix[row][col] == "0" {
                    x = row
                    y = col
                    break loop
                }
            }
        }
        if x >= 0 {
            return max(helper(matrix, i, j, x, max_j), helper(matrix, i, j, max_i, y))
        } else {
            return (max_i - i) * (max_j - j)
        } 
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
    var matrix: [[Character]]
    matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
    print(Solution().maximalRectangle(matrix))
    matrix = []
    print(Solution().maximalRectangle(matrix))
    matrix = [["0"]]
    print(Solution().maximalRectangle(matrix))
    matrix = [["1"]]
    print(Solution().maximalRectangle(matrix))
    matrix = [["0","0"]]
    print(Solution().maximalRectangle(matrix))
}