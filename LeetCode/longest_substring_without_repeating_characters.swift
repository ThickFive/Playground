/*  FILEPATH = "./LeetCode/longest_substring_without_repeating_characters.swift"
 *  3. Longest Substring Without Repeating Characters

    Given a string s, find the length of the longest substring without repeating characters.

    Example 1:
    Input: s = "abcabcbb"
    Output: 3
    Explanation: The answer is "abc", with the length of 3.

    Example 2:
    Input: s = "bbbbb"
    Output: 1
    Explanation: The answer is "b", with the length of 1.
    
    Example 3:
    Input: s = "pwwkew"
    Output: 3
    Explanation: The answer is "wke", with the length of 3.
    Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
    
    Example 4:
    Input: s = ""
    Output: 0
 */

class Solution {
    //  优化版本 O(n)
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var string: [Character] = []
        for c in s {
            string.append(c)
        }
        
        var max = 0
        var chars: [Character] = []
        let length = s.count
        
        for i in 0..<length {
            let char = string[i]
            if let same_char_index = chars.firstIndex(of: char) {
                chars = Array(chars[(same_char_index+1)..<chars.count])
            }
            chars.append(char)
            max = chars.count > max ? chars.count : max
        }
    
        return max
    }
    
    //  暴力循环版本 O(n^2)
    func _lengthOfLongestSubstring(_ s: String) -> Int {
        var string: [Character] = []
        for c in s {
            string.append(c)
        }
        
        var max = 0
        var chars: [Character] = []
        let length = s.count
        var index = 0
        
        for _ in 0..<length {
            for i in index..<length {
                let char = string[i]
                if chars.contains(char) {
                    chars = []
                    index += 1
                    break
                } else {
                    chars.append(char)
                }
                max = chars.count > max ? chars.count : max
            }
        }
        return max
    }
}

/*
 *  TEST
 */
import Foundation
class Test {
    class func run(_ code:() -> ()) {
        print(Date(), "TEST START")
        code()
        print(Date(), "TEST END")
    }
}

