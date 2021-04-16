/*	FILEPATH = "./LeetCode/250/201_bitwise_and_of_numbers_range.swift"
 *	201. Bitwise AND of Numbers Range
	Given two integers left and right that represent the range [left, right], return the bitwise AND of all numbers in this range, inclusive.

	Example 1:
	Input: left = 5, right = 7
	Output: 4

	Example 2:
	Input: left = 0, right = 0
	Output: 0

	Example 3:
	Input: left = 1, right = 2147483647
	Output: 0

	Constraints:
		0 <= left <= right <= 231 - 1
 */

class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var mask = 0
        for i in 0..<32 {
            let temp = 1 << (31 - i)
            if temp & left == temp & right {
                mask |= temp
            } else {
                break
            }
        }
        return right & mask
    }

    func _0_rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var res = left
        for num in left...right {
            res &= num
            if res == 0 {
                break
            }
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
    print(Solution().rangeBitwiseAnd(5, 7))
    print(Solution().rangeBitwiseAnd(0, 0))
    print(Solution().rangeBitwiseAnd(1, 2147483647))
}