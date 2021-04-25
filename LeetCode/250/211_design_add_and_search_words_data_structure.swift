/*	FILEPATH = "./LeetCode/250/211_design_add_and_search_words_data_structure.swift"
 *	211. Design Add and Search Words Data Structure
	Design a data structure that supports adding new words and finding if a string matches any previously added string.
	Implement the WordDictionary class:
		WordDictionary() Initializes the object.
		void addWord(word) Adds word to the data structure, it can be matched later.
		bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.

	Example:
	Input
	["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
	[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
	Output
	[null,null,null,null,false,true,true,true]
	Explanation
	WordDictionary wordDictionary = new WordDictionary();
	wordDictionary.addWord("bad");
	wordDictionary.addWord("dad");
	wordDictionary.addWord("mad");
	wordDictionary.search("pad"); // return False
	wordDictionary.search("bad"); // return True
	wordDictionary.search(".ad"); // return True
	wordDictionary.search("b.."); // return True

	Constraints:
		1 <= word.length <= 500
		word in addWord consists lower-case English letters.
		word in search consist of  '.' or lower-case English letters.
		At most 50000 calls will be made to addWord and search.
 */

//  缓存查询结果勉强 work
class WordDictionary {
    let root: TreeNode
    var words: [[Character]] = []
    var cache: [String: Bool]
    /** Initialize your data structure here. */
    init() {
        self.root = TreeNode(nil)
        self.words = []
        self.cache = [:]
    }
    
    func addWord(_ word: String) {
        var node = root
        for (i, c) in word.enumerated() {
            if let next = node.next[c] {
                node = next
            } else {
                let next = TreeNode(c)
                node.next[c] = next
                node = next
            }
            if i == word.count - 1 {
                node.mark = true
            }
        }
        words.append(Array(word))
        refresh_cache(word)
    }
    
    func search(_ word: String) -> Bool {
        var res: Bool
        if let cached = cache[word] {
            res = cached
        } else {
            res = search_without_cache(word)
            cache[word] = res
        }
        return res
    }
    
    func refresh_cache(_ word: String) {
        cache = [:]
    }
    
    func search_without_cache(_ word: String) -> Bool {
        if Array(word).contains(".") {
            var new_words = words.filter({$0.count == word.count})
            for (i, c) in word.enumerated() {
                if c == "." {
                    continue
                }
                for (j, word) in new_words.enumerated().reversed() {
                    if c != word[i] {
                        new_words.remove(at: j)
                    }
                }
            }
            return new_words.count > 0
        } else {
            var node = root
            for (i, c) in word.enumerated() {
                if let next = node.next[c] {
                    node = next
                } else {
                    cache[word] = false
                    return false
                }
                if i == word.count - 1 && node.mark == true {
                    return true
                }
            }
            return false
        }
    }
}

class TreeNode {
    var character: Character?
    var mark: Bool
    var next: [Character: TreeNode]
    init(_ c: Character?) {
        self.character = c
        self.mark = false
        self.next = [:]
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
    let dict = WordDictionary()
    dict.addWord("abc")
    dict.addWord("abd")
    dict.addWord("cbd")
    print(dict.search("abc"))
    print(dict.search(".bc"))
    print(dict.search(".b."))
    print(dict.search(".bb"))
}