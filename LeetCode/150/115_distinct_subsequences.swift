/*	FILEPATH = "./LeetCode/150/115_distinct_subsequences.swift"
 *	115. Distinct Subsequences
	Given two strings s and t, return the number of distinct subsequences of s which equals t.
	A string's subsequence is a new string formed from the original string by deleting some (can be none) of the characters without disturbing the remaining characters' relative positions. (i.e., "ACE" is a subsequence of "ABCDE" while "AEC" is not).
	It is guaranteed the answer fits on a 32-bit signed integer.

	Example 1:
	Input: s = "rabbbit", t = "rabbit"
	Output: 3
	Explanation:
	As shown below, there are 3 ways you can generate "rabbit" from S.
	rabbbit
	rabbbit
	rabbbit

	Example 2:
	Input: s = "babgbag", t = "bag"
	Output: 5
	Explanation:
	As shown below, there are 5 ways you can generate "bag" from S.
	babgbag
	babgbag
	babgbag
	babgbag
	babgbag

	Constraints:
		1 <= s.length, t.length <= 1000
		s and t consist of English letters.
 */

class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        if t.count > s.count {
            return 0
        }
        let chars_s = Array(s)
        let chars_t = Array(t)
        let row = t.count + 1
        let col = s.count + 1
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: col), count: row)
        for i in 0..<row {
            for j in i..<col {
                if i == 0 {
                    dp[i][j] = 1
                } else if j > 0 {
                    if chars_s[j - 1] == chars_t[i - 1] {
                        dp[i][j] = dp[i - 1][j - 1] + dp[i][j - 1]
                    } else {
                        dp[i][j] = dp[i][j - 1]
                    }
                }
            }
        }
        return dp[row - 1][col - 1]
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
	var s, t: String
	s = "rabbbit"; t = "rabbit"
    print(Solution().numDistinct(s, t))
	s = "babgbag"; t = "bag"
	print(Solution().numDistinct(s, t))
}