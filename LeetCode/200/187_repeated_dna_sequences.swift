/*	FILEPATH = "./LeetCode/200/187_repeated_dna_sequences.swift"
 *	187. Repeated DNA Sequences
	The DNA sequence is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T'.
		For example, "ACGAATTCCG" is a DNA sequence.
	When studying DNA, it is useful to identify repeated sequences within the DNA.
	Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.

	Example 1:
	Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
	Output: ["AAAAACCCCC","CCCCCAAAAA"]

	Example 2:
	Input: s = "AAAAAAAAAAAAA"
	Output: ["AAAAAAAAAA"]

	Constraints:
		1 <= s.length <= 105
		s[i] is either 'A', 'C', 'G', or 'T'.
 */

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        if s.count <= 10 {
            return []
        }
        let chars = Array(s)
        var map: [String: Int] = [:]
        var res: [String] = []
        for i in 0...chars.count - 10 {
            let key = String(chars[i..<i+10])
            if let count = map[key] {
                map[key] = count + 1
                if count == 1 {
                    res.append(key)
                }
            } else {
                map[key] = 1
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
    print(Solution().findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
    print(Solution().findRepeatedDnaSequences("AAAAAAAAAAAAA"))
}