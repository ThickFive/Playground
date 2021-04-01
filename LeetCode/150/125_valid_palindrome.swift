/*	FILEPATH = "./LeetCode/150/125_valid_palindrome.swift"
 *	125. Valid Palindrome
	Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

	Example 1:
	Input: s = "A man, a plan, a canal: Panama"
	Output: true
	Explanation: "amanaplanacanalpanama" is a palindrome.

	Example 2:
	Input: s = "race a car"
	Output: false
	Explanation: "raceacar" is not a palindrome.

	Constraints:
		1 <= s.length <= 2 * 10^5
		s consists only of printable ASCII characters.
 */

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars =  Array(s.lowercased())
        var i = 0
        var j = s.count - 1
        while i < j {
            if chars[i] < "0" || (chars[i] > "9" && chars[i] < "A") || (chars[i] > "Z" && chars[i] < "a") || chars[i] > "z" {
                i += 1
                continue
            }
            if chars[j] < "0" || (chars[j] > "9" && chars[j] < "A") || (chars[j] > "Z" && chars[j] < "a") || chars[j] > "z" {
                j -= 1
                continue
            }
            if chars[i] == chars[j] {
                i += 1
                j -= 1
            } else {
                return false
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
    
}