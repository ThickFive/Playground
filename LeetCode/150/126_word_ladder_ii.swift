/*	FILEPATH = "./LeetCode/150/126_word_ladder_ii.swift"
 *	126. Word Ladder II
	A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:
		Every adjacent pair of words differs by a single letter.
		Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
		sk == endWord
	Given two words, beginWord and endWord, and a dictionary wordList, return all the shortest transformation sequences from beginWord to endWord, or an empty list if no such sequence exists. Each sequence should be returned as a list of the words [beginWord, s1, s2, ..., sk].

	Example 1:
	Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
	Output: [["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]
	Explanation: There are 2 shortest transformation sequences:
	"hit" -> "hot" -> "dot" -> "dog" -> "cog"
	"hit" -> "hot" -> "lot" -> "log" -> "cog"

	Example 2:
	Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
	Output: []
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
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
		guard wordList.contains(endWord) else {
			return []	
		}
        var word_list = Set(wordList)
        if word_list.contains(beginWord) {
            word_list.remove(beginWord)
        }
		var queue: [String] = [beginWord]
		var words: [[String]] = []
		var is_loop_end = false
		loop: while queue.count > 0 {
			var list: [String] = []
			for word in queue {
				let next = next_words(word, &word_list)
				list += next
				if next.contains(endWord) {
					is_loop_end = true
				}
			}
			if is_loop_end {
				break loop
			} else {
				queue = list
				words.append(queue)
			}
		}
		//	过滤不符合要求的字符串
		var last_words: [String] = [endWord]
		var i = 0
		while i < words.count - 1 {
			var tmp = Set<String>()
			for word0 in words[words.count - 1 - i] {
				for word1 in last_words {
					if is_next(word0, word1) {
						tmp.insert(word0)
					}
				}
			}
			last_words = Array(tmp)
			words[words.count - 1 - i] = last_words
			i += 1
		}
		var res:[[String]] = []
		func backtrack(_ path: [String], _ index: Int) {
			if index == words.count {
                if is_next(path[path.count - 1], endWord) {
                    res.append(path + [endWord])
                }
				return
			}
			var path = path
			for word in words[index] {
				if is_next(path[path.count - 1], word) == false {
					continue
				}
				path.append(word)
				backtrack(path, index + 1)
				path.remove(at: path.count - 1)
			}
		}
		backtrack([beginWord], 0)
		return res
	}

	func is_next(_ word0: String, _ word1: String) -> Bool {
		let chars0 = Array(word0)
		let chars1 = Array(word1)
		var count = 0
		for i in 0..<word0.count {
			if chars0[i] != chars1[i] {
				count += 1
				if count > 1 {
                    return false
                }
			}
		}
		return count == 1
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
    print(Solution().findLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
	print(Solution().findLadders("hit", "cog", ["hot","dot","dog","lot","log"]))
	print(Solution().findLadders("a", "c", ["a", "b", "c"]))
}