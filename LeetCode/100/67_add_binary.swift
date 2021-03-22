/*	FILEPATH = "./LeetCode/100/67_add_binary.swift"
 *	67. Add Binary
	Given two binary strings a and b, return their sum as a binary string.

	Example 1:
	Input: a = "11", b = "1"
	Output: "100"

	Example 2:
	Input: a = "1010", b = "1011"
	Output: "10101"

	Constraints:
		1 <= a.length, b.length <= 104
		a and b consist only of '0' or '1' characters.
		Each string does not contain leading zeros except for the zero itself.
 */

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let chars_a = chars(a)
        let chars_b = chars(b)
        var flag: Character = "0"
        var string = ""
        var i = 0
        while i < chars_a.count || i < chars_b.count {
            let res = add(char(chars_a, i), char(chars_b, i), flag)
            flag = res.0
            string = String(res.1) + string
            i += 1
        }
        return flag == "0" ? string : "1" + string 
    }
    
    func add(_ a: Character, _ b: Character, _ c: Character) -> (Character, Character) {
        if c == "0" {
            if a == "1" && b == "1" {return ("1", "0")}
            if a == "0" && b == "0" {return ("0", "0")}
            return ("0", "1")
        } else {
            if a == "1" && b == "1" {return ("1", "1")}
            if a == "0" && b == "0" {return ("0", "1")}
            return ("1", "0")
        }
    }
    
    func chars(_ s: String) -> [Character] {
        var chs: [Character] = []
        for c in s.reversed() {
            chs.append(c)
        }
        return chs
    }
    
    func char(_ chars: [Character], _ index: Int) -> Character {
        if index < chars.count {return chars[index]}
        return "0"
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
    print(Solution().addBinary("11", "1"))
    print(Solution().addBinary("1010", "1011"))
}