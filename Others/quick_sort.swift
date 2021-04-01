/*	FILEPATH = "./Others/quick_sort.swift"
 *	Quick Sort
 */

func quick_sort(_ nums: inout [Int]) {
	quick_sort(&nums, 0, nums.count - 1)
}

func quick_sort(_ nums: inout [Int],  _ i: Int, _ j: Int) {
	if (i >= j) { return }
	let pivot = partition(&nums, i, j)
	quick_sort(&nums, i, pivot - 1)
	quick_sort(&nums, pivot + 1, j)
}

func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
	var i = left
	var j = right
	var count = 1
	let pivot = nums[j]
	while i < j - count + 1 {
		if nums[i] > pivot {
			safe_swap(&nums, i, j)
			safe_swap(&nums, i, j - count)
			j -= 1
		} else if nums[i] < pivot {
			i += 1
		} else if nums[i] == pivot {
			safe_swap(&nums, i, j - count)
			count += 1
		}
	}
	return j
}

func safe_swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
	if i < 0 || j < 0 || i >= nums.count || j >= nums.count {
		return
	}
	let tmp = nums[i]
	nums[i] = nums[j]
	nums[j] = tmp
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
    var nums: [Int]
	nums = []
	quick_sort(&nums)
	print(nums)
	nums = [1]
	quick_sort(&nums)
	print(nums)
	nums = [1,1,4,5,5,4,1,1,2,2,3,3]
	quick_sort(&nums)
	print(nums)
	nums = [4,3,2,1]
	quick_sort(&nums)
	print(nums)
}