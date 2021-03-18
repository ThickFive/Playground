/*	FILEPATH = "./LeetCode/combination_sum.swift"
 *	39. Combination Sum
	Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
	The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
	It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

	Example 1:
	Input: candidates = [2,3,6,7], target = 7
	Output: [[2,2,3],[7]]
	Explanation:
	2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
	7 is a candidate, and 7 = 7.
	These are the only two combinations.

	Example 2:
	Input: candidates = [2,3,5], target = 8
	Output: [[2,2,2,2],[2,3,3],[3,5]]

	Example 3:
	Input: candidates = [2], target = 1
	Output: []

	Example 4:
	Input: candidates = [1], target = 1
	Output: [[1]]

	Example 5:
	Input: candidates = [1], target = 2
	Output: [[1,1]]

	Constraints:
		1 <= candidates.length <= 30
		1 <= candidates[i] <= 200
		All elements of candidates are distinct.
		1 <= target <= 500
 */

class Solution {
    //  回溯算法
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        var res: [[Int]] = []
        func backtrack(_ path: [Int], _ input: [Int], _ target: Int) {
            var path = path
            for num in input {
                if path.count > 0 && num < path[path.count-1] {
                    continue
                }
                if num < target {
                    path.append(num)
                    backtrack(path, input, target - num)
                    path.remove(at: path.count - 1)
                }
                if num == target  {
                    res.append(path + [num])
                    break
                }
                if num > target  {
                    break
                }
            }
        }
        backtrack([], sorted, target)
        return res
    }

    //  一般递归法, Set去重
    func _combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        if sorted[0] > target {
            return []
        }
        func combination_sum(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var res = Set<[Int]>()
            for (_, num) in candidates.enumerated() {
                if target < num {
                    break
                } else if target == num {
                    res.insert([num])
                    break
                } else {
                    let array_list = combination_sum(candidates, target - num)
                    for var array in array_list {
                        array.append(num)
                        res.insert(array.sorted())
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
    print(Solution().combinationSum([2,3,6,7], 7))
    print(Solution().combinationSum([2,3,5], 8))
    print(Solution().combinationSum([2], 1))
    print(Solution().combinationSum([1], 1))
    print(Solution().combinationSum([1], 2))
    // _ = Solution().combinationSum([1,2,3,4,5,6,7,8,9,10,11,12], 20))
    // _ = Solution().combinationSum([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], 50)
}