/*	FILEPATH = "./LeetCode/150/127_word_ladder.swift"
 *	127. Word Ladder
	A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:
		Every adjacent pair of words differs by a single letter.
		Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
		sk == endWord
	Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

	Example 1:
	Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
	Output: 5
	Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.

	Example 2:
	Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
	Output: 0
	Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.

	Constraints:
		1 <= beginWord.length <= 10
		endWord.length == beginWord.length
		1 <= wordList.length <= 5000
		wordList[i].length == beginWord.length
		beginWord, endWord, and wordList[i] consist of lowercase English letters.
		beginWord != endWord
		All the words in wordList are unique.
 */

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
		var res = false
		var count = 1
        var word_list = Set(wordList)
		var queue: [String] = [beginWord]
		loop: while queue.count > 0 {
			count += 1
			var list: [String] = []
			for word in queue {
				list += next_words(word, &word_list)
				if list.contains(endWord) {
					res = true
					break loop
				}
			}
			queue = list
		}
		return res == true ? count : 0
    }
    
    func next_words(_ word: String, _ word_list: inout Set<String>) -> [String] {
		var res: [String] = []
		var chars = Array(word)
		let alphabeta = Array("abcdefghijklmnopqrstvuwxyz")
		for (i, char) in chars.enumerated() {
			for c in alphabeta {
				if c == char {
					continue
				} else {
					chars[i] = c
					let string = String(chars)
					if word_list.contains(string) {
						res.append(string)
						word_list.remove(string)
					}
				}
				chars[i] = char
			}
		}
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
    print(Solution().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
	print(Solution().ladderLength("hit", "cog", ["hot","dot","dog","lot","log"]))
}