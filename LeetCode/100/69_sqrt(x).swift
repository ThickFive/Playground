/*	FILEPATH = "./LeetCode/100/69_sqrt(x).swift"
 *	69. Sqrt(x)
	Given a non-negative integer x, compute and return the square root of x.
	Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

	Example 1:
	Input: x = 4
	Output: 2

	Example 2:
	Input: x = 8
	Output: 2
	Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.

	Constraints:
		0 <= x <= 231 - 1
 */

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        if x < 4 {
            return 1
        }
        var left = 0
        var right = (x + 1) / 2
        var mid = (left + right) / 2
        while left < right {
            if mid * mid > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
            mid = (left + right) / 2
        }
        return left * left > x ? left - 1 : left
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
    print(Solution().mySqrt(100))
}