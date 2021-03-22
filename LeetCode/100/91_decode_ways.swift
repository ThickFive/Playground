/*	FILEPATH = "./LeetCode/100/91_decode_ways.swift"
 *	91. Decode Ways
	A message containing letters from A-Z can be encoded into numbers using the following mapping:
	'A' -> "1"
	'B' -> "2"
	...
	'Z' -> "26"
	To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, "11106" can be mapped into:
		"AAJF" with the grouping (1 1 10 6)
		"KJF" with the grouping (11 10 6)
	Note that the grouping (1 11 06) is invalid because "06" cannot be mapped into 'F' since "6" is different from "06".
	Given a string s containing only digits, return the number of ways to decode it.
	The answer is guaranteed to fit in a 32-bit integer.

	Example 1:
	Input: s = "12"
	Output: 2
	Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).

	Example 2:
	Input: s = "226"
	Output: 3
	Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).

	Example 3:
	Input: s = "0"
	Output: 0
	Explanation: There is no character that is mapped to a number starting with 0.
	The only valid mappings with 0 are 'J' -> "10" and 'T' -> "20", neither of which start with 0.
	Hence, there are no valid ways to decode this since all digits need to be mapped.

	Example 4:
	Input: s = "06"
	Output: 0
	Explanation: "06" cannot be mapped to "F" because of the leading zero ("6" is different from "06").

	Constraints:
		1 <= s.length <= 100
		s contains only digits and may contain leading zero(s).
 */

class Solution {
    //  动态规划
    func numDecodings(_ s: String) -> Int {
        let chs = chars(s)
        if chs.count == 0 || chs[0] == "0" {
            return 0
        }
        var res: [Int] = [1]
        for i in 1...chs.count {
            if i == 1 {
                res.append(1)
                continue
            }
            var count = 0
            if let _ = map["\(chs[i - 1])"] {
                count += res[i - 1]
            }  
            if let _ = map["\(chs[i - 2])\(chs[i - 1])"] {
                count += res[i - 2]
            }
            res.append(count)
        }
        return res[chs.count]
    }

    //  回溯算法超时
    func _numDecodings(_ s: String) -> Int {
        let chs = chars(s)
        var count = 0
        func backtrack(_ path: [Int], _ length: Int) {
            if length == chs.count {
                count += 1
                return
            }
            var path = path
            for i in 1...2 {
                if i + length > chs.count {
                    continue
                }
                var key = ""
                if i == 1 {
                    key = "\(chs[length + i - 1])"
                } else {
                    key = "\(chs[length + i - 2])\(chs[length + i - 1])"
                }
                if let _ = map[key] {
                    path.append(i)
                    backtrack(path, length + i)
                    path.remove(at: path.count - 1)
                }
            }
        }
        backtrack([], 0)
        return count
    }

    func chars(_ s: String) -> [Character] {
        var chs: [Character] = []
        for c in s {
            chs.append(c)
        }
        return chs
    }

    let map: [String: Character] = [
        "1": "a",
        "2": "b",
        "3": "c",
        "4": "d",
        "5": "e",
        "6": "f",
        "7": "g",
        "8": "h",
        "9": "i",
        "10": "j",
        "11": "k",
        "12": "l",
        "13": "m",
        "14": "n",
        "15": "o",
        "16": "p",
        "17": "q",
        "18": "r",
        "19": "s",
        "20": "t",
        "21": "u",
        "22": "v",
        "23": "w",
        "24": "x",
        "25": "y",
        "26": "z"
    ]
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
    print(Solution().numDecodings("12"))
    print(Solution().numDecodings("226"))
    print(Solution().numDecodings("0"))
    print(Solution().numDecodings("111111111111111111111111111111111111111111111"))
}