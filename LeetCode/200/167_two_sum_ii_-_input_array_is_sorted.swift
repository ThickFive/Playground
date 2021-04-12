/*	FILEPATH = "./LeetCode/200/167_two_sum_ii_-_input_array_is_sorted.swift"
 *	167. Two Sum II - Input array is sorted
	Given an array of integers numbers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
	Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.
	You may assume that each input would have exactly one solution and you may not use the same element twice.

	Example 1:
	Input: numbers = [2,7,11,15], target = 9
	Output: [1,2]
	Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

	Example 2:
	Input: numbers = [2,3,4], target = 6
	Output: [1,3]

	Example 3:
	Input: numbers = [-1,0], target = -1
	Output: [1,2]

	Constraints:
		2 <= numbers.length <= 3 * 104
		-1000 <= numbers[i] <= 1000
		numbers is sorted in increasing order.
		-1000 <= target <= 1000
		Only one valid answer exists.
 */

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0
        var j = numbers.count - 1
        while  i < j {
            let sum = numbers[i] + numbers[j]
            if sum == target {
                return [i + 1, j + 1]
            }
            if sum < target {
                i += 1
            } else {
                j -= 1
            }
        }
        return []
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
    print(Solution().twoSum([2,7,11,15], 9))
    print(Solution().twoSum([2,3,4], 6))
    print(Solution().twoSum([-1,0], -1))
}