/*	FILEPATH = "./LeetCode/300/263_ugly_number.swift"
 *	263. Ugly Number
	An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
	Given an integer n, return true if n is an ugly number.

	Example 1:
	Input: n = 6
	Output: true
	Explanation: 6 = 2 × 3

	Example 2:
	Input: n = 8
	Output: true
	Explanation: 8 = 2 × 2 × 2

	Example 3:
	Input: n = 14
	Output: false
	Explanation: 14 is not ugly since it includes the prime factor 7.

	Example 4:
	Input: n = 1
	Output: true
	Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.

	Constraints:
		-2^31 <= n <= 2^31 - 1
 */

class Solution {
    func isUgly(_ n: Int) -> Bool {
        guard n > 0 else {
            return false
        }
        var num = n
        while num % 2 == 0 {
            num = num / 2
        }
        while num % 3 == 0 {
            num = num / 3
        }
        while num % 5 == 0 {
            num = num / 5
        }
        return num < 5
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
    print(Solution().isUgly(6))
    print(Solution().isUgly(8))
    print(Solution().isUgly(14))
    print(Solution().isUgly(1))
}