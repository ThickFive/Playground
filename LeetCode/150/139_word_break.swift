/*	FILEPATH = "./LeetCode/150/139_word_break.swift"
 *	139. Word Break
	Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
	Note that the same word in the dictionary may be reused multiple times in the segmentation.

	Example 1:
	Input: s = "leetcode", wordDict = ["leet","code"]
	Output: true
	Explanation: Return true because "leetcode" can be segmented as "leet code".

	Example 2:
	Input: s = "applepenapple", wordDict = ["apple","pen"]
	Output: true
	Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
	Note that you are allowed to reuse a dictionary word.

	Example 3:
	Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
	Output: false

	Constraints:
		1 <= s.length <= 300
		1 <= wordDict.length <= 1000
		1 <= wordDict[i].length <= 20
		s and wordDict[i] consist of only lowercase English letters.
		All the strings of wordDict are unique.
 */

class Solution {
	//	O(n^2)
	func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
		let chars = Array(s)
        let word_dict = Set(wordDict)
		var dp: [Bool] = Array(repeating: false, count: s.count + 1)
		dp[0] = true
		for i in 1...s.count {
			for j in 0..<i {
				if dp[j] == true && word_dict.contains(String(chars[j..<i])){
					dp[i] = true
				}
			}
		}
		return dp[s.count]
	}

	// O(n!)
    func _wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var map: [String: Bool] = [:]
        func word_break(_ chs: [Character]) -> Bool {
            if wordDict.contains(String(chs)) {
                return true
            }
            var res = false
            for i in 1..<chs.count {
                let key0 = String(chs[0..<i])
                let key1 = String(chs[i..<chs.count])
                let res0 = map[key0] ?? word_break(Array(key0))
                let res1 = map[key1] ?? word_break(Array(key1))
                if res0 && res1 {
                    res = true
                    break
                }
            }
            map[String(chs)] = res
            return res
        }
        return word_break(Array(s))
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
    print(Solution().wordBreak("leetcode", ["leet","code"]))
	print(Solution().wordBreak("applepenapple", ["apple","pen"]))
	print(Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"]))
}