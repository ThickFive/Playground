/*	FILEPATH = "./LeetCode/longest_common_prefix.swift"
 *	14. Longest Common Prefix
	Write a function to find the longest common prefix string amongst an array of strings.
	If there is no common prefix, return an empty string "".

	Example 1:
	Input: strs = ["flower","flow","flight"]
	Output: "fl"

	Example 2:
	Input: strs = ["dog","racecar","car"]
	Output: ""
	Explanation: There is no common prefix among the input strings.

	Constraints:
		0 <= strs.length <= 200
		0 <= strs[i].length <= 200
		strs[i] consists of only lower-case English letters.
 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        let chars_array = strs.map({ str -> [Character] in
            var chars: [Character] = []
            for c in str {
                chars.append(c)
            }
            return chars
        })
        var string = ""
        var i = 0
        while true {
            var c: Character? = nil
            for chars in chars_array {
                if i >= chars.count {
                    return string
                } else {
                    if c == nil {
                        c = chars[i]
                    } else if chars[i] != c! {
                        return string
                    }
                }  
            }
            string += String(c!)
            i += 1
        }
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
    print(Solution().longestCommonPrefix(["flower","flow","flight"]))
    print(Solution().longestCommonPrefix(["flower","flow","flight"]))
    print(Solution().longestCommonPrefix(["dog","racecar","car"]))
    print(Solution().longestCommonPrefix(["","",""]))
    print(Solution().longestCommonPrefix([]))
}