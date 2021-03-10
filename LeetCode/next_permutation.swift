/*	FILEPATH = "./LeetCode/next_permutation.swift"
 *	31. Next Permutation
	Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
	If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).
	The replacement must be in place and use only constant extra memory.

	Example 1:
	Input: nums = [1,2,3]
	Output: [1,3,2]

	Example 2:
	Input: nums = [3,2,1]
	Output: [1,2,3]

	Example 3:
	Input: nums = [1,1,5]
	Output: [1,5,1]

	Example 4:
	Input: nums = [1]
	Output: [1]

	Constraints:
		1 <= nums.length <= 100
		0 <= nums[i] <= 100
 */

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var list: [Int] = []
		var last: Int? = nil
		//	1. 找到最长的倒序序列
		for num in nums.reversed() {
			if list.count == 0 {
				list.append(num)
				last = num
			} else if num >= last! {
				list.append(num)
				last = num
			} else {
				break
			}
		}
		//	2. 从倒序序列里找到刚好比前一个数大的数, 与之交换
		let index = nums.count - list.count - 1
		if (index >= 0) {
			let num_to_exchange = nums[index]
			for (i, num) in list.enumerated() {
				if num > num_to_exchange {
					nums[index] = num
					list[i] = num_to_exchange
					break
				}
			}
		} 
		//	3. 合并结果
		for i in index+1..<nums.count {
			nums[i] = list[i-index-1]
		} 
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
	var array: [Int] = []
	array = [1,2,3]
	Solution().nextPermutation(&array)
    print(array)
	array = [3,2,1]
	Solution().nextPermutation(&array)
    print(array)
	array = [1,1,5]
	Solution().nextPermutation(&array)
    print(array)
	array = [1]
	Solution().nextPermutation(&array)
    print(array)
	array = [2,5,4,3,1]
	Solution().nextPermutation(&array)
    print(array)
	array = [5,1,1,1]
	Solution().nextPermutation(&array)
    print(array)
}