/*	FILEPATH = "./LeetCode/250/208_implement_trie_(prefix_tree).swift"
 *	208. Implement Trie (Prefix Tree)
	A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
	Implement the Trie class:
		Trie() Initializes the trie object.
		void insert(String word) Inserts the string word into the trie.
		boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
		boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.

	Example 1:
	Input
	["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
	[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
	Output
	[null, null, true, false, true, null, true]
	Explanation
	Trie trie = new Trie();
	trie.insert("apple");
	trie.search("apple");   // return True
	trie.search("app");     // return False
	trie.startsWith("app"); // return True
	trie.insert("app");
	trie.search("app");     // return True

	Constraints:
		1 <= word.length, prefix.length <= 2000
		word and prefix consist only of lowercase English letters.
		At most 3 * 104 calls in total will be made to insert, search, and startsWith.
 */

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

class Trie {
    let root: TreeNode
    /** Initialize your data structure here. */
    init() {
        root = TreeNode(nil)
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
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
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = root
        for (i, c) in word.enumerated() {
            if let next = node.next[c] {
                node = next
            } else {
                return false
            }
            if i == word.count - 1 && node.mark == true {
                return true
            }
        }
        return false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for c in prefix {
            guard let next = node.next[c] else {
                return false
            }
            node = next
        }
        return true
    }
}
​
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

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
    
}