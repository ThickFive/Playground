/*	FILEPATH = "./LeetCode/50/40_combination_sum_ii.swift"
 *	40. Combination Sum II
	Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.
	Each number in candidates may only be used once in the combination.
	Note: The solution set must not contain duplicate combinations.

	Example 1:
	Input: candidates = [10,1,2,7,6,1,5], target = 8
	Output: 
	[
	[1,1,6],
	[1,2,5],
	[1,7],
	[2,6]
	]

	Example 2:
	Input: candidates = [2,5,2,1,2], target = 5
	Output: 
	[
	[1,2,2],
	[5]
	]

	Constraints:
		1 <= candidates.length <= 100
		1 <= candidates[i] <= 50
		1 <= target <= 30
 */

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        var res: [[Int]] = []
        func backtrack(_ path: [Int], _ input: [Int], _ target: Int, _ index: Int) {
            var path = path
            var last: Int?
            for (i, num) in input.enumerated() {
                if let last = last, last == num {
                    continue
                }
                if i <= index {
                    continue
                }
                if num == target {
                    res.append(path + [num])
                    break
                }
                if num > target {
                    break
                }
                if num < target {
                    path.append(num)
                    backtrack(path, input, target - num, i)
                    path.remove(at: path.count - 1)
                }
                last = num
            }
        }
        backtrack([], sorted, target, -1)
        return res
    }
    
    func _combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        if sorted[0] > target {
            return []
        }
        func combination_sum(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var res = Set<[Int]>()
            for (i, num) in candidates.enumerated() {
                if target - num < 0 {
                    break
                } else if target == num {
                    res.insert([num])
                } else {
                    if i < candidates.count - 1 {
                        let array_list = combination_sum(Array(candidates[i+1..<candidates.count]), target - num)
                        for var array in array_list {
                            array.append(num)
                            res.insert(array.sorted())
                        }
                    }
                }
            }
            return Array(res)
        }
        return combination_sum(sorted, target)
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
    print(Solution().combinationSum2([10,1,2,7,6,1,5], 8))
    print(Solution().combinationSum2([2,5,2,1,2], 5))
    print(Solution().combinationSum2([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], 20))
}