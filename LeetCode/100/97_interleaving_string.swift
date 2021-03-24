/*	FILEPATH = "./LeetCode/100/97_interleaving_string.swift"
 *	97. Interleaving String
	Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.
	An interleaving of two strings s and t is a configuration where they are divided into non-empty substrings such that:
		s = s1 + s2 + ... + sn
		t = t1 + t2 + ... + tm
		|n - m| <= 1
		The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
	Note: a + b is the concatenation of strings a and b.

	Example 1:
	Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
	Output: true

	Example 2:
	Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
	Output: false

	Example 3:
	Input: s1 = "", s2 = "", s3 = ""
	Output: true

	Constraints:
		0 <= s1.length, s2.length <= 100
		0 <= s3.length <= 200
		s1, s2, and s3 consist of lowercase English letters.
	Follow up: Could you solve it using only O(s2.length) additional memory space?
 */

 class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count {
            return false
        }
        var chs1 = chars(s1)
        var chs2 = chars(s2)
        let chs3 = chars(s3)
        var res = remove_s1_first(chs1, chs2, chs3)
        if res == false {
            res = remove_s1_first(chs2, chs1, chs3)
        }
        if res == false {
            res = remove_if_equal(chs2, chs1, chs3)
        }
        return res
    }
    
    func remove_if_equal(_ chs1: [Character], _ chs2: [Character], _ chs3: [Character]) -> Bool {
        print("remove_if_equal")
        var res = true
        if chs1.count == 0 {
            res = remove_s1_first(chs2, chs1, chs3)
        } else if chs2.count == 0 {
            res = remove_s1_first(chs1, chs2, chs3)
        } else {
            let char1 = chs1[0]
            let char2 = chs2[0]
            let char3 = chs3[0]
            if char1 == char3 && char1 != char2 {
                res = remove_if_equal(Array(chs1[1..<chs1.count]), chs2, Array(chs3[1..<chs3.count]))
            } else if char2 == char3 && char1 != char2 {
                res = remove_if_equal(chs1, Array(chs2[1..<chs2.count]), Array(chs3[1..<chs3.count]))
            } else if char1 == char3 && char1 == char2 {
                res = remove_if_equal(Array(chs1[1..<chs1.count]), chs2, Array(chs3[1..<chs3.count])) || remove_if_equal(chs1, Array(chs2[1..<chs2.count]), Array(chs3[1..<chs3.count]))
            } else {
                res = false
            }
        }
        return res
    }
    
    func remove_s1_first(_ chs1: [Character], _ chs2: [Character], _ chs3: [Character]) -> Bool {
        var res = true
        var i = 0
        var j = 0
        for c in chs3 {
            if i < chs1.count && chs1[i] == c {
                i += 1
            } else if j < chs2.count && chs2[j] == c {
                j += 1
            } else {
                res = false
                break
            }
        }
        return res
    }
    
    func chars(_ s: String) -> [Character] {
        var chs: [Character] = []
        for c in s {
            chs.append(c)
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