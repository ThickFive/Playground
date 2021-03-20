/*	FILEPATH = "./LeetCode/100/59_spiral_matrix_ii.swift"
 *	59. Spiral Matrix II
	Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

	Example 1:
	Input: n = 3
	Output: [[1,2,3],[8,9,4],[7,6,5]]

	Example 2:
	Input: n = 1
	Output: [[1]]

	Constraints:
		1 <= n <= 20
 */

/*
      ->->->|
      | ->| |
      | |<- |    
      |<-<-<-
 */
class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        let count = n / 2   //  圈数, n为奇数最后一圈只有一个数
        var num = 1
        for i in 0..<count {
            var index = 0
            for j in i..<(n - i - 1) {
                //  上
                let i1 = i
                let j1 = j
                matrix[i1][j1] =  num + j - i
                //  右
                let i2 = j
                let j2 = n - i - 1
                matrix[i2][j2] =  num + j + (n - i * 2 - 1) * 1 - i
                //  下 
                let i3 = n - i - 1
                let j3 = n - j - 1
                matrix[i3][j3] =  num + j + (n - i * 2 - 1) * 2 - i
                //  左
                let i4 = n - j - 1
                let j4 = i
                matrix[i4][j4] =  num + j + (n - i * 2 - 1) * 3 - i
                index += 4
            }
            num += index
        }
        if n % 2 == 1 {
            matrix[(n-1)/2][(n-1)/2] = n * n
        }
        return matrix
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
    print(Solution().generateMatrix(1))
    print(Solution().generateMatrix(2))
    print(Solution().generateMatrix(3))
    print(Solution().generateMatrix(4))
}