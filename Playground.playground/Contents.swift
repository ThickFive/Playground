/*	FILEPATH = "./LeetCode/250/239_sliding_window_maximum.swift"
 *	239. Sliding Window Maximum
	You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
	Return the max sliding window.

	Example 1:
	Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
	Output: [3,3,5,5,6,7]
	Explanation: 
	Window position                Max
	---------------               -----
	[1  3  -1] -3  5  3  6  7       3
	 1 [3  -1  -3] 5  3  6  7       3
	 1  3 [-1  -3  5] 3  6  7       5
	 1  3  -1 [-3  5  3] 6  7       5
	 1  3  -1  -3 [5  3  6] 7       6
	 1  3  -1  -3  5 [3  6  7]      7

	Example 2:
	Input: nums = [1], k = 1
	Output: [1]

	Example 3:
	Input: nums = [1,-1], k = 1
	Output: [1,-1]

	Example 4:
	Input: nums = [9,11], k = 2
	Output: [11]

	Example 5:
	Input: nums = [4,-2], k = 2
	Output: [4]

	Constraints:
		1 <= nums.length <= 10^5
		-10^4 <= nums[i] <= 10^4
		1 <= k <= nums.length
 */

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res: [Int] = []
        var idx = -1
        for i in 0...nums.count - k {
            if idx >= 0 {
                if idx >= i {
                    if i <= nums.count - k && nums[i + k - 1] >= nums[idx] {
                        idx = i + k - 1
                    }
                } else {
                    idx = max_index(nums, i, i + k)
                }
            } else {
                idx = max_index(nums, i, i + k)  
            }
            res.append(nums[idx])
        }
        return res
    }

    func max_index(_ nums: [Int], _ i: Int, _ j: Int) -> Int {
        var max = Int.min
        var index = i
        for k in i..<j {
            if nums[k] >= max {
                max = nums[k]
                index = k
            }
        }
        return index
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

// Test.run {
//     print(Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
//     print(Solution().maxSlidingWindow([1], 1))
//     print(Solution().maxSlidingWindow([1,-1], 1))
//     print(Solution().maxSlidingWindow([9,11], 2))
//     print(Solution().maxSlidingWindow([4,-2], 2))
// }

Test.run {
    var nums: [Int] = []
    let k = 10007
    for i in 0..<10 * 10000 {
        let num = 10000 - i % 20000
        nums.append(num)
    }
    _ = Solution().maxSlidingWindow(nums, k)
}