/*	FILEPATH = "./LeetCode/50/47_permutations_ii.swift"
 *	47. Permutations II
	Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

	Example 1:
	Input: nums = [1,1,2]
	Output:
	[[1,1,2],
	 [1,2,1],
	 [2,1,1]]

	Example 2:
	Input: nums = [1,2,3]
	Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

	Constraints:
		1 <= nums.length <= 8
		-10 <= nums[i] <= 10
 */

class Solution {
	//	时间复杂度 O((n!)^2) 爆炸
	func _0_permuteUnique(_ nums: [Int]) -> [[Int]] {
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
		//	去重
		func isEqual(_ lh:[Int], _ rh: [Int]) -> Bool {
			for (i, item) in lh.enumerated() {
				if (item != rh[i]) {
					return false
				}
			}
			return true
		}
		func contains(_ array: [[Int]], _ item :[Int]) -> Bool {
			for _item in array {
				if (isEqual(_item, item)) {
					return true
				}
			}
			return false
		}
		var tmp = Array(res[0..<res.count-1])
		for (i, item) in res.enumerated().reversed() {
			if (i == 0) {
				break
			}
			if contains(tmp, item) {
				res.remove(at: i)
			}
			tmp = Array(res[0..<tmp.count-1])
		}
		return res
	}

 	func permuteUnique(_ nums: [Int]) -> [[Int]] {
		//	1. 先排序, 按顺序取出元素插入空数组 
		//	2. 后面的元素分别有 [0..<count] 种插入的位置
		//	3. 如果相邻的元素相等, 只保留一种插入结果
		//	3. 合并结果, 使用 Set 去重
		var res = Set<[Int]>()
		var _nums = nums
		_nums.sort(by: {$0 < $1})
		func _permute(_ list: [Int], _ rest: [Int]) -> Void {
			if rest.count == 0 {
				return
			}
			let item = rest[0]
            for i in 0...list.count {
				var _list = list
				var _rest = rest
				if (i == 0 || list[i-1] != item) { //	连续相同元素去重
					_list.insert(item, at: i)
					_rest.remove(at: 0)
					if (_list.count == nums.count) {
						res.insert(_list)
					}
					_permute(_list, _rest)
				}
			}
		}
		_permute([], _nums)
		return Array(res)
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
    print(Solution().permuteUnique([1,1,2]))
	print(Solution().permuteUnique([1,2,3]))
	print(Solution().permuteUnique([0]))
	print(Solution().permuteUnique([1,1]))
	print(Solution().permuteUnique([1,1,2,2]))
	print(Solution().permuteUnique([1,1,1,1,1,1]))
	print(Solution().permuteUnique([-1,2,-1,2,1,-1,2,1]))
}