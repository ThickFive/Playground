/*	FILEPATH = "./LeetCode/250/219_contains_duplicate_ii.swift"
 *	219. Contains Duplicate II
	Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

	Example 1:
	Input: nums = [1,2,3,1], k = 3
	Output: true

	Example 2:
	Input: nums = [1,0,1,1], k = 1
	Output: true

	Example 3:
	Input: nums = [1,2,3,1,2,3], k = 2
	Output: false

	Constraints:
		1 <= nums.length <= 10^5
		-10^9 <= nums[i] <= 10^9
		0 <= k <= 10^5
 */

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set: Set<Int> = []
        for i in 0..<nums.count {
            let num = nums[i]
            if set.contains(num) {
                return true
            }
            set.insert(num)
            if set.count > k {
                set.remove(nums[i - k])
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
    print(Solution().containsNearbyDuplicate([1,2,3,1], 3))
    print(Solution().containsNearbyDuplicate([1,0,1,1], 1))
    print(Solution().containsNearbyDuplicate([1,2,3,1,2,3], 2))
}