/*	FILEPATH = "./LeetCode/substring_with_concatenation_of_all_words.swift"
 *	30. Substring with Concatenation of All Words
	You are given a string s and an array of strings words of the same length. Return all starting indices of substring(s) in s that is a concatenation of each word in words exactly once, in any order, and without any intervening characters.
	You can return the answer in any order.

	Example 1:
	Input: s = "barfoothefoobarman", words = ["foo","bar"]
	Output: [0,9]
	Explanation: Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
	The output order does not matter, returning [9,0] is fine too.

	Example 2:
	Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
	Output: []

	Example 3:
	Input: s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
	Output: [6,9,12]

	Constraints:
		1 <= s.length <= 104
		s consists of lower-case English letters.
		1 <= words.length <= 5000
		1 <= words[i].length <= 30
		words[i] consists of lower-case English letters.
 */

/**
 *  思路: 同样是从头开始遍历, 针对性优化从严重超时 Time Limit Exceeded 到 fast then 75%
 *  1. 利用简单的 hash 过滤绝大部分不必要的匹配, 单个字符对应的素数相加之和重复的概率比用 ascii 值低
 *  2. 记录 hash 相等但是不匹配的字符串, 最大程度上减少重复匹配
 *  3. Swift Debug 模式下 for in 循环比 while 慢, Substring 也很慢, 改用 [Character] 数组计算下一个 hash 速度会快很多, 每次只需要计算 2 个字符就够了
 */
class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let s = chars(s)
        let words = words.map({chars($0)})
        let s_length = s.count
        let w_length = words.reduce(0, {
            $0 + $1.count
        })
        if s_length < w_length {
            return []
        }
        let w_hash = words.reduce(0, {
            $0 + hash($1)
        })
        let w_sub_length = words.count > 0 ? words[0].count : 0
        var invalid_string_list: [[Character]] = []
        var valid_string_list: [[Character]] = []
        var res: [Int] = []
        var i = 0
        var s_hash = 0
        while i <= s_length - w_length {
            if i == 0 {
                s_hash = hash(Array(s[i..<i+w_length]))
            } else {
                s_hash += map[s[i + w_length - 1]]! - map[s[i - 1]]!
            }
            if w_hash == s_hash {
                let sub_string = Array(s[i..<i+w_length])
                if invalid_string_list.contains(sub_string) {
                    i += 1
                    continue
                }
                if valid_string_list.contains(sub_string) {
                    res.append(i)
                    i += 1
                    continue
                }
                var is_match = true
                var words = words
                for j in 0..<words.count {
                    let word = Array(s[(i + j * w_sub_length)..<(i + (j + 1) * w_sub_length)])
                    if !words.contains(word) {
                        is_match = false
                        break
                    } else {
                        let index = words.firstIndex(of: word)!
                        words.remove(at: index)
                    }
                }
                if is_match {
                    res.append(i)
                    valid_string_list.append(sub_string)
                } else {
                    invalid_string_list.append(sub_string)
                }
            }
            i += 1
        }
        return res
    }

    func chars(_ s: String) -> [Character] {
        var res: [Character] = []
        for c in s {
            res.append(c)
        }
        return res
    }
    
    func hash(_ s: [Character]) -> Int {
        var hashvalue: Int = 0
        for c in s {
            hashvalue += map[c]!
        }
        return hashvalue
    }

    let map: [Character: Int] = [
        "a": 11,
        "b": 13,
        "c": 17,
        "d": 19,
        "e": 23,
        "f": 29,
        "g": 31,
        "h": 37,
        "i": 39,
        "j": 41,
        "k": 43,
        "l": 47,
        "m": 53,
        "n": 59,
        "o": 61,
        "p": 67,
        "q": 71,
        "r": 73,
        "s": 79,
        "t": 83,
        "u": 89,
        "v": 97,
        "w": 101,
        "x": 103,
        "y": 107,
        "z": 109
    ]
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
   print(Solution().findSubstring("abababab", ["ab","ba"]))
   print(Solution().findSubstring("barfoothefoobarman", ["foo","bar"]))
   print(Solution().findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"]))
}