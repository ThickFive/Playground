/*	FILEPATH = "./LeetCode/100/53_maximum_subarray.swift"
 *	53. Maximum Subarray
	Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

	Example 1:
	Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
	Output: 6
	Explanation: [4,-1,2,1] has the largest sum = 6.

	Example 2:
	Input: nums = [1]
	Output: 1

	Example 3:
	Input: nums = [5,4,-1,7,8]
	Output: 23

	Constraints:
		1 <= nums.length <= 3 * 104
		-105 <= nums[i] <= 105
	Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var max = nums[0]
        var sum = 0
        var i = 0
        while i < nums.count {
            let num = nums[i]
            sum += num
            if sum > 0 {
                max = max > sum ? max : sum
            } else {
                max = max > num ? max : num
                sum = 0
            }
            i += 1
        }
        return max
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
    print(Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
    print(Solution().maxSubArray([-2,-1]))
    print(Solution().maxSubArray([5,4,-1,7,8]))
}