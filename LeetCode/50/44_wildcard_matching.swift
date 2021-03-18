/*	FILEPATH = "./LeetCode/50/44_wildcard_matching.swift"
 *	44. Wildcard Matching
	Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*' where:
		'?' Matches any single character.
		'*' Matches any sequence of characters (including the empty sequence).
	The matching should cover the entire input string (not partial).

	Example 1:
	Input: s = "aa", p = "a"
	Output: false
	Explanation: "a" does not match the entire string "aa".

	Example 2:
	Input: s = "aa", p = "*"
	Output: true
	Explanation: '*' matches any sequence.

	Example 3:
	Input: s = "cb", p = "?a"
	Output: false
	Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.

	Example 4:
	Input: s = "adceb", p = "*a*b"
	Output: true
	Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".

	Example 5:
	Input: s = "acdcb", p = "a*c?b"
	Output: false

	Constraints:
		0 <= s.length, p.length <= 2000
		s contains only lowercase English letters.
		p contains only lowercase English letters, '?' or '*'.
 */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var regular = ""
        var last: Character = " "
        for c in p {
            if c == "?" {
                regular += "."
            } else if c == "*" && last != "*" {
                regular += ".*"
            } else {
                regular += String(c)
            }
            last = c
        }
        return regular_expression_matching(s, regular)
    }

    func regular_expression_matching(_ s: String, _ p: String) -> Bool {
        //  1. 将 pattern 分割为单个字符 sub pattern, 并记录 * 标记
        var string: [Character] = [] 
        for c in s {
            string.append(c)
        }
        var chars: [Character] = []
        var marks : [Bool] = [] //  标记后缀是否为 * 
        var is_mark: Bool = false
        for (_, c) in p.enumerated().reversed() {
            if c == "*" {
                is_mark = true
            } else {
                chars.insert(c, at: 0)
                marks.insert(is_mark, at: 0)
                is_mark = false
            }
        }
        
        //  2. 根据上一轮的范围计算本次的结果, 判断是否下一轮起始位置是否需要 +1, 即 range[2] 的值
        func next_range(_ list: [[Int]], _ char: Character, _ mark: Bool) -> [[Int]] {
            var res = Set<[Int]>()
            for range in list {
                let lower = range[0] + range[2]
                let upper = range[1] + 1
                for i in lower...upper {
                    if mark {
                        var j = i
                        var count = 0
                        while j < string.count {
                            if char == string[j] || char == "." {
                                j += 1
                                count += 1
                            } else {
                                break
                            }
                        }
                        j = i + (count > 0 ? count - 1 : 0) 
                        if count > 0 {
                            res.insert([i, j, 0])
                        } else {
                            res.insert(range)
                        }
                    } else {
                        if i < string.count && (char == string[i] || char == ".") {
                            res.insert([i, i, 1])
                        }
                    }
                }
            }
            return Array(res)
        }

        var list = [[-1, -1, 1]]    //  [start, end, is_need_to_add_next_start]
        for (index, c) in chars.enumerated() {
            let mark = marks[index]
            list = next_range(list, c, mark)
        }
        
        //  3. 结束后计算下标的最大值, 如果等于字符串的长度 -1 即匹配成功
        var max = Int.min
        for rang in list {
            max = max > rang[1] ? max : rang[1]
        }
        
        return max == string.count - 1
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
    print(Solution().isMatch("aa", "a"))
    print(Solution().isMatch("aa", "*"))
    print(Solution().isMatch("cb", "?a"))
    print(Solution().isMatch("adceb", "*a*b"))
    print(Solution().isMatch("ababaabaabbbbbabbbaaababbaabbbbbaaabaabababaaaabbabbbbabbaaaaaaaaabaababbaabaaababaababaabbabbbbbabababbabaabbbaababbbababaaabbbbbbbbbabaababaaabababbbbabbaabaaabbbababbbbbbbbabaaaabbabbbbabbaaabbbbababab", "ab**bbb*a*ab*bb*aa*a***ab*b**b***bba****b*aaabaa**bb*ab*a***abb****bb*a**b*****a*abaa**a****aab**aa**bbb"))
}