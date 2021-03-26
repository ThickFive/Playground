/*	FILEPATH = "./LeetCode/100/72_edit_distance.swift"
 *	72. Edit Distance
	Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
	You have the following three operations permitted on a word:
		Insert a character
		Delete a character
		Replace a character

	Example 1:
	Input: word1 = "horse", word2 = "ros"
	Output: 3
	Explanation: 
	horse -> rorse (replace 'h' with 'r')
	rorse -> rose (remove 'r')
	rose -> ros (remove 'e')

	Example 2:
	Input: word1 = "intention", word2 = "execution"
	Output: 5
	Explanation: 
	intention -> inention (remove 't')
	inention -> enention (replace 'i' with 'e')
	enention -> exention (replace 'n' with 'x')
	exention -> exection (replace 'n' with 'c')
	exection -> execution (insert 'u')

	Constraints:
		0 <= word1.length, word2.length <= 500
		word1 and word2 consist of lowercase English letters.
 */

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let row = word1.count + 1
        let col = word2.count + 1
        let chs1  = Array(word1)
        let chs2  = Array(word2)
        var dp: [[Int]] = Array(repeating: Array(repeating:0, count: col), count: row)
        for i in 0..<row {  //  i, j 分别表示前 i 个字符
            for j in 0..<col {
                if i == 0 {
                    dp[i][j] = j
                } else if j == 0 {
                    dp[i][j] = i
                } else if chs1[i - 1] == chs2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = 1 + min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1])
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
    var word1, word2: String
    word1 = "horse"; word2 = "ros"
    print(Solution().minDistance(word1, word2))
    word1 = "intention"; word2 = "execution"
    print(Solution().minDistance(word1, word2))
    word1 = "ab"; word2 = "ab"
    print(Solution().minDistance(word1, word2))
    word1 = "1cccc2aaa3bbb4"; word2 = "aaa5bbb6cccc"
    print(Solution().minDistance(word1, word2))
}