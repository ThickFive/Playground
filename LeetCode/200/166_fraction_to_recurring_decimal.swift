/*	FILEPATH = "./LeetCode/200/166_fraction_to_recurring_decimal.swift"
 *	166. Fraction to Recurring Decimal
	Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
	If the fractional part is repeating, enclose the repeating part in parentheses.
	If multiple answers are possible, return any of them.
	It is guaranteed that the length of the answer string is less than 104 for all the given inputs.

	Example 1:
	Input: numerator = 1, denominator = 2
	Output: "0.5"

	Example 2:
	Input: numerator = 2, denominator = 1
	Output: "2"

	Example 3:
	Input: numerator = 2, denominator = 3
	Output: "0.(6)"

	Example 4:
	Input: numerator = 4, denominator = 333
	Output: "0.(012)"

	Example 5:
	Input: numerator = 1, denominator = 5
	Output: "0.2"

	Constraints:
		-231 <= numerator, denominator <= 231 - 1
		denominator != 0
 */

class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 {
            return "0"
        }
        var numerator = numerator
        var denominator = denominator
        var string = ""
        if numerator ^ denominator < 0 {    // 结果为负数
            string = "-"
        }
        numerator = abs(numerator)
        denominator = abs(denominator)
        var map: [Int] = []
        var nums: [Int] = []
        var int = numerator / denominator
        var rem = numerator % denominator
        rem > 0 ? map.append(rem) : ()
        string += String(int)
        var index: Int? // 是否无循环
        while rem > 0 {
            int = 10 * rem / denominator
            rem = 10 * rem % denominator
            nums.append(int)
            if let i = map.firstIndex(of: rem) {
                index = i
                break
            }
            rem > 0 ? map.append(rem) : ()
        }
        if nums.count > 0 { //  有小数部分
            string += "."
            if let index = index {
                for (i, num) in nums.enumerated() {
                    if i == nums.count - map.count + index {
                        string += "("
                    }
                    string += "\(num)"
                }
                string += ")"
            } else {
                for num in nums {
                    string += "\(num)"
                }
            }
        }
        return string
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
    print(Solution().fractionToDecimal(-1, -2147483648))
    print(Solution().fractionToDecimal(50, -6))
    print(Solution().fractionToDecimal(1, 500))
    print(Solution().fractionToDecimal(1, 65535))
}