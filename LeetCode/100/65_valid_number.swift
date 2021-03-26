/*	FILEPATH = "./LeetCode/100/65_valid_number.swift"
 *	65. Valid Number
	A valid number can be split up into these components (in order):
		A decimal number or an integer.
		(Optional) An 'e' or 'E', followed by an integer.
	A decimal number can be split up into these components (in order):
		(Optional) A sign character (either '+' or '-').
		One of the following formats:
		
			At least one digit, followed by a dot '.'.
			At least one digit, followed by a dot '.', followed by at least one digit.
			A dot '.', followed by at least one digit.
		
		
	An integer can be split up into these components (in order):
		(Optional) A sign character (either '+' or '-').
		At least one digit.
	For example, all the following are valid numbers: ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"], while the following are not valid numbers: ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53"].
	Given a string s, return true if s is a valid number.

	Example 1:
	Input: s = "0"
	Output: true

	Example 2:
	Input: s = "e"
	Output: false

	Example 3:
	Input: s = "."
	Output: false

	Example 4:
	Input: s = ".1"
	Output: true

	Constraints:
		1 <= s.length <= 20
		s consists of only English letters (both uppercase and lowercase), digits (0-9), plus '+', minus '-', or dot '.'.
 */

class Solution {
    func isNumber(_ s: String) -> Bool {
        let chs = chars(s)
        if chs.count == 0 {
            return false
        }
        let components = split_by_e(chs)
        if components.count > 2 {
            return false
        }
        if components.count == 2 && (components[0].count == 0 || components[1].count == 0) {
            return false
        }
        if components.count == 2 {
            return is_valid_component0(components[0]) && is_valid_component1(components[1])
        }
        if components.count == 1 {
            return is_valid_component0(components[0])
        }
        return true
    }

    func is_valid_component0(_ chs: [Character]) -> Bool{
        let nums: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var dot_count = 0
        for (i, c) in chs.enumerated() {
            if c == "." {
                dot_count += 1
                var has_number_before = false
                var has_number_after = false
                if i > 0 {
                    has_number_before = nums.contains(chs[i-1])
                }
                if i < chs.count - 1 {
                    has_number_after = nums.contains(chs[i+1])
                }
                if (has_number_before || has_number_after) == false {
                    return false
                }
            }
            if i == 0 {
                if c == "+" || c == "-" {
                    var has_number_after = false
                    if chs.count > 1 {
                        has_number_after = nums.contains(chs[1]) || chs[1] == "."
                    }
                    if has_number_after == false {
                        return false
                    }
                }
            } else {
                if c == "+" || c == "-" {
                    return false
                }
            }
        }
        if dot_count > 1 {
            return false
        }
        return true
    }

    func is_valid_component1(_ chs: [Character]) -> Bool{
        let nums: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for (i, c) in chs.enumerated() {
            if i == 0 {
                if c == "." {
                    return false
                }
                if c == "+" || c == "-" {
                    var has_number_after = false
                    if chs.count > 1 {
                        has_number_after = nums.contains(chs[1])
                    }
                    if has_number_after == false {
                        return false
                    }
                }
            } else {
                if c == "+" || c == "-" || c == "." {
                    return false
                }
            }
        }
        return true
    }

    func split_by_e(_ chs: [Character]) -> [[Character]] {
        var res: [[Character]] = []
        var tmp: [Character] = []
        for c in chs {
            if c == "e" || c == "E" {
                res.append(tmp)
                tmp = []
            } else {
                tmp.append(c)
            }
        }
        res.append(tmp)
        return res
    }

    func chars(_ s: String) -> [Character] {
        let valid_chars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "e", "E", "+", "-", "."]
        var chs: [Character] = []
        for c in s {
            chs.append(c)
            if valid_chars.contains(c) == false {
                chs = []
                break
            }
        }
        return chs
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