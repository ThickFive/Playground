/*	FILEPATH = "./LeetCode/n_sum.swift"
 *	nSum
	Given an array nums of n integers, are n elements a, b..., n in nums such that a + b + ... + n = target? Find all unique numbers in the array which gives the sum of target.
	Notice that the solution set must not contain duplicate numbers.

	Example 1:
	Input: nums = [-1,0,1,2,-1,-4], target = 0, n = 4
	Output: [[-1, 0, 0, 1], [-2, -1, 1, 2], [-2, 0, 0, 2]]

	Example 2:
	Input: nums = [3,2,4], target = 9, n = 3
	Output: [[2, 3, 4]]

	Example 3:
	Input: nums = [1,2,3,4,5], target = 6, n = 2
	Output: [[2, 4], [1, 5]]

    Example 4:
	Input: nums = [3,3,4,1,1,0,-1,0,-2,2], target = 9, n = 5
	Output: [[-1, 0, 3, 3, 4], [0, 1, 2, 3, 3], [0, 0, 2, 3, 4], [0, 1, 1, 3, 4], [-1, 1, 2, 3, 4], [-2, 1, 3, 3, 4]]

	Constraints:
        n >= 2
		0 <= nums.length <= 3000
		-105 <= nums[i] <= 105
 */

class Solution {
    func nSum(_ nums: [Int], _ target: Int, _ n: Int) -> [[Int]] {
        //  1. 排序
        let sorted = nums.sorted()
        //  2. 计算下标
        func n_sum(_ nums: [Int], _ target: Int, _ n: Int) -> [[Int]] {
            var res = Set<[Int]>() 
            for (i, num) in nums.enumerated() {
                if n == 1 {
                    if num == target {
                        res.insert([i])
                    }
                } else {
                    let index_array_list = n_sum(sorted, target - num, n - 1)
                    for var index_array in index_array_list {
                        if index_array.contains(i) == false {
                            index_array.append(i)
                            res.insert(index_array.sorted())
                        }
                    }
                } 
            }
            return Array(res)
        }
        //  3. 结果去重
        var res = Set<[Int]>()
        for index_array in n_sum(sorted, target, n) {
            res.insert(index_array.map({sorted[$0]}))
        }
        //  返回最终结果
        return Array(res)
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
    print(Solution().nSum([1,0,-1,0,-2,2], 0, 4))
    print(Solution().nSum([3,2,4], 9, 3))
    print(Solution().nSum([1,2,3,4,5], 6, 2))
	print(Solution().nSum([3,3,4,1,1,0,-1,0,-2,2], 9, 5))
}