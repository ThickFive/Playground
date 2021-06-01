/*	FILEPATH = "./LeetCode/300/287_find_the_duplicate_number.swift"
 *	287. Find the Duplicate Number
	Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
	There is only one repeated number in nums, return this repeated number.
	You must solve the problem without modifying the array nums and uses only constant extra space.

	Example 1:
	Input: nums = [1,3,4,2,2]
	Output: 2

	Example 2:
	Input: nums = [3,1,3,4,2]
	Output: 3

	Example 3:
	Input: nums = [1,1]
	Output: 1

	Example 4:
	Input: nums = [1,1,2]
	Output: 1

	Constraints:
		1 <= n <= 105
		nums.length == n + 1
		1 <= nums[i] <= n
		All the integers in nums appear only once except for precisely one integer which appears two or more times.
	Follow up:
		How can we prove that at least one duplicate number must exist in nums?
		Can you solve the problem in linear runtime complexity?
 */

//  O(n)
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        for num in nums {
            if set.contains(num) {
                return num
            } else {
                set.insert(num)
            }
        }
        return 0
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
    
}