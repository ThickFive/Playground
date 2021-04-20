/*	FILEPATH = "./LeetCode/250/209_minimum_size_subarray_sum.swift"
 *	209. Minimum Size Subarray Sum
	Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.

	Example 1:
	Input: target = 7, nums = [2,3,1,2,4,3]
	Output: 2
	Explanation: The subarray [4,3] has the minimal length under the problem constraint.

	Example 2:
	Input: target = 4, nums = [1,4,4]
	Output: 1

	Example 3:
	Input: target = 11, nums = [1,1,1,1,1,1,1,1]
	Output: 0

	Constraints:
		1 <= target <= 10^9
		1 <= nums.length <= 10^5
		1 <= nums[i] <= 10^5
	Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
 */

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var min_len = Int.max
        var dp: [(Int, Int)] = Array(repeating: (0, 0), count: nums.count + 1)
        for i in 1...nums.count {
            let num = nums[i - 1]
            var sum = dp[i - 1].0 + num
            if sum <= target {
                dp[i] = (sum, dp[i - 1].1 + 1)
            } else {
                var j = i - 1 - dp[i - 1].1
                while sum - nums[j] >= target && j < i {
                    sum -= nums[j]
                    j += 1
                }
                dp[i] = (sum, i - j)
            }
            if dp[i].0 >= target {
                min_len = min(dp[i].1, min_len)
            }
        }
        return min_len == Int.max ? 0 : min_len
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
    print(Solution().minSubArrayLen(7, [2,3,1,2,4,3]))
    print(Solution().minSubArrayLen(4, [1,4,4]))
    print(Solution().minSubArrayLen(11, [1,2,3,4,5]))
    print(Solution().minSubArrayLen(4, [4]))
    print(Solution().minSubArrayLen(4, [5,5,5]))
    print(Solution().minSubArrayLen(4, [1,1,1]))
    print(Solution().minSubArrayLen(4, [1,1,1,1]))
    print(Solution().minSubArrayLen(4, [1,1,1,1,1]))
}