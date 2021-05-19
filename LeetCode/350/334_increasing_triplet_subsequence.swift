/*	FILEPATH = "./LeetCode/350/334_increasing_triplet_subsequence.swift"
 *	334. Increasing Triplet Subsequence
	Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.

	Example 1:
	Input: nums = [1,2,3,4,5]
	Output: true
	Explanation: Any triplet where i < j < k is valid.

	Example 2:
	Input: nums = [5,4,3,2,1]
	Output: false
	Explanation: No triplet exists.

	Example 3:
	Input: nums = [2,1,5,0,4,6]
	Output: true
	Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.

	Constraints:
		1 <= nums.length <= 105
		-231 <= nums[i] <= 231 - 1
	Follow up: Could you implement a solution that runs in O(n) time complexity and O(1) space complexity?
 */

//  dp0[i] 表示第 i 个数左边有比它小的数
//  dp1[i] 表示第 i 个数右边有比它大的数
class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var dp0: [Bool] = Array(repeating: false, count: nums.count)
        var dp1: [Bool] = Array(repeating: false, count: nums.count)
        var min = Int.max
        var max = Int.min
        var i = 0
        while i < nums.count {
            let lhs = nums[i]
            let rhs = nums[nums.count - 1 - i]
            dp0[i] = lhs > min
            dp1[nums.count - 1 - i] = rhs < max
            min = lhs < min ? lhs : min
            max = rhs > max ? rhs : max
            i += 1
        }
        for i in 0..<nums.count {
            if dp0[i] && dp1[i] {
                return true
            }
        }
        return false   
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
    print(Solution().increasingTriplet([1,2,3,4,5]))
    print(Solution().increasingTriplet([5,4,3,2,1]))
    print(Solution().increasingTriplet([2,1,5,0,4,6]))
}