class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
		//	1. 排序
		var _nums = nums
        _nums.sort(by: {$0 < $1})
		//	2. 建立 HashTable
		var hash_table: [Int: Int] = [:]
        for (i, num) in _nums.enumerated() {
            hash_table[num] = i
        }
		//	3. twoSum 得到符合条件的结果, 并用 Set 去重
		var res = Set<[Int]>()  
		for (i, num) in _nums.enumerated() {
			let two_nums_list = twoSum(_nums, 0 - num)
			for var two_nums in two_nums_list {
				if two_nums.count > 0 && two_nums[0] != i && two_nums[1] != i {
					two_nums.append(i)
					two_nums.sort(by: {$0 < $1})
					res.insert(two_nums.map({_nums[$0]}))
				}
			}
        }
		return Array(res)
	}

	//	HashTable O(n), 返回 [index]
	func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
		var hash_table: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            hash_table[num] = i
        }
		//	返回所有符合条件的结果
		var res: [[Int]] = []
		for (i, num) in nums.enumerated() {
            if let j = hash_table[target - num], j > i {
				res.append([i, j])
			}
        }
        return res
    }

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
        //  结果去重
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
    print(Solution().nSum([], 0, 4))
    print(Solution().nSum([3,2,4], 9, 3))
	print(Solution().nSum([3,3,4,1], 7, 2))
}