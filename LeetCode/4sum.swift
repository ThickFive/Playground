/*	FILEPATH = "./LeetCode/4sum.swift"
 *	18. 4Sum
	Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
	Notice that the solution set must not contain duplicate quadruplets.

	Example 1:
	Input: nums = [1,0,-1,0,-2,2], target = 0
	Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

	Example 2:
	Input: nums = [], target = 0
	Output: []

	Constraints:
		0 <= nums.length <= 200
		-109 <= nums[i] <= 109
		-109 <= target <= 109
 */

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorted = nums.sorted()
        var res: [[Int]] = []
        var i: Int = 0
        while i < sorted.count - 3 {
            if i > 0, sorted[i] == sorted[i - 1] {
                i += 1
                continue
            }
            var j = i + 1
            while j < sorted.count - 2 {
                if j - 1 > i, sorted[j] == sorted[j - 1] {
                    j += 1
                    continue
                }
                var k = j + 1
                var l = sorted.count - 1
                while k < l {
                    let sum = sorted[i] + sorted[j] + sorted[k] + sorted[l]
                    if sum == target {
                        if k - 1 > j, sorted[k] == sorted[k - 1] {
                            k += 1
                            continue
                        }
                        res.append([sorted[i], sorted[j], sorted[k], sorted[l]])
                        k += 1
                    }
                    if sum < target {
                        k += 1
                    } else {
                        l -= 1
                    }
                }
                j += 1
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
    print(Solution().fourSum([1,0,-1,0,-2,2], 0))
    print(Solution().fourSum([0,0,0,0,0,0], 0))
}