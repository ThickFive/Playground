/*	FILEPATH = "./LeetCode/300/260_single_number_iii.swift"
 *	260. Single Number III
	Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order.
	You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.

	Example 1:
	Input: nums = [1,2,1,3,2,5]
	Output: [3,5]
	Explanation:  [5, 3] is also a valid answer.

	Example 2:
	Input: nums = [-1,0]
	Output: [-1,0]

	Example 3:
	Input: nums = [0,1]
	Output: [1,0]

	Constraints:
		2 <= nums.length <= 3 * 10^4
		-2^31 <= nums[i] <= 2^31 - 1
		Each integer in nums will appear twice, only two integers will appear once.
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var mask = 0
        for num in nums {
            mask ^= num
        }
        mask &= -mask
        var a = 0, b = 0
        for num in nums {
            if num & mask == 0 {
                a ^= num
            } else {
                b ^= num
            }
        }
        return [a, b]
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
    print(Solution().singleNumber([1,2,1,3,2,5]))
    print(Solution().singleNumber([-1,0]))
    print(Solution().singleNumber([0,1]))
}