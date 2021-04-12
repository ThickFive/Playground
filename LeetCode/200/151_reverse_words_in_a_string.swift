/*	FILEPATH = "./LeetCode/200/151_reverse_words_in_a_string.swift"
 *	151. Reverse Words in a String
	Given an input string s, reverse the order of the words.
	A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
	Return a string of the words in reverse order concatenated by a single space.
	Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

	Example 1:
	Input: s = "the sky is blue"
	Output: "blue is sky the"

	Example 2:
	Input: s = "  hello world  "
	Output: "world hello"
	Explanation: Your reversed string should not contain leading or trailing spaces.

	Example 3:
	Input: s = "a good   example"
	Output: "example good a"
	Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.

	Example 4:
	Input: s = "  Bob    Loves  Alice   "
	Output: "Alice Loves Bob"

	Example 5:
	Input: s = "Alice does not even like bob"
	Output: "bob like even not does Alice"

	Constraints:
		1 <= s.length <= 104
		s contains English letters (upper-case and lower-case), digits, and spaces ' '.
		There is at least one word in s.
	Follow up: Could you solve it in-place with O(1) extra space?
 */

class Solution {
    func reverseWords(_ s: String) -> String {
        let s = Array(s)
        var chars: [Character] = []
        //  reverse string, reduce spaces
        for i in (0..<s.count).reversed() {
            if s[i] != " " || (i > 0 && s[i - 1] != " ") {
                chars.append(s[i])
            }
        }
        //  remove first space if exist
        if chars.count > 0 && chars[0] == " " {
            chars.remove(at: 0)
        }
        //  reverse word
        let count = chars.count
        var i = 0
        while i < count {
            var j = i
            while j <= count {
                if j == count || chars[j] == " " {  //  end of word or string
                    let length = j - i
                    for k in 0..<length / 2 {
                        let tmp = chars[i + k]
                        chars[i + k] = chars[j - k - 1]
                        chars[j - k - 1] = tmp
                    }
                    j += 1
                    break
                } else {
                    j += 1
                }
            }
            i = j 
        }
        return String(chars)
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