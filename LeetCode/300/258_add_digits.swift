/*	FILEPATH = "./LeetCode/300/258_add_digits.swift"
 *	258. Add Digits
	Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

	Example 1:
	Input: num = 38
	Output: 2
	Explanation: The process is
	38 --> 3 + 8 --> 11
	11 --> 1 + 1 --> 2 
	Since 2 has only one digit, return it.

	Example 2:
	Input: num = 0
	Output: 0

	Constraints:
		0 <= num <= 2^31 - 1
	Follow up: Could you do it without any loop/recursion in O(1) runtime?
 */

//  num = a(n)a(n-1)...a(1)a(0) = ∑a(n)*10^n, n >= 0
//  num0 = num
//  f(num0) = ∑a(n) = ∑a(n)*10^n - 9*k0 = num0 - 9*k0 = num - 9*k0
//  ... loop
//  num1 = f(num0)
//  f(num1) = num1 - 9 * k1 = num - 9*k0 - 9*k1
//  ...
//  f(numj) = num - 9*(k0 + k1 + .. + kj) = num - 9 * k, k >= 0
class Solution {
    func addDigits(_ num: Int) -> Int {
        return num > 0 ? (num % 9 == 0 ? 9 : num % 9) : 0 
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
    print(Solution().addDigits(38))
    print(Solution().addDigits(0))
}