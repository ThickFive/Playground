/*	FILEPATH = "./LeetCode/300/283_move_zeroes.swift"
 *	283. Move Zeroes
	Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
	Note that you must do this in-place without making a copy of the array.

	Example 1:
	Input: nums = [0,1,0,3,12]
	Output: [1,3,12,0,0]

	Example 2:
	Input: nums = [0]
	Output: [0]

	Constraints:
		1 <= nums.length <= 104
		-231 <= nums[i] <= 231 - 1
	Follow up: Could you minimize the total number of operations done?
 */

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var count_zero = 0
        for (i, num) in nums.enumerated() {
            if num == 0 {
                count_zero += 1
            } else {
                nums[i - count_zero] = num
            }
        }
        for i in 0..<count_zero {
           nums[nums.count - 1 - i] = 0 
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
    
}