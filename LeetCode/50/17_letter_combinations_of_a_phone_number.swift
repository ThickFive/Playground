/*	FILEPATH = "./LeetCode/50/17_letter_combinations_of_a_phone_number.swift"
 *	17. Letter Combinations of a Phone Number
	Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
	A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

	Example 1:
	Input: digits = "23"
	Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

	Example 2:
	Input: digits = ""
	Output: []

	Example 3:
	Input: digits = "2"
	Output: ["a","b","c"]

	Constraints:
		0 <= digits.length <= 4
		digits[i] is a digit in the range ['2', '9'].
 */

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        let map: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        var res: [String] = []
        func backtrack(_ path: [Character], _ input: [Character]) {
            if path.count >= digits.count {
                var string = ""
                for c in path {
                    string += String(c)
                }
                res.append(string)
                return
            }
            let index = path.count
            let digit = input[index]
            var path = path
            for c in map[digit]! {
                path.append(c)
                backtrack(path, input)
                path.remove(at: path.count - 1)
            }
        }

        var chars: [Character] = []
        for c in digits {
            chars.append(c)
        }
        backtrack([], chars)

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
    print(Solution().letterCombinations("23"))
    print(Solution().letterCombinations(""))
    print(Solution().letterCombinations("2"))
    print(Solution().letterCombinations("22"))
}