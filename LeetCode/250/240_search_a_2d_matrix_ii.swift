/*	FILEPATH = "./LeetCode/250/240_search_a_2d_matrix_ii.swift"
 *	240. Search a 2D Matrix II
	Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:
		Integers in each row are sorted in ascending from left to right.
		Integers in each column are sorted in ascending from top to bottom.

	Example 1:
	Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
	Output: true

	Example 2:
	Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
	Output: false

	Constraints:
		m == matrix.length
		n == matrix[i].length
		1 <= n, m <= 300
		-10^9 <= matix[i][j] <= 10^9
		All the integers in each row are sorted in ascending order.
		All the integers in each column are sorted in ascending order.
		-10^9 <= target <= 10^9
 */

class Solution {
    //  start: 左上角, end: 右下角
    //  <  |sub 
    //  -------
    //  sub|  >
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count
        let col = matrix[0].count
        func search_martrix(_ matrix: [[Int]], _ start: (Int, Int), _ end: (Int, Int)) -> Bool {
            //  下标越界
            if start.0 < 0 || start.1 < 0 || start.0 >= row || start.1 >= col {
                return false
            }
            if end.0 < 0 || end.1 < 0 || end.0 >= row || end.1 >= col {
                return false
            }
            //  不在范围内
            if matrix[start.0][start.1] > target || matrix[end.0][end.1] < target {
                return false
            }
            var i = start.0
            var j = start.1
            while i <= end.0 && j <= end.1 {
                if matrix[i][j] == target {
                    return true
                } else if matrix[i][j] < target {
                    i += 1
                    j += 1
                } else {
                    break
                }
            }
            let start_a = (i, start.1)
            let end_a = (end.0, j - 1)
            let start_b = (start.0, j)
            let end_b = (i - 1, end.1)
            return search_martrix(matrix, start_a, end_a) || search_martrix(matrix, start_b, end_b)
        }
        return search_martrix(matrix, (0, 0), (row - 1, col - 1))
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
    print(Solution().searchMatrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5))
     print(Solution().searchMatrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 20))
}