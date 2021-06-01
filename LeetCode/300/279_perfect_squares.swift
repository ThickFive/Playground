/*	FILEPATH = "./LeetCode/300/279_perfect_squares.swift"
 *	279. Perfect Squares
	Given an integer n, return the least number of perfect square numbers that sum to n.
	A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

	Example 1:
	Input: n = 12
	Output: 3
	Explanation: 12 = 4 + 4 + 4.

	Example 2:
	Input: n = 13
	Output: 2
	Explanation: 13 = 4 + 9.

	Constraints:
		1 <= n <= 104
 */

class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        for i in 1...n {
            var j = 1
            while j * j <= i {
                dp[i] = min(dp[i - j * j] + 1, dp[i])
                j += 1
            }
        }
        return dp[n]
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