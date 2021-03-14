/*	FILEPATH = "./LeetCode/generate_parentheses.swift"
 *	22. Generate Parentheses
	Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

	Example 1:
	Input: n = 3
	Output: ["((()))","(()())","(())()","()(())","()()()"]

	Example 2:
	Input: n = 1
	Output: ["()"]

	Constraints:
		1 <= n <= 8
 */

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []
        func track(_ path: [String], _ target: Int) {
            var path = path
            if path.count == n * 2 {
                var string = ""
                for s in path {
                    string += s
                }
                res.append(string)
                return
            }
            var count = 0
            for c in path {
                if c == "(" {
                    count += 1
                }
            }
            for c in ["(", ")"] {
                //  如果 ( 达到上限, 或者 ) 达到上限
                if (c == "(" && count >= n) || (c == ")" && path.count - count >= count)  {
                    continue
                }
                path.append(c)
                track(path, target - 1)
                path.remove(at: path.count - 1)
            }
        }
        track([], n * 2)
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
    print(Solution().generateParenthesis(8))
    print(Solution().generateParenthesis(3))
    print(Solution().generateParenthesis(1))
}