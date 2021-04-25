/*	FILEPATH = "./LeetCode/250/229_majority_element_ii.swift"
 *	229. Majority Element II
	Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
	Follow-up: Could you solve the problem in linear time and in O(1) space?

	Example 1:
	Input: nums = [3,2,3]
	Output: [3]

	Example 2:
	Input: nums = [1]
	Output: [1]

	Example 3:
	Input: nums = [1,2]
	Output: [1,2]

	Constraints:
		1 <= nums.length <= 5 * 104
		-109 <= nums[i] <= 109
 */

class Solution0 {
    func majorityElement(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        var pivot0: Int?
        var pivot1: Int?
        var count0: Int = 0
        var count1: Int = 0
        for num in nums {
            switch (pivot0, pivot1) {
            case (nil, nil):
                pivot0 = num
                count0 += 1
            case (let p0, nil):
                if p0 == num {
                    count0 += 1
                } else {
                    pivot1 = num
                    count1 += 1
                }
            case (nil, let p1):
                if p1 == num {
                    count1 += 1
                } else {
                    pivot0 = num
                    count0 += 1
                }
            default:
                if pivot0 == num {
                    count0 += 1
                } else if pivot1 == num {
                    count1 += 1
                } else {
                    count0 -= 1
                    count1 -= 1
                }
            }
            count0 == 0 ? pivot0 = nil : () 
            count1 == 0 ? pivot1 = nil : ()
        }
        count0 = 0
        count1 = 0
        for num in nums {
            if let pivot0 = pivot0, num == pivot0 {
                count0 += 1
            }
            if let pivot1 = pivot1, num == pivot1 {
                count1 += 1
            }
        }
        var res: [Int] = []
        if count0 > nums.count / 3 {
            res.append(pivot0!)
        }
        if count1 > nums.count / 3 {
            res.append(pivot1!)
        }
        return res
    }
}

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        return majorityElement(nums, 3)
    }

    class Counter {
        var value: Int = Int.min
        var count: Int = 0
        init() {}
    }

    //  Given an integer array of size n, find all elements that appear more than ⌊ n/k ⌋ times.
    func majorityElement(_ nums: [Int], _ k: Int) -> [Int] {
        var counters: [Counter] = []
        for _ in 0..<k {
            counters.append(Counter())
        }
        for num in nums {
            var exist = false
            var empty = false
            for counter in counters {    //  1. 如果存在, 那么 count +1
                if counter.value == num {
                    exist = true
                    counter.count += 1
                }
                if counter.count == 0 {
                    empty = true
                }
            }
            if exist == false && empty == true {    //  2. 如果不存在, 有空位, 那么填入空位
                for counter in counters {
                    if counter.count == 0 {
                        counter.value = num
                        counter.count += 1
                        break
                    }
                }
            } else if exist == false && empty == false {    //  3. 如果不存在, 无空位, 那么所有 count -1
                for counter in counters {
                    counter.count -= 1
                }
            }
        }
        let remain_counters = counters.filter({$0.count > 0}).map({ counter -> Counter in
                counter.count = 0
                return counter
            })
        for num in nums {
            for counter in remain_counters {
                if counter.value == num {
                    counter.count += 1
                }
            }
        }
        return remain_counters.filter({$0.count > nums.count / k}).map({$0.value})
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
    print(Solution().majorityElement([3,2,3], 3))
    print(Solution().majorityElement([1,1,2], 2))
    print(Solution().majorityElement([1,2,3,4,5,2,6,7,8,9,7], 10))
}