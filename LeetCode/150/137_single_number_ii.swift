/*	FILEPATH = "./LeetCode/150/137_single_number_ii.swift"
 *	137. Single Number II
	Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

	Example 1:
	Input: nums = [2,2,3,2]
	Output: 3

	Example 2:
	Input: nums = [0,1,0,1,0,1,99]
	Output: 99

	Constraints:
		1 <= nums.length <= 3 * 104
		-231 <= nums[i] <= 231 - 1
		Each element in nums appears exactly three times except for one element which appears once.
	Follow up: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0, b = 0
        for num in nums {
            let newA = a & ~b & ~num + ~a & b & num
            let newB = ~a & b & ~num + ~a & ~b & num
            (a, b) = (newA, newB)
        }
        return a | b
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