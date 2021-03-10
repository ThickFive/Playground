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
		var string: [Character] = []
        for c in s {
            string.append(c)
        }

		func reverse(_ string: [Character]) -> [Character] {
			var res: [Character] = []
			for c in string.reversed() {
				res.append(c == "(" ? ")" : "(")
			}
			return res
		}
		// 如果整个字符串符合条件的 ")" 比 "(" 多, _max 返回正确的匹配数
		// 否则将字符串分为两部分, 后半部分字符串翻转, 分别计算匹配数, 返回最大值
		func _max(_ string: [Character]) -> Int {
			var max = 0
			var tmp = 0
			var last_continuous_index = 0
			var stack: [Character] = []
			for (i, c) in string.enumerated() {
				if c == "(" {
					if stack.count == 0 {
						last_continuous_index = i
					}
					stack.append(c)
				} else {
					let index = stack.count - 1
					if index >= 0 && stack[index] == "(" {
						stack.remove(at: index)
						tmp += 2
						max = tmp > max ? tmp : max  
					} else {
						stack.removeAll()
						tmp = 0
					}
				}
			}
			if (stack.count == 0) {
				return max
			} else {
				let a = _max(Array(string[0..<last_continuous_index]))
				let b =  _max(reverse(Array(string[last_continuous_index..<string.count])))
				return a > b ? a : b
			}
		}
		return _max(string)
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
	 print(Solution().longestValidParentheses("))))())()()(()"))
	 print(Solution().longestValidParentheses("()()(((()"))
	 print(Solution().longestValidParentheses("(((("))
	 print(Solution().longestValidParentheses("()()"))
	 print(Solution().longestValidParentheses("(()(((()"))
	 print(Solution().longestValidParentheses("())))))(((((()"))
}