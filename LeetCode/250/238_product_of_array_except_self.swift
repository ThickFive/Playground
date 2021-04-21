/*	FILEPATH = "./LeetCode/250/238_product_of_array_except_self.swift"
 *	238. Product of Array Except Self
	Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
	The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

	Example 1:
	Input: nums = [1,2,3,4]
	Output: [24,12,8,6]

	Example 2:
	Input: nums = [-1,1,0,-3,3]
	Output: [0,0,9,0,0]

	Constraints:
		2 <= nums.length <= 105
		-30 <= nums[i] <= 30
		The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
	Follow up:
		Could you solve it in O(n) time complexity and without using division?
		Could you solve it with O(1) constant space complexity? (The output array does not count as extra space for space complexity analysis.)
 */

//  T(n), S(1)
//  把所有非零的数相乘, 乘积除以当前的数
//  1. 0 的个数大于 1, 那么全是 0
//  2. 0 的个数等于 1, 那么除了 0 对应的结果是乘积以外, 其余全是 0
//  3. 0 的个数等于 0, 那么只需要用乘积除以当前的数即可
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var zero_count = 0
        var total = 1
        for num in nums {
            if num == 0 {
                zero_count += 1
            } else {
                total *= num
            } 
        }
        var res: [Int] = []
        for num in nums {
            var val = 0
            if zero_count == 1 {
                val = num == 0 ? total : 0
            } else if zero_count == 0 {
                val = total / num
            }
            res.append(val)
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
    print(Solution().productExceptSelf([1,2,3,4]))
    print(Solution().productExceptSelf([-1,1,0,-3,3]))
    print(Solution().productExceptSelf([-1,1,0,0,-3,3]))
}