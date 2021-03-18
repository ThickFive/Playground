/*	FILEPATH = "./LeetCode/50/20_valid_parentheses.swift"
 *	20. Valid Parentheses
	Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
	An input string is valid if:
		Open brackets must be closed by the same type of brackets.
		Open brackets must be closed in the correct order.

	Example 1:
	Input: s = "()"
	Output: true

	Example 2:
	Input: s = "()[]{}"
	Output: true

	Example 3:
	Input: s = "(]"
	Output: false

	Example 4:
	Input: s = "([)]"
	Output: false

	Example 5:
	Input: s = "{[]}"
	Output: true

	Constraints:
		1 <= s.length <= 104
		s consists of parentheses only '()[]{}'.
 */

class Solution {
    func isValid(_ s: String) -> Bool {
		var stack: [Character] = []
		for c in s {
			if c == "(" || c == "[" || c == "{" {
				stack.append(c)
			} else {
				if stack.count == 0 {
					return false
				}
				let char = stack[stack.count - 1]
				if (c == ")" && char == "(") || (c == "]" && char == "[") || (c == "}" && char == "{") {
					stack.remove(at: stack.count - 1)
				} else {
					return false
				}
			}
		}
        return stack.count == 0
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
    print(Solution().isValid("()"))
	print(Solution().isValid("()[]{}"))
	print(Solution().isValid("(]"))
	print(Solution().isValid("([)]"))
	print(Solution().isValid("{[]}"))
}