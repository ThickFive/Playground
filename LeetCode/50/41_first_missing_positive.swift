/*	FILEPATH = "./LeetCode/50/41_first_missing_positive.swift"
 *	41. First Missing Positive
	Given an unsorted integer array nums, find the smallest missing positive integer.

	Example 1:
	Input: nums = [1,2,0]
	Output: 3

	Example 2:
	Input: nums = [3,4,-1,1]
	Output: 2

	Example 3:
	Input: nums = [7,8,9,11,12]
	Output: 1

	Constraints:
		0 <= nums.length <= 300
		-2^31 <= nums[i] <= 2^31 - 1
	Follow up: Could you implement an algorithm that runs in O(n) time and uses constant extra space?
 */

class Solution {
    //  1.  nums 全部修改为正数, 保留符合条件的数, 0 < num <= num.count, 其他的改为 num.count + 1 或者更大
    //  2.  前 1..<n 连续, 将 nums 数组前 n 个元素改为负数 nums[abs(num)] = - nums[abs(num)]
    //  3.  计算负数的个数即可
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var map: [Int: Bool] = [:]
        for num in nums {
            if num <= 0 {
                continue
            }
            map[num] = true
        }
        var i = 1
        while true {
            if let _ = map[i] {
                i += 1
                continue
            } else {
                return i
            }
        }
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
    print(Solution().firstMissingPositive([1,2,0]))
    print(Solution().firstMissingPositive([3,4,-1,1]))
    print(Solution().firstMissingPositive([7,8,9,11,12]))
}