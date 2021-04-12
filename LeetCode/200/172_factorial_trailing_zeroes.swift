/*	FILEPATH = "./LeetCode/200/172_factorial_trailing_zeroes.swift"
 *	172. Factorial Trailing Zeroes
	Given an integer n, return the number of trailing zeroes in n!.
	Follow up: Could you write a solution that works in logarithmic time complexity?

	Example 1:
	Input: n = 3
	Output: 0
	Explanation: 3! = 6, no trailing zero.

	Example 2:
	Input: n = 5
	Output: 1
	Explanation: 5! = 120, one trailing zero.

	Example 3:
	Input: n = 0
	Output: 0

	Constraints:
		0 <= n <= 104
 */

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var num = n
        var count = 0
        while num > 0 {
            count += num / 5
            num /= 5
        }
        return count
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
    print(Solution().trailingZeroes(3))
    print(Solution().trailingZeroes(5))
    print(Solution().trailingZeroes(0))
    print(Solution().trailingZeroes(10000))
}