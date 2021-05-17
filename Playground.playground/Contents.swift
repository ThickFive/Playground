/*	FILEPATH = "./LeetCode/350/347_top_k_frequent_elements.swift"
 *	347. Top K Frequent Elements
	Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

	Example 1:
	Input: nums = [1,1,1,2,2,3], k = 2
	Output: [1,2]

	Example 2:
	Input: nums = [1], k = 1
	Output: [1]

	Constraints:
		1 <= nums.length <= 105
		k is in the range [1, the number of unique elements in the array].
		It is guaranteed that the answer is unique.
	Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 */

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        var max_count = 0
        for num in nums {
            map[num, default: 0] += 1
            max_count = max(max_count, map[num]!)
        }
        var buckets: [[Int]] = Array(repeating: [], count: max_count + 1)
        for (num, count) in map {
            buckets[count] += [num]
        }
        var res: [Int] = []
        var sum = 0
        for bucket in buckets.reversed() {
            if sum >= k { break }
            sum += bucket.count
            res += bucket
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
    print(Solution().topKFrequent([1,1,1,2,2,3], 2))
    print(Solution().topKFrequent([1], 1))
}