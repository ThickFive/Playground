/*	FILEPATH = "./LeetCode/50/1_two_sum.swift"
 *	1. Two Sum
	Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
	You may assume that each input would have exactly one solution, and you may not use the same element twice.
	You can return the answer in any order.

	Example 1:
	Input: nums = [2,7,11,15], target = 9
	Output: [0,1]
	Output: Because nums[0] + nums[1] == 9, we return [0, 1].

	Example 2:
	Input: nums = [3,2,4], target = 6
	Output: [1,2]

	Example 3:
	Input: nums = [3,3], target = 6
	Output: [0,1]

	Constraints:
		2 <= nums.length <= 103
		-109 <= nums[i] <= 109
		-109 <= target <= 109
		Only one valid answer exists.
 */

class Solution {
	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		var map: [Int: Int] = [:]
		for (i, num) in nums.enumerated() {
			if let j = map[target - num], i != j {
				return [i, j]
			} 
			map[num] = i
		}
		return []
	}
	//	HashTable O(n)
	func _1_twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		var hash_table: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            hash_table[num] = i
        }
		for (i, num) in nums.enumerated() {
            if let j = hash_table[target - num], i != j {
				return [i, j]
			}
        }
        return []
    }

	//	双重循环 O(n^2)
    func _0_twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if i == j {
                    continue
                }
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
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
    print(Solution().twoSum([2,7,11,15], 9))
    print(Solution().twoSum([3,2,4], 6))
	print(Solution().twoSum([3,3], 6))
}