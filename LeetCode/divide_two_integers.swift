/*	FILEPATH = "./LeetCode/divide_two_integers.swift"
 *	29. Divide Two Integers
	Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.
	Return the quotient after dividing dividend by divisor.
	The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.
	Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−23^1, 23^1 − 1]. For this problem, assume that your function returns 2^31 − 1 when the division result overflows.

	Example 1:
	Input: dividend = 10, divisor = 3
	Output: 3
	Explanation: 10/3 = truncate(3.33333..) = 3.

	Example 2:
	Input: dividend = 7, divisor = -3
	Output: -2
	Explanation: 7/-3 = truncate(-2.33333..) = -2.

	Example 3:
	Input: dividend = 0, divisor = 1
	Output: 0

	Example 4:
	Input: dividend = 1, divisor = 1
	Output: 1

	Constraints:
		-23^1 <= dividend, divisor <= 23^1 - 1
		divisor != 0
 */

class Solution {
    //  不使用除法
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let is_negtive = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
        let dividend = abs(dividend)
        let divisor = abs(divisor)
        //  计算结果长度 log(n)
        var tmp = divisor
        var rem = dividend  //  余数
        var res = 0
        while rem >= tmp {
            var count = 0
            while rem >= tmp {
                count += 1
                tmp *= 10
            }
            tmp = divisor
            rem = rem - Int(pow(10, Double(count-1))) * tmp
            if rem >= 0 {
                res += Int(pow(10, Double(count-1)))
            }
        }
        if (is_negtive && res >= 2147483648) {
            res = 2147483648
        }
        if (!is_negtive && res >= 2147483647) {
            res = 2147483647
        }
        return is_negtive ? -1 * res : res
    }

    //  直接除法
    func _divide(_ dividend: Int, _ divisor: Int) -> Int {
        let is_negtive = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
        let dividend = abs(dividend)
        let divisor = abs(divisor)
        var res = dividend / divisor
        if (is_negtive && res >= 2147483648) {
            res = 2147483648
        }
        if (!is_negtive && res >= 2147483647) {
            res = 2147483647
        }
        return is_negtive ? -1 * res : res
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
    print(Solution().divide(10, 2))
    print(Solution().divide(7, -3))
    print(Solution().divide(0, 1))
    print(Solution().divide(1, 1))
    print(Solution().divide(-2147483648, 1))
    print(Solution().divide(2147483648, 1))
}