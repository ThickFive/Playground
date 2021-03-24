/*	FILEPATH = "./LeetCode/100/54_spiral_matrix.swift"
 *	54. Spiral Matrix
	Given an m x n matrix, return all elements of the matrix in spiral order.

	Example 1:
	Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
	Output: [1,2,3,6,9,8,7,4,5]

	Example 2:
	Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
	Output: [1,2,3,4,8,12,11,10,9,5,6,7]

	Constraints:
		m == matrix.length
		n == matrix[i].length
		1 <= m, n <= 10
		-100 <= matrix[i][j] <= 100
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let count = (matrix.count + 1) / 2 // 循环轮数
        let row = matrix.count
        let col = matrix[0].count
        var res: [Int] = []
        for i in 0..<count {
            //  上
            for j in i..<col - i - 1 {
                let x = i
                let y = j
                res.append(matrix[x][y])
                if res.count == row * col {break}
            }
            //  右
            for j in i..<row - i - 1 {
                let x = j
                let y = col - i - 1
                res.append(matrix[x][y])
                if res.count == row * col {break}
            }
            //  下
            for j in i..<col - i - 1 {
                let x = row - i - 1
                let y = col - j - 1
                res.append(matrix[x][y])
                if res.count == row * col {break}
            }
            //  左
            for j in i..<row - i - 1 {
                let x = row - j - 1
                let y = i
                res.append(matrix[x][y])
                if res.count == row * col {break}
            }
            if res.count == row * col {break}
        }
        if res.count == row * col - 1 { //  m * m, m 为奇数时, 额外添加最后一个元素
            res.append(matrix[row / 2][col / 2])
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
    var matrix: [[Int]]
    matrix = [[1,2,3],[4,5,6],[7,8,9]]
    print(Solution().spiralOrder(matrix))
    matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
    print(Solution().spiralOrder(matrix))
    matrix = [[1,2]]
    print(Solution().spiralOrder(matrix))
    matrix = [[1,2,3]]
    print(Solution().spiralOrder(matrix))
}