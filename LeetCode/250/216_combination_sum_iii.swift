/*	FILEPATH = "./LeetCode/250/216_combination_sum_iii.swift"
 *	216. Combination Sum III
	Find all valid combinations of k numbers that sum up to n such that the following conditions are true:
		Only numbers 1 through 9 are used.
		Each number is used at most once.
	Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

	Example 1:
	Input: k = 3, n = 7
	Output: [[1,2,4]]
	Explanation:
	1 + 2 + 4 = 7
	There are no other valid combinations.

	Example 2:
	Input: k = 3, n = 9
	Output: [[1,2,6],[1,3,5],[2,3,4]]
	Explanation:
	1 + 2 + 6 = 9
	1 + 3 + 5 = 9
	2 + 3 + 4 = 9
	There are no other valid combinations.

	Example 3:
	Input: k = 4, n = 1
	Output: []
	Explanation: There are no valid combinations. [1,2,1] is not valid because 1 is used twice.

	Example 4:
	Input: k = 3, n = 2
	Output: []
	Explanation: There are no valid combinations.

	Example 5:
	Input: k = 9, n = 45
	Output: [[1,2,3,4,5,6,7,8,9]]
	Explanation:
	1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45
	​​​​​​​There are no other valid combinations.

	Constraints:
		2 <= k <= 9
		1 <= n <= 60
 */

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        if n < 3 || n > 45 {
            return []
        }
        var res: [[Int]] = []
        func backtrack(_ path: [Int], _ target: Int) {
            if path.count == k && target == 0 {
                res.append(path)
                return
            } else if target < 0 {
                return
            }
            var path = path
            for i in 1...9 {
                if path.count > 0 && path[path.count - 1] >= i {
                    continue
                }
                path.append(i)
                backtrack(path, target - i)
                path.remove(at: path.count - 1)
            }
        }
        backtrack([], n)
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
    print(Solution().combinationSum3(3, 7))
    print(Solution().combinationSum3(3, 9))
    print(Solution().combinationSum3(4, 1))
    print(Solution().combinationSum3(3, 2))
    print(Solution().combinationSum3(9, 45))
}