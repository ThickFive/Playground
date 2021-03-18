/*	FILEPATH = "./LeetCode/50/33_search_in_rotated_sorted_array.swift"
 *	33. Search in Rotated Sorted Array
	There is an integer array nums sorted in ascending order (with distinct values).
	Prior to being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
	Given the array nums after the rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

	Example 1:
	Input: nums = [4,5,6,7,0,1,2], target = 0
	Output: 4

	Example 2:
	Input: nums = [4,5,6,7,0,1,2], target = 3
	Output: -1

	Example 3:
	Input: nums = [1], target = 0
	Output: -1

	Constraints:
		1 <= nums.length <= 5000
		-104 <= nums[i] <= 104
		All values of nums are unique.
		nums is guaranteed to be rotated at some pivot.
		-104 <= target <= 104
	Follow up: Can you achieve this in O(log n) time complexity?
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        for (i, num) in nums.enumerated() {
            if num == target {
                return i
            }
        }
        return -1
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
    print(Solution().search([4,5,6,7,0,1,2], 0))
	print(Solution().search([4,5,6,7,0,1,2], 3))
	print(Solution().search([1], 0))
}