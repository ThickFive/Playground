/*	FILEPATH = "./LeetCode/200/198_house_robber.swift"
 *	198. House Robber
	You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
	Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

	Example 1:
	Input: nums = [1,2,3,1]
	Output: 4
	Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
	Total amount you can rob = 1 + 3 = 4.

	Example 2:
	Input: nums = [2,7,9,3,1]
	Output: 12
	Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
	Total amount you can rob = 2 + 9 + 1 = 12.

	Constraints:
		1 <= nums.length <= 100
		0 <= nums[i] <= 400
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            let dp1 = i > 0 ? dp[i - 1] : 0
            let dp2 = i > 1 ? dp[i - 2] : 0
            dp[i] = max(dp1, dp2 + nums[i])
        }
        return dp[nums.count - 1]
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
    print(Solution().rob([1,2,3,1]))
    print(Solution().rob([2,7,9,3,1]))
}