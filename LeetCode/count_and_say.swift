/*	FILEPATH = "./LeetCode/count_and_say.swift"
 *	38. Count and Say
	The count-and-say sequence is a sequence of digit strings defined by the recursive formula:
		countAndSay(1) = "1"
		countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1), which is then converted into a different digit string.
	To determine how you "say" a digit string, split it into the minimal number of groups so that each group is a contiguous section all of the same character. Then for each group, say the number of characters, then say the character. To convert the saying into a digit string, replace the counts with a number and concatenate every saying.
	For example, the saying and conversion for digit string "3322251":
	Given a positive integer n, return the nth term of the count-and-say sequence.

	Example 1:
	Input: n = 1
	Output: "1"
	Explanation: This is the base case.

	Example 2:
	Input: n = 4
	Output: "1211"
	Explanation:
	countAndSay(1) = "1"
	countAndSay(2) = say "1" = one 1 = "11"
	countAndSay(3) = say "11" = two 1's = "21"
	countAndSay(4) = say "21" = one 2 + one 1 = "12" + "11" = "1211"

	Constraints:
		1 <= n <= 30
 */

class Solution {
    func countAndSay(_ n: Int) -> String {
        func count_and_say(_ s: String, _ n: Int) -> String {
            if n <= 1 {
                return s
            }
            var string = ""
            var prev: Character?
            var count: Int = 1
            for c in s {
                if let prev = prev {
                    if c == prev {
                        count += 1
                    } else {
                        string += "\(count)\(prev)"
                        count = 1
                    }
                }
                prev = c
            }
            string += "\(count)\(prev!)"
            return count_and_say(string, n - 1)
        }
        return count_and_say("1", n)
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
    print(Solution().countAndSay(1))
    print(Solution().countAndSay(2))
    print(Solution().countAndSay(3))
    print(Solution().countAndSay(4))
    print(Solution().countAndSay(5))
    print(Solution().countAndSay(6))
    print(Solution().countAndSay(7))
    print(Solution().countAndSay(8))
    print(Solution().countAndSay(9))
    print(Solution().countAndSay(10))
}