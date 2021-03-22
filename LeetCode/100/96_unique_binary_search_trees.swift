/*	FILEPATH = "./LeetCode/100/96_unique_binary_search_trees.swift"
 *	96. Unique Binary Search Trees
	Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.

	Example 1:
	Input: n = 3
	Output: 5

	Example 2:
	Input: n = 1
	Output: 1

	Constraints:
		1 <= n <= 19
 */

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var map: [Int] = [1, 1]
        for i in 2...n {
            var tmp = 0
            for j in 0..<i {
                tmp += map[j] * map[i - j - 1]
            }
            map.append(tmp)
        }
        return map[n]
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
    print(Solution().numTrees(19))
}