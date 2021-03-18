/*	FILEPATH = "./LeetCode/100/55_jump_game.swift"
 *	55. Jump Game
	Given an array of non-negative integers nums, you are initially positioned at the first index of the array.
	Each element in the array represents your maximum jump length at that position.
	Determine if you are able to reach the last index.

	Example 1:
	Input: nums = [2,3,1,1,4]
	Output: true
	Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

	Example 2:
	Input: nums = [3,2,1,0,4]
	Output: false
	Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

	Constraints:
		1 <= nums.length <= 3 * 104
		0 <= nums[i] <= 105
 */

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var list: [Int] = [0]
        for i in 0..<nums.count {
            var max = 0
            let start = i > 0 ? list[i - 1] + 1 : 0
            let end = list[i]
            for j in start...end {
                let position = j + nums[j]
                max = max > position ? max : position
            }
            if max >= nums.count - 1 {
                return true
            }
            if max == list[i] {
                return false
            }
            list.append(max)
        }
        return false
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
    print(Solution().canJump([2,3,1,1,4]))
	print(Solution().canJump([3,2,1,0,4]))
}