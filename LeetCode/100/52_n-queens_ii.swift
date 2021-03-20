/*	FILEPATH = "./LeetCode/100/52_n-queens_ii.swift"
 *	52. N-Queens II
	The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.
	Given an integer n, return the number of distinct solutions to the n-queens puzzle.

	Example 1:
	Input: n = 4
	Output: 2
	Explanation: There are two distinct solutions to the 4-queens puzzle as shown.

	Example 2:
	Input: n = 1
	Output: 1

	Constraints:
		1 <= n <= 9
 */

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var res: [[Int]] = []
        func backtarck(_ path: [Int]) {
            if path.count == n {
                res.append(path)
            }
            var path = path
            var available: [Int] = []
            for i in 0..<n {
                available.append(i)
            }
            for (i, val) in path.enumerated() {
                //  左下
                if let index = available.firstIndex(of: val - path.count + i) {
                    available.remove(at: index)
                }
                //  正下
                if let index = available.firstIndex(of: val) {
                    available.remove(at: index)
                }
                //  右下
                if let index = available.firstIndex(of: val + path.count - i) {
                    available.remove(at: index)
                }
            }
            for i in 0..<n {
                if available.contains(i) == false {
                    continue
                }
                path.append(i)
                backtarck(path)
                path.remove(at: path.count - 1)
            }
        }
        backtarck([])
        return res.count
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
    print(Solution().totalNQueens(1))
    print(Solution().totalNQueens(2))
    print(Solution().totalNQueens(3))
    print(Solution().totalNQueens(4))
    print(Solution().totalNQueens(5))
    print(Solution().totalNQueens(6))
    print(Solution().totalNQueens(7))
    print(Solution().totalNQueens(8))
    print(Solution().totalNQueens(9))
}