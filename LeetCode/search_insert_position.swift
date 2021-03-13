/*	FILEPATH = "./LeetCode/search_insert_position.swift"
 *	35. Search Insert Position
	Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

	Example 1:
	Input: nums = [1,3,5,6], target = 5
	Output: 2

	Example 2:
	Input: nums = [1,3,5,6], target = 2
	Output: 1

	Example 3:
	Input: nums = [1,3,5,6], target = 7
	Output: 4

	Example 4:
	Input: nums = [1,3,5,6], target = 0
	Output: 0

	Example 5:
	Input: nums = [1], target = 0
	Output: 0

	Constraints:
		1 <= nums.length <= 104
		-104 <= nums[i] <= 104
		nums contains distinct values sorted in ascending order.
		-104 <= target <= 104
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        for (i, num) in nums.enumerated().reversed() {
			if num == target {
				return i
			}
			if num < target {
				return i + 1
			}
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
    print(Solution().searchInsert([1,3,5,6], 5))
	print(Solution().searchInsert([1,3,5,6], 2))
	print(Solution().searchInsert([1,3,5,6], 7))
	print(Solution().searchInsert([1,3,5,6], 0))
	print(Solution().searchInsert([1], 0))
}