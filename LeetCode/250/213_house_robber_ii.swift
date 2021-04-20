/*	FILEPATH = "./LeetCode/250/213_house_robber_ii.swift"
 *	213. House Robber II
	You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.
	Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

	Example 1:
	Input: nums = [2,3,2]
	Output: 3
	Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.

	Example 2:
	Input: nums = [1,2,3,1]
	Output: 4
	Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
	Total amount you can rob = 1 + 3 = 4.

	Example 3:
	Input: nums = [0]
	Output: 0

	Constraints:
		1 <= nums.length <= 100
		0 <= nums[i] <= 1000
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        func _rob(_ nums: [Int]) -> Int {
            var dp: [Int] = Array(repeating: 0, count: nums.count + 2)
            for i in 0..<nums.count {
                let num = nums[i]
                dp[i + 2] = max(dp[i + 1], num + dp[i])
            }
            return dp[nums.count + 1]
        }
        //  rob 0
        let a =  nums[0] + (nums.count > 3 ? _rob(Array(nums[2..<nums.count - 1])) : 0)
        //  not rob 0
        let b = _rob(Array(nums[1..<nums.count]))
        return max(a, b)
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
    print(Solution().rob([2,3,2]))
    print(Solution().rob([1,2,3,1]))
    print(Solution().rob([0]))
}