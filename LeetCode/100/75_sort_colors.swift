/*	FILEPATH = "./LeetCode/100/75_sort_colors.swift"
 *	75. Sort Colors
	Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
	We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

	Example 1:
	Input: nums = [2,0,2,1,1,0]
	Output: [0,0,1,1,2,2]

	Example 2:
	Input: nums = [2,0,1]
	Output: [0,1,2]

	Example 3:
	Input: nums = [0]
	Output: [0]

	Example 4:
	Input: nums = [1]
	Output: [1]

	Constraints:
		n == nums.length
		1 <= n <= 300
		nums[i] is 0, 1, or 2.
	Follow up:
		Could you solve this problem without using the library's sort function?
		Could you come up with a one-pass algorithm using only O(1) constant space?
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var count = [0, 0, 0]
        for (i, num) in nums.enumerated() {
            if i > 0 {
                if num == 0 {   //  0 1 2 相互交换 index_1 = count_0, index_2 = count_0 + count_1
                    if count[1] > 0 && count[2] > 0 {
                        let index_1 = count[0]
                        let index_2 = count[0] + count[1] 
                        nums[i] = 2
                        nums[index_1] = 0
                        nums[index_2] = 1
                    } else if count[1] > 0 {
                        let index_1 = count[0]
                        nums[i] = 1
                        nums[index_1] = 0
                    } else if count[2] > 0 {
                        let index_2 = count[0] + count[1] 
                        nums[i] = 2
                        nums[index_2] = 0
                    }
                }
                if num == 1 {   //  1 2 交换 index_2 = count_0 + count_1
                    if count[2] > 0 {
                        let index_2 = count[0] + count[1] 
                        nums[i] = 2
                        nums[index_2] = 1
                    }
                }
            }
            count[num] += 1
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
    var nums = [2,0,2,1,1,0]
    Solution().sortColors(&nums)
    print(nums)
    nums = [2,0,1]
    Solution().sortColors(&nums)
    print(nums)
    nums = [0]
    Solution().sortColors(&nums)
    print(nums)
    nums = [1]
    Solution().sortColors(&nums)
    print(nums)
}