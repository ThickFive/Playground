/*	FILEPATH = "./LeetCode/100/74_search_a_2d_matrix.swift"
 *	74. Search a 2D Matrix
	Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
		Integers in each row are sorted from left to right.
		The first integer of each row is greater than the last integer of the previous row.

	Example 1:
	Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
	Output: true

	Example 2:
	Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
	Output: false

	Constraints:
		m == matrix.length
		n == matrix[i].length
		1 <= m, n <= 100
		-104 <= matrix[i][j], target <= 104
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let count = matrix.count * matrix[0].count
        func num_at_index(_ index: Int) -> Int {
            let row = index / matrix[0].count
            let col = index % matrix[0].count
            return matrix[row][col]
        }
        var left = 0
        var right = count - 1
        var mid = (left + right) / 2
        while  left <= right {
            if num_at_index(mid) < target {
                left = mid + 1
            } else if num_at_index(mid) > target {
                right = mid - 1
            }
            mid = (left + right) / 2
            if num_at_index(mid) == target {
                return true
            }
            if left == right {
                break
            }
        }
        return false
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
    
}