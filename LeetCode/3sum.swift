/*	FILEPATH = "./LeetCode/3sum.swift"
 *	15. 3Sum
	Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
	Notice that the solution set must not contain duplicate triplets.

	Example 1:
	Input: nums = [-1,0,1,2,-1,-4]
	Output: [[-1,-1,2],[-1,0,1]]

	Example 2:
	Input: nums = []
	Output: []

	Example 3:
	Input: nums = [0]
	Output: []

	Constraints:
		0 <= nums.length <= 3000
		-105 <= nums[i] <= 105
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        if nums.count < 3 {
            return []
        }
        let sorted = nums.sorted()
        var i: Int = 0
        while i < sorted.count - 2 {
            if i > 0, sorted[i] == sorted[i - 1] {
                i += 1
                continue
            }
            var j = i + 1
            var k = sorted.count - 1
            while j < k {
                let target = sorted[i] + sorted[j] + sorted[k]
                if (target == 0) {
                    if j - 1 > i, sorted[j] == sorted[j - 1] {
                        j += 1
                        continue
                    } 
                    res.append([sorted[i], sorted[j], sorted[k]])
                    j += 1
                } else if (target < 0) {
                    j += 1
                } else {
                    k -= 1
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
    print(Solution().threeSum([-2,-2,-1,-1,0,1,1,2,2]))
    print(Solution().threeSum([0,0,0,0,0,0,0]))
	print(Solution().threeSum([]))
}