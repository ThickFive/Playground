/*	FILEPATH = "./LeetCode/50/34_find_first_and_last_position_of_element_in_sorted_array.swift"
 *	34. Find First and Last Position of Element in Sorted Array
	Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
	If target is not found in the array, return [-1, -1].
	Follow up: Could you write an algorithm with O(log n) runtime complexity?

	Example 1:
	Input: nums = [5,7,7,8,8,10], target = 8
	Output: [3,4]

	Example 2:
	Input: nums = [5,7,7,8,8,10], target = 6
	Output: [-1,-1]

	Example 3:
	Input: nums = [], target = 0
	Output: [-1,-1]

	Constraints:
		0 <= nums.length <= 10^5
		-10^9 <= nums[i] <= 10^9
		nums is a non-decreasing array.
		-10^9 <= target <= 10^9
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var index = -1
        var lower = 0
        var upper = nums.count - 1
        var mid = (lower + upper) / 2
        while upper >= lower {
            if nums[mid] == target {
                index = mid
                break
            }
            if mid == lower {
                if nums[upper] == target {
                    index = upper
                }
                break
            }
            if nums[mid] > target {
                upper = mid
            } else {
                lower = mid
            }
            mid = (lower + upper) / 2
        }
        
        if index == -1 {
            return [-1, -1]
        } else {
            var i = index
            var j = index
            while i > 0 {
                if nums[i] == nums[i-1] {
                    i -= 1
                } else {
                    break
                }
                
            }
            while j < nums.count - 1 {
                if nums[j] == nums[j+1] {
                    j += 1
                } else {
                    break
                }
            }
            return [i, j]
        }
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
    print(Solution().searchRange([5,7,7,8,8,10], 8))
    print(Solution().searchRange([5,7,7,8,8,10], 6))
    print(Solution().searchRange([1], 1))
}