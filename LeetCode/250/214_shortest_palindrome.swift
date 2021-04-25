/*	FILEPATH = "./LeetCode/250/214_shortest_palindrome.swift"
 *	214. Shortest Palindrome
	You are given a string s. You can convert s to a palindrome by adding characters in front of it.
	Return the shortest palindrome you can find by performing this transformation.

	Example 1:
	Input: s = "aacecaaa"
	Output: "aaacecaaa"

	Example 2:
	Input: s = "abcd"
	Output: "dcbabcd"

	Constraints:
		0 <= s.length <= 5 * 104
		s consists of lowercase English letters only.
 */

class Solution {
    //  问题等价于找到以第一个字符开头的最长回文子序列, 然后用余下的字符倒序补齐开头得到最终结果
    //  Manacher O(n), 将每个字符都用 `#` 隔开, 新字符串长度为一定为奇数, 那么回文序列的长度也一定为奇数
    //  中心扩散法, 确定以每个字符为中心长度的回文长度, 利用镜像对称的原理, 可以跳过部分已经扫描的序列
    //  e.g. ab -> #a#b#, abc -> #a#b#c#
    //  c: 中心点, r: 右边界 e.g. aba 以 b 为中心点时, c = 1, r = 2
    func shortestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var string: [Character] = ["#"]
        for c in chars {
            string.append(c)
            string.append("#")
        }
        var max_index = 0
        var dp: [Int] = Array(repeating: 0, count: string.count)
        var r = 0
        var c = 0
        for i in 0..<string.count {
            let mirror = 2 * c - i
            if i < r {
                dp[i] = min(r - i, dp[mirror])
            }
            var a = i + (1 + dp[i])
            var b = i - (1 + dp[i])
            while a < string.count && b >= 0 && string[a] == string[b] {
                dp[i] += 1
                a += 1
                b -= 1
            }
            if i + dp[i] > r {
                c = i
                r = i + dp[i]
            }
            if i == dp[i] {
                max_index = i   //  以第一个数开头的最长回文序列索引
            }
        }
        print(max_index)
        return String(Array(chars[max_index..<chars.count].reversed()) + chars)
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
    print(Solution().shortestPalindrome("a"))
}