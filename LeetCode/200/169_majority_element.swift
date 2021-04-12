/*	FILEPATH = "./LeetCode/200/169_majority_element.swift"
 *	169. Majority Element
	Given an array nums of size n, return the majority element.
	The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

	Example 1:
	Input: nums = [3,2,3]
	Output: 3

	Example 2:
	Input: nums = [2,2,1,1,1,2,2]
	Output: 2

	Constraints:
		n == nums.length
		1 <= n <= 5 * 10^4
		-2^31 <= nums[i] <= 2^31 - 1
	Follow-up: Could you solve the problem in linear time and in O(1) space?
 */

class Solution {
    //  摩尔投票法 T(n), S(1)
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = nums[0]
        var count = 0
        for num in nums {
            if num == candidate {
                count += 1
            } else {
                count -= 1
            }
            if count == 0 {
                count = 1
                candidate = num
            }
        }
        return candidate
    }

    //  HashMap 改进版 T(n) * 1/2, S(n) * 1/4
    func _1_majorityElement(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var max_count = Int.min
        var res = Int.min
        var i = 0
        while i < (nums.count + 1) / 2 {
            let j = nums.count - 1 - i
            let num = nums[j]
            if nums[i] == num {
                if let count = map[num] {
                    map[num] = (i < j ? 2 : 1) + count
                } else {
                    map[num] = (i < j ? 2 : 1)
                }
                if map[num]! > max_count {
                    max_count = map[num]!
                    res = num
                }
            }
            i += 1
        }
        return res
    }

    //  HashMap T(n), S(n) * 1/2
    func _0_majorityElement(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for num in nums {
            if let count = map[num] {
                map[num] = 1 + count
            } else {
                map[num] = 1
            }
            if map[num]! >= (nums.count + 1) / 2 {
                return num
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
    print(Solution().majorityElement([3,2,3]))
    print(Solution().majorityElement([2,2,1,1,1,2,2]))
}