/*	FILEPATH = "./LeetCode/longest_palindromic_substring.swift"
 *	5. Longest Palindromic Substring
	Given a string s, return the longest palindromic substring in s.

	Example 1:
	Input: s = "babad"
	Output: "bab"
	Note: "aba" is also a valid answer.

	Example 2:
	Input: s = "cbbd"
	Output: "bb"

	Example 3:
	Input: s = "a"
	Output: "a"

	Example 4:
	Input: s = "ac"
	Output: "a"

	Constraints:
		1 <= s.length <= 1000
		s consist of only digits and English letters (lower-case and/or upper-case),
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count == 0 {
            return s
        }
        var string: [Character] = []
        for char in s {
            string.append(char)
        }
        let count = string.count
        //  长度为奇数, 奇数必然存在回文序列(单个字符)
        var max_1 = 0
        var index_1 = 0
        for i in 0..<count {
            var tmp = 0
            for j in 0..<count {
                if (i-j < 0 || i+j > count-1) {
                    break
                }
                if (string[i-j] != string[i+j]) {
                    break
                }
                max_1 = max_1 > tmp ? max_1 : tmp
                index_1 = max_1 > tmp ? index_1 : i
                tmp += 1
            }
        }
        //  长度为偶数, 偶数不一定存在
        var max_2 = 0
        var index_2 = -1
        for i in 0..<count {
            var tmp = 0
            for j in 0..<count {
                if (i-j < 0 || i+j+1 > count-1) {
                    break
                }
                if (string[i-j] != string[i+j+1]) {
                    break
                }
                tmp += 1
                max_2 = max_2 > tmp ? max_2 : tmp
                index_2 = max_2 > tmp ? index_2 : i
            }
        }
        //  输出两种情况下的最长序列
        if ((max_1 * 2 + 1) >= max_2 * 2) {
            let start = s.index(s.startIndex, offsetBy: index_1 - max_1)
            let end = s.index(s.startIndex, offsetBy: index_1 + max_1 + 1)
            return String(s[start..<end])
        } else {
            let start = s.index(s.startIndex, offsetBy: index_2 - max_2 + 1)
            let end = s.index(s.startIndex, offsetBy: index_2 + max_2 + 1)
            return String(s[start..<end])
        }  
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
    print(Solution().longestPalindrome("babad"))
    print(Solution().longestPalindrome("cbbd"))
    print(Solution().longestPalindrome("a"))
    print(Solution().longestPalindrome("ac"))
    print(Solution().longestPalindrome(""))
    print(Solution().longestPalindrome("ajsgjaldjgabcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcbakkk"))
    print(Solution().longestPalindrome("hh一二三二一kk"))
}

