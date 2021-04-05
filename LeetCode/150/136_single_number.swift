/*	FILEPATH = "./LeetCode/150/136_single_number.swift"
 *	136. Single Number
	Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
	Follow up: Could you implement a solution with a linear runtime complexity and without using extra memory?

	Example 1:
	Input: nums = [2,2,1]
	Output: 1

	Example 2:
	Input: nums = [4,1,2,1,2]
	Output: 4

	Example 3:
	Input: nums = [1]
	Output: 1

	Constraints:
		1 <= nums.length <= 3 * 104
		-3 * 104 <= nums[i] <= 3 * 104
		Each element in the array appears twice except for one element which appears only once.
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res ^= num
        }
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
    
}