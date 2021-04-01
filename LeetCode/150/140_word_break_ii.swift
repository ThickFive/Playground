/*	FILEPATH = "./LeetCode/150/140_word_break_ii.swift"
 *	140. Word Break II
	Given a string s and a dictionary of strings wordDict, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order.
	Note that the same word in the dictionary may be reused multiple times in the segmentation.

	Example 1:
	Input: s = "catsanddog", wordDict = ["cat","cats","and","sand","dog"]
	Output: ["cats and dog","cat sand dog"]

	Example 2:
	Input: s = "pineapplepenapple", wordDict = ["apple","pen","applepen","pine","pineapple"]
	Output: ["pine apple pen apple","pineapple pen apple","pine applepen apple"]
	Explanation: Note that you are allowed to reuse a dictionary word.

	Example 3:
	Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
	Output: []

	Constraints:
		1 <= s.length <= 20
		1 <= wordDict.length <= 1000
		1 <= wordDict[i].length <= 10
		s and wordDict[i] consist of only lowercase English letters.
		All the strings of wordDict are unique.
 */

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let chars = Array(s)
		let word_dict = Set(wordDict)
		var dp: [[Int]] = Array(repeating: [], count: s.count + 1)
		dp[0] = [0]
		for i in 1...s.count {
			for j in 0..<i {
				if dp[j].count > 0 && word_dict.contains(String(chars[j..<i])) {
					dp[i] = dp[i] + [j]
				}
			}
		}
		var res: [String] = []
		func backtrack(_ path: [Int], _ index: Int) {
			if index == 0 {
				var prev = s.count
				var string = ""
				for i in path.reversed() {
					if i > 0 {
						string += chars[prev..<i]
						string += (i == s.count ? "" : " ")
					}
					prev = i
				}
				res.append(string)
				return
			}
			var path = path
			for i in dp[index] {
				path.append(i)
				backtrack(path, i)
				path.remove(at: path.count - 1)
			}
		}
		backtrack([s.count], s.count)
		return res
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
    print(Solution().wordBreak("catsanddog", ["cat","cats","and","sand","dog"]))
	print(Solution().wordBreak("pineapplepenapple", ["apple","pen","applepen","pine","pineapple"]))
	print(Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"]))
}