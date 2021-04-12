/*	FILEPATH = "./LeetCode/200/179_largest_number.swift"
 *	179. Largest Number
	Given a list of non-negative integers nums, arrange them such that they form the largest number.
	Note: The result may be very large, so you need to return a string instead of an integer.

	Example 1:
	Input: nums = [10,2]
	Output: "210"

	Example 2:
	Input: nums = [3,30,34,5,9]
	Output: "9534330"

	Example 3:
	Input: nums = [1]
	Output: "1"

	Example 4:
	Input: nums = [10]
	Output: "10"

	Constraints:
		1 <= nums.length <= 100
		0 <= nums[i] <= 109
 */
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var nums = nums
        nums.sort(by: { (a, b) -> Bool in
            return Int("\(a)\(b)")! > Int("\(b)\(a)")!
        })
        var string = ""
        for num in nums {
            string += "\(num)"
        }
        return nums[0] == 0 ? "0" : string
    }
}

//  wrong answer, e.g. [34323, 3432], after add padding 34323 > 34322, but 343233432 < 343234323
class _Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let max = nums.max()!
        let count = count_of_num(max)
        var map: [(Int, Int)] = []
        //  数字用最低位补齐
        for num in nums {
            map.append(padding_to_max_count(num, count))
        }
        //  从大到小排序
        map.sort(by: { $0.0 > $1.0 })
        //  去掉补齐的位数
        var string = ""
        for val_pad in map {
            let val = val_pad.0
            let pad = val_pad.1
            let num = val / Int(pow(10, Double(pad)))
            string += "\(num)"
        }
        return string
    }

    func padding_to_max_count(_ num: Int, _ max: Int) -> (Int, Int) {
        // let last = num % 10
        let count = count_of_num(num)
        if count < max {
            var string = "\(num)"
            for _ in 0..<max - count {
                string += "\(9)"
            }
            return (Int(string)!, max - count)
        } else {
            return (num, 0)
        }
    }

    func count_of_num(_ num: Int) -> Int {
        var num = num
        var count = 1
        while num >= 10 {
            num /= 10
            count += 1
        }
        return count
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
    print(Solution().largestNumber([10,2]))
    print(Solution().largestNumber([3,30,34,5,9]))
    print(Solution().largestNumber([1]))
    print(Solution().largestNumber([10]))
}