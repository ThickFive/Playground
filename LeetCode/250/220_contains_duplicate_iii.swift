/*	FILEPATH = "./LeetCode/250/220_contains_duplicate_iii.swift"
 *	220. Contains Duplicate III
	Given an integer array nums and two integers k and t, return true if there are two distinct indices i and j in the array such that abs(nums[i] - nums[j]) <= t and abs(i - j) <= k.

	Example 1:
	Input: nums = [1,2,3,1], k = 3, t = 0
	Output: true

	Example 2:
	Input: nums = [1,0,1,1], k = 1, t = 2
	Output: true

	Example 3:
	Input: nums = [1,5,9,1,5,9], k = 2, t = 3
	Output: false

	Constraints:
		0 <= nums.length <= 2 * 104
		-231 <= nums[i] <= 231 - 1
		0 <= k <= 104
		0 <= t <= 231 - 1
 */

//  如果两个数的 key 相同, 那么它们相差 <= t
//  反之, 如果两个数相差 <= t, 那么它们的 key 最多相差 1
//  e.g.    nums = [3,-3,6], k = 2, t = 3
//          min = -3, gap = t + 1 = 4
//          keys = [1, 0, 2], 把 key 相差 <= 1 的数再拿出来比较一下即可
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var buckets: [Int: Int] = [:]
        let min = nums.min() ?? 0
        let gap = t + 1
        for i in 0..<nums.count {
            if i > k {
                let old = (nums[i - k - 1] - min) / gap
                buckets[old] = nil
            }
            let key = (nums[i] - min) / gap
            if let num = buckets[key], abs(num - nums[i]) <= t {
                return true
            } else if let num = buckets[key - 1], abs(num - nums[i]) <= t {
                return true
            } else if let num = buckets[key + 1], abs(num - nums[i]) <= t {
                return true
            } else {
                buckets[key] = nums[i]
            }
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
    print(Solution().containsNearbyAlmostDuplicate([1,2,3,1], 3, 0))
    print(Solution().containsNearbyAlmostDuplicate([1,0,1,1], 1, 2))
    print(Solution().containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3))
}