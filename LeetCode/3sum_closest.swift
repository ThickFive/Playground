/*	FILEPATH = "./LeetCode/3sum_closest.swift"
 *	16. 3Sum Closest
	Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

	Example 1:
	Input: nums = [-1,2,1,-4], target = 1
	Output: 2
	Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

	Constraints:
		3 <= nums.length <= 10^3
		-10^3 <= nums[i] <= 10^3
		-10^4 <= target <= 10^4
 */

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sorted = nums.sorted()
        var i: Int = 0
        var min: Int = Int.max
        var res: Int = Int.max
        while i < sorted.count - 2 {
            var j = i + 1
            var k = sorted.count - 1
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if sum == target {
                    return target
                }
                if sum < target {
                    j += 1
                } else {
                    k -= 1
                }
                let diff = abs(sum - target)
                if diff < min {
                    min = diff
                    res = sum
                }
            }
            i += 1
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
    print(Solution().threeSumClosest([-1,2,1,-4], 1))
}