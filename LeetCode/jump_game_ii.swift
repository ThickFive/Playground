/*	FILEPATH = "./LeetCode/jump_game_ii.swift"
 *	45. Jump Game II
	Given an array of non-negative integers nums, you are initially positioned at the first index of the array.
	Each element in the array represents your maximum jump length at that position.
	Your goal is to reach the last index in the minimum number of jumps.
	You can assume that you can always reach the last index.

	Example 1:
	Input: nums = [2,3,1,1,4]
	Output: 2
	Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.

	Example 2:
	Input: nums = [2,3,0,1,4]
	Output: 2

	Constraints:
		1 <= nums.length <= 1000
		0 <= nums[i] <= 105
 */

class Solution {
    func jump(_ nums: [Int]) -> Int {
		if nums.count <= 1 {
			return 0
		}
		//	动态规划, 计算走 n 步能跳到的最远位置
		//	例子: [1,2,3], 0 步能到第 1 个, 1 步能到第 2 个, 3 步能到第六个(如果存在)
		//	max_index = [1,2,6]
		var max_index: [Int] = [1]
		for i in 0..<nums.count {
			var max = 0
			for j in 0..<max_index[i] {
				if (j >= nums.count) {
					break
				}
				let index = j + nums[j] + 1
				max = max > index ? max : index
				if max >= nums.count {
					return i + 1
				}
			}
			max_index.append(max)
		}
        return 0
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
    print(Solution().jump([2,3,1,1,4]))
	print(Solution().jump([2,3,0,1,4]))
	print(Solution().jump([3,5,0,4,0,0,1,3,0,0,2]))
	print(Solution().jump([1,2,3]))
	print(Solution().jump([1,1,1,1]))
	print(Solution().jump([]))
	print(Solution().jump([1]))
}