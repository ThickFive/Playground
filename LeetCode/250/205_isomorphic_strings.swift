/*	FILEPATH = "./LeetCode/250/205_isomorphic_strings.swift"
 *	205. Isomorphic Strings
	Given two strings s and t, determine if they are isomorphic.
	Two strings s and t are isomorphic if the characters in s can be replaced to get t.
	All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

	Example 1:
	Input: s = "egg", t = "add"
	Output: true

	Example 2:
	Input: s = "foo", t = "bar"
	Output: false

	Example 3:
	Input: s = "paper", t = "title"
	Output: true

	Constraints:
		1 <= s.length <= 5 * 10^4
		t.length == s.length
		s and t consist of any valid ascii character.
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map: [Character: Character] = [:]
        var set: Set<Character> = []
        for (char_s, char_t) in zip(s, t) {
            if let char = map[char_s] {
                if char != char_t {
                    return false
                }
            } else {
                if set.contains(char_t) {
                    return false
                }
                map[char_s] = char_t
                set.insert(char_t)
            }
        }
        return true
    }
}

//  字符串循环里面用判断条件里面使用 String.count 会导致速度变慢
//  e.g. `while i < string.count` 比 `let count = string.count; while i < count` 慢很多
//  原因如下: 
//  0. 在 Swift 里面 String.count { get } 是一个计算属性
//  1. extension String: BidirectionalCollection {}
//  2. protocol BidirectionalCollection: Collection
//  3. protocol Collection { var count: Int { get } }, 具体计算过程如下   
/*  - Complexity: O(1) if the collection conforms to `RandomAccessCollection`; otherwise, O(*n*), where *n* is the length of the collection.
    public var count: Int {
        return distance(from: startIndex, to: endIndex)
    }

    public func distance(from start: Index, to end: Index) -> Int {
        _precondition(start <= end,
        "Only BidirectionalCollections can have end come before start")

        var start = start
        var count = 0
        while start != end {
            count = count + 1
            formIndex(after: &start)
        }
        return count
    }
 */
//  也就是说 String 的 count 属性是从 String -> BidirectionalCollection -> Collection 而来
//  而 String 继承的是 BidirectionalCollection 而不是 RandomAccessCollection 协议
//  因此计算 count 的时间复杂度是 O(n), 遍历字符串时再使用 String.count 的时间复杂度为 O(n^2)
//  结论: 不要在遍历字符串的循环里(包括判断条件)再使用 string.count, 应该提前用一个临时变量 var count = string.count 记录
class Solution0 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map: [Character: Character] = [:]
        var set: Set<Character> = []
        let chars_s = Array(s)
        let chars_t = Array(t)
        let count = s.count
        var i = 0
        while i < count {
            let char_s = chars_s[i]
            let char_t = chars_t[i]
            if let char = map[char_s] {
                if char != char_t {
                    return false
                }
            } else {
                if set.contains(char_t) {
                    return false
                }
                map[char_s] = char_t
                set.insert(char_t)
            }
            i += 1
        }
        return true
    }
}

class Solution1 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map: [Character: Character] = [:]
        var set: Set<Character> = []
        let chars_s = Array(s)
        let chars_t = Array(t)
        for i in 0..<s.count {
            let char_s = chars_s[i]
            let char_t = chars_t[i]
            if let char = map[char_s] {
                if char != char_t {
                    return false
                }
            } else {
                if set.contains(char_t) {
                    return false
                }
                map[char_s] = char_t
                set.insert(char_t)
            }
        }
        return true
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
    print(Solution().isIsomorphic("egg", "add"))
    print(Solution().isIsomorphic("foo", "bar"))
    print(Solution().isIsomorphic("paper", "title"))
    print(Solution().isIsomorphic("acd", "acc"))
}