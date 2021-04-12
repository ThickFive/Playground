/*	FILEPATH = "./LeetCode/200/189_rotate_array.swift"
 *	189. Rotate Array
	Given an array, rotate the array to the right by k steps, where k is non-negative.

	Example 1:
	Input: nums = [1,2,3,4,5,6,7], k = 3
	Output: [5,6,7,1,2,3,4]
	Explanation:
	rotate 1 steps to the right: [7,1,2,3,4,5,6]
	rotate 2 steps to the right: [6,7,1,2,3,4,5]
	rotate 3 steps to the right: [5,6,7,1,2,3,4]

	Example 2:
	Input: nums = [-1,-100,3,99], k = 2
	Output: [3,99,-1,-100]
	Explanation: 
	rotate 1 steps to the right: [99,-1,-100,3]
	rotate 2 steps to the right: [3,99,-1,-100]

	Constraints:
		1 <= nums.length <= 10^5
		-2^31 <= nums[i] <= 2^31 - 1
		0 <= k <= 10^5
	Follow up:
		Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
		Could you do it in-place with O(1) extra space?
 */

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let step = k % nums.count
        for (i, num) in nums.enumerated() {
            let index = (i + step) % nums.count
            nums[index] = num
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
    var nums: [Int]
    var k: Int
    nums = [1,2,3,4,5,6,7]
    k = 3
    Solution().rotate(&nums, k)
    print(nums)
    nums = [-1,-100,3,99]
    k = 2
    Solution().rotate(&nums, k)
    print(nums)
}