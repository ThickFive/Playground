/*	FILEPATH = "./LeetCode/200/152_maximum_product_subarray.swift"
 *	152. Maximum Product Subarray
	Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.
	It is guaranteed that the answer will fit in a 32-bit integer.
	A subarray is a contiguous subsequence of the array.

	Example 1:
	Input: nums = [2,3,-2,4]
	Output: 6
	Explanation: [2,3] has the largest product 6.

	Example 2:
	Input: nums = [-2,0,-1]
	Output: 0
	Explanation: The result cannot be 2, because [-2,-1] is not a subarray.

	Constraints:
		1 <= nums.length <= 2 * 104
		-10 <= nums[i] <= 10
		The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 */

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var intervals: [[Int]] = []
        var start = 0
        var end = nums.count - 1
        for (i, num) in nums.enumerated() {
            if num == 0 {
                i > start ? intervals.append([start, i - 1]) : ()
                start = i
            }
        }
        intervals.append([start, end])
        var res = Int.min
        for interval in intervals {
            res = max(res, max_product(nums, interval[0], interval[1]))
        }
        return res
    }
    
    func max_product(_ nums: [Int], _ i: Int, _ j: Int) -> Int {
        if i > j {
            return Int.min
        } else if i == j {
            return nums[i]
        }
        if nums[i] == 0 {
            return max(0, max_product(nums, i + 1, j))
        }
        var negtive_indexs: [Int] = []
        for k in i...j {
            if nums[k] < 0 {
                negtive_indexs.append(k)
            }
        }
        let count = negtive_indexs.count
        if count % 2 == 0 {
            return product(nums, i, j)
        } else {
            return max(product(nums, i, negtive_indexs[count - 1] - 1), product(nums, negtive_indexs[0] + 1, j))
        }
    }
    
    func product(_ nums: [Int], _ i: Int, _ j: Int) -> Int {
        if i > j {
            return Int.min
        }
        var res = 1
        for k in i...j {
            res *= nums[k]
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