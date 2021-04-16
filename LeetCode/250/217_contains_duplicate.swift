/*	FILEPATH = "./LeetCode/250/217_contains_duplicate.swift"
 *	217. Contains Duplicate
	Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

	Example 1:
	Input: nums = [1,2,3,1]
	Output: true

	Example 2:
	Input: nums = [1,2,3,4]
	Output: false

	Example 3:
	Input: nums = [1,1,1,3,3,4,3,2,4,2]
	Output: true

	Constraints:
		1 <= nums.length <= 10^5
		-10^9 <= nums[i] <= 10^9
 */

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []
        for num in nums {
            if set.contains(num) {
                return true
            } else {
                set.insert(num)
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
    print(Solution().containsDuplicate([1,2,3,1]))
    print(Solution().containsDuplicate([1,2,3,4]))
    print(Solution().containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
}