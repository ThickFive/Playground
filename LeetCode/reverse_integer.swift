/*	FILEPATH = "./LeetCode/reverse_integer.swift"
 *	7. Reverse Integer
	Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
	Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

	Example 1:
	Input: x = 123
	Output: 321

	Example 2:
	Input: x = -123
	Output: -321

	Example 3:
	Input: x = 120
	Output: 21

	Example 4:
	Input: x = 0
	Output: 0

	Constraints:
		-231 <= x <= 231 - 1
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        let isNegtive: Bool = x < 0
        var val = isNegtive ? -x : x
        var nums: [Int] = []
        while val > 0 {
            nums.append(val % 10)
            val = val / 10
        }
        var res: Int = 0
        for num in nums {
            res = 10 * res + num
        }
        res = isNegtive ? -res : res
        let max: Double = pow(2, 31)
        if res < -Int(max) || res > Int(max)  - 1 {
            res = 0
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
    print(Solution().reverse(123))
    print(Solution().reverse(-123))
    print(Solution().reverse(120))
    print(Solution().reverse(0))
}