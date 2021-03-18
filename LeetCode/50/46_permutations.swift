/*	FILEPATH = "./LeetCode/50/46_permutations.swift"
 *	46. Permutations
	Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

	Example 1:
	Input: nums = [1,2,3]
	Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

	Example 2:
	Input: nums = [0,1]
	Output: [[0,1],[1,0]]

	Example 3:
	Input: nums = [1]
	Output: [[1]]

	Constraints:
		1 <= nums.length <= 6
		-10 <= nums[i] <= 10
		All the integers of nums are unique.
 */

class Solution {
	func permute(_ nums: [Int]) -> [[Int]] {
		//	1. 按顺序选出一个数放到开头
		//	2. 剩余的数组成新的数组, 重复步骤 1
		//	3. 合并结果
		var res: [[Int]] = []
		func _permute(_ list: [Int], _ rest: [Int]) -> Void {
            for (i, item) in rest.enumerated() {
				var _list = list
				var _rest = rest
				_list.append(item)
				_rest.remove(at: i)
				if (_list.count == nums.count) {
					res.append(_list)
				}
                _permute(_list, _rest)
			}
		}
		_permute([], nums)
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
    print(Solution().permute([1,2,3]))
	print(Solution().permute([0,1]))
	print(Solution().permute([0]))
}