/*	FILEPATH = "./LeetCode/longest_valid_parentheses.swift"
 *	32. Longest Valid Parentheses
	Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

	Example 1:
	Input: s = "(()"
	Output: 2
	Explanation: The longest valid parentheses substring is "()".

	Example 2:
	Input: s = ")()())"
	Output: 4
	Explanation: The longest valid parentheses substring is "()()".

	Example 3:
	Input: s = ""
	Output: 0

	Constraints:
		0 <= s.length <= 3 * 104
		s[i] is '(', or ')'.
 */

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        return 0
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