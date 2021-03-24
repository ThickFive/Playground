/*	FILEPATH = "./LeetCode/100/78_subsets.swift"
 *	78. Subsets
	Given an integer array nums of unique elements, return all possible subsets (the power set).
	The solution set must not contain duplicate subsets. Return the solution in any order.

	Example 1:
	Input: nums = [1,2,3]
	Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

	Example 2:
	Input: nums = [0]
	Output: [[],[0]]

	Constraints:
		1 <= nums.length <= 10
		-10 <= nums[i] <= 10
		All the numbers of nums are unique.
 */

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        //  path 表示数字索引, target 表示数字个数
        func backtrack(_ path: [Int], _ max: Int, _ target: Int) {
            if target == 0 {
                res.append([])
                return
            }
            if path.count == target {
                res.append(path.map({nums[$0]}))
                return
            }
            var path = path
            for index in max+1..<nums.count {
                path.append(index)
                backtrack(path, index, target)
                path.remove(at: path.count - 1)
            }
        }
        for i in 0...nums.count {
            backtrack([], -1, i)
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
    print(Solution().subsets([1,2,3]))
    print(Solution().subsets([0]))
    print(Solution().subsets([1,2,3,4]))
}