/*	FILEPATH = "./LeetCode/250/228_summary_ranges.swift"
 *	228. Summary Ranges
	You are given a sorted unique integer array nums.
	Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.
	Each range [a,b] in the list should be output as:
		"a->b" if a != b
		"a" if a == b

	Example 1:
	Input: nums = [0,1,2,4,5,7]
	Output: ["0->2","4->5","7"]
	Explanation: The ranges are:
	[0,2] --> "0->2"
	[4,5] --> "4->5"
	[7,7] --> "7"

	Example 2:
	Input: nums = [0,2,3,4,6,8,9]
	Output: ["0","2->4","6","8->9"]
	Explanation: The ranges are:
	[0,0] --> "0"
	[2,4] --> "2->4"
	[6,6] --> "6"
	[8,9] --> "8->9"

	Example 3:
	Input: nums = []
	Output: []

	Example 4:
	Input: nums = [-1]
	Output: ["-1"]

	Example 5:
	Input: nums = [0]
	Output: ["0"]

	Constraints:
		0 <= nums.length <= 20
		-231 <= nums[i] <= 231 - 1
		All the values of nums are unique.
		nums is sorted in ascending order.
 */

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums.count > 0 else {
            return []
        }
        var ranges: [(Int, Int)] = []
        var prev: Int?
        var start = nums[0]
        var end = nums[0]
        for num in nums {
            if let prev = prev {
                if num == prev + 1 {
                    end += 1
                } else {
                    ranges.append((start, end))
                    start = num
                    end = num
                }
            }
            prev = num
        }
        ranges.append((start, end))
        var res: [String] = []
        for range in ranges {
            if range.0 == range.1 {
                res.append("\(range.0)")
            } else {
                res.append("\(range.0)->\(range.1)")
            }
        }
        return res
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
    print(Solution().summaryRanges([0,1,2,4,5,7]))
    print(Solution().summaryRanges([0,2,3,4,6,8,9]))
    print(Solution().summaryRanges([]))
    print(Solution().summaryRanges([-1]))
    print(Solution().summaryRanges([0]))
}