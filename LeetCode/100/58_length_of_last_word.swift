/*	FILEPATH = "./LeetCode/100/58_length_of_last_word.swift"
 *	58. Length of Last Word
	Given a string s consists of some words separated by spaces, return the length of the last word in the string. If the last word does not exist, return 0.
	A word is a maximal substring consisting of non-space characters only.

	Example 1:
	Input: s = "Hello World"
	Output: 5

	Example 2:
	Input: s = " "
	Output: 0

	Constraints:
		1 <= s.length <= 104
		s consists of only English letters and spaces ' '.
 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var res = 0
        var tmp = 0
        for c in s {
            if c == " " {
                tmp = 0
            } else {
                tmp += 1
                res = tmp
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
    
}