/*	FILEPATH = "./LeetCode/100/73_set_matrix_zeroes.swift"
 *	73. Set Matrix Zeroes
	Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.
	Follow up:
		A straight forward solution using O(mn) space is probably a bad idea.
		A simple improvement uses O(m + n) space, but still not the best solution.
		Could you devise a constant space solution?

	Example 1:
	Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
	Output: [[1,0,1],[0,0,0],[1,0,1]]

	Example 2:
	Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
	Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

	Constraints:
		m == matrix.length
		n == matrix[0].length
		1 <= m, n <= 200
		-231 <= matrix[i][j] <= 231 - 1
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let row = matrix.count
        let col = matrix[0].count
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == 0 {
                    set_max(&matrix, i, j)
                }
            }
        }
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] != 0 {
                    reset_max(&matrix, i, j)
                }
            }
        }
    }

    func reset_max(_ matrix: inout [[Int]], _ row: Int, _ col: Int) {
        let val = matrix[row][col]
        if val == Int.max {
            matrix[row][col] = 0
        }
    }

    func set_max(_ matrix: inout [[Int]], _ row: Int, _ col: Int) {
        for i in 0..<matrix.count { 
            let val = matrix[i][col]
            matrix[i][col] = val == 0 ? 0 : Int.max
        }
        for j in 0..<matrix[0].count {
            let val = matrix[row][j]
            matrix[row][j] = val == 0 ? 0 : Int.max
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
    var matrix: [[Int]]
    matrix = [[1,1,1],[1,0,1],[1,1,1]]
    Solution().setZeroes(&matrix)
    print(matrix)
    matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
    Solution().setZeroes(&matrix)
    print(matrix)
}