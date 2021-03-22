/*	FILEPATH = "./LeetCode/100/76_minimum_window_substring.swift"
 *	76. Minimum Window Substring
	Given two strings s and t, return the minimum window in s which will contain all the characters in t. If there is no such window in s that covers all characters in t, return the empty string "".
	Note that If there is such a window, it is guaranteed that there will always be only one unique minimum window in s.

	Example 1:
	Input: s = "ADOBECODEBANC", t = "ABC"
	Output: "BANC"

	Example 2:
	Input: s = "a", t = "a"
	Output: "a"

	Constraints:
		1 <= s.length, t.length <= 105
		s and t consist of English letters.
	Follow up: Could you find an algorithm that runs in O(n) time?
 */

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.count < t.count {
            return ""
        }
        let chars_s = chars(s)
        let chars_t = chars(t)
        //  [start, end] 表示需要验证是否符合的区间
        let indexs = valid_indexs(chars_s, chars_t)
        if indexs.count < t.count {
            return ""
        }
        //  1. 从 s 的开头找到第一个包含 t 所有字符的区间 [start, end], 记录有所字符的位置与数量
        let target = target_chars(chars_t)
        let first_match_index = first_match(chars_s, indexs, target) 
        var start = first_match_index.0
        var end = first_match_index.1
        if end == -1 {
            return ""
        }
        var tmp: [Character: Int] = [:]
        for i in indexs {
            if i < indexs[start] {
                continue
            }
            if i > indexs[end] {
                break
            }
            let c = chars_s[i]
            if let _ = tmp[c] {
                tmp[c]! += 1 
            } else {
                tmp[c] = 1
            }
        }
        //  每次移动一次头部or尾部位置, 记录最小满足长度
        var min_length = indexs[end] - indexs[start]
        var min_start = start
        while end < indexs.count {
            //  start +1
            let c = chars_s[indexs[start]]
            if tmp[c]! > target[c]! {    // 说明最开头的字符是多余的, 头部移动一位
                start += 1
                tmp[c]! -= 1
                let current_length = indexs[end] - indexs[start]
                min_length = min_length < current_length ? min_length : current_length
                min_start = min_length < current_length ? min_start : start
                continue
            } else {    //  头部移动一位, 尾部一直移动直到重新补充这个字符
                start += 1
                tmp[c]! -= 1
                end += 1
                while end < indexs.count {
                    let e = chars_s[indexs[end]]
                    tmp[e]! += 1
                    if e == c {
                        let current_length = indexs[end] - indexs[start]
                        min_length = min_length < current_length ? min_length : current_length
                        min_start = min_length < current_length ? min_start : start
                        break
                    }
                    end += 1
                }  
            }
        }
        return Array(chars_s[indexs[min_start]...indexs[min_start] + min_length]).join("")
    }

    func first_match(_ s: [Character], _ indexs: [Int], _ target: [Character: Int]) -> (Int, Int) {
        var target = target
        var tmp = -1
        func reach_target() -> Bool {
            var res = true
            for (_, value) in target {
                if value > 0 {
                    res = false
                    break
                }
            }
            return res
        }
        for (i, index) in indexs.enumerated() {
            target[s[index]]! -= 1
            if reach_target() {
                tmp = i
                break
            }
        }
        return (0, tmp)
    }

    func valid_indexs(_ s: [Character], _ t: [Character]) -> [Int] {
        var res: [Int] = []
        for (i, c) in s.enumerated() {
            if t.contains(c) {
                res.append(i)
            }
        }
        return res
    }

    func target_chars(_ t: [Character]) -> [Character: Int] {
        var map: [Character: Int] = [:]
        for c in t {
            if let _ = map[c] {
                map[c]! += 1
            } else {
                map[c] = 1
            }
        }
        return map
    }

    func chars(_ s: String) -> [Character] {
        var chs: [Character] = []
        for c in s {
            chs.append(c)
        }
        return chs
    }
}

extension Array {
    func join(_ s: String) -> String {
        if self.count == 0 {
            return ""
        }
        if self.count == 1 {
            return "\(self[0])"
        }
        var string = ""
        for i in 0..<self.count - 1 {
            string += "\(self[i])\(s)"
        }
        string += "\(self[self.count - 1])"
        return string
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
    print(Solution().minWindow("babb", "baba"))
}