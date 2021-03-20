/*	FILEPATH = "./LeetCode/100/66_plus_one.swift"
 *	66. Plus One
	Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.
	The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.
	You may assume the integer does not contain any leading zero, except the number 0 itself.

	Example 1:
	Input: digits = [1,2,3]
	Output: [1,2,4]
	Explanation: The array represents the integer 123.

	Example 2:
	Input: digits = [4,3,2,1]
	Output: [4,3,2,2]
	Explanation: The array represents the integer 4321.

	Example 3:
	Input: digits = [0]
	Output: [1]

	Constraints:
		1 <= digits.length <= 100
		0 <= digits[i] <= 9
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var add = 1
        for i in 0..<digits.count {
            let index = digits.count - 1 - i
            var num = digits[index] + add
            add = num / 10
            num = num % 10
            digits[index] = num
        }
        if add > 0 {
            digits.insert(1, at: 0)
        }
        return digits
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
    print(Solution().plusOne([0]))
    print(Solution().plusOne([9,9,9,9]))
}