/*	FILEPATH = "./LeetCode/150/135_candy.swift"
 *	135. Candy
	There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.
	You are giving candies to these children subjected to the following requirements:
		Each child must have at least one candy.
		Children with a higher rating get more candies than their neighbors.
	Return the minimum number of candies you need to have to distribute the candies to the children.

	Example 1:
	Input: ratings = [1,0,2]
	Output: 5
	Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.

	Example 2:
	Input: ratings = [1,2,2]
	Output: 4
	Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
	The third child gets 1 candy because it satisfies the above two conditions.

	Constraints:
		n == ratings.length
		1 <= n <= 2 * 104
		0 <= ratings[i] <= 2 * 104
 */

class Solution {
	//	0(n) + O(n)
    func candy(_ ratings: [Int]) -> Int {
		var indexs: [Int] = []
		var count = 0
        for i in 0..<ratings.count {
			let left = i > 0 ? ratings[i - 1] : Int.max
			let right = i < ratings.count - 1 ? ratings[i + 1] : Int.max
			if ratings[i] <= left && ratings[i] <= right {
				indexs.append(i)
				count += 1
			}
		}
		indexs.append(ratings.count)
		var prev = -1
		for index in indexs {
			let start = prev + 1
			let end = index
			if end > start {
				var max_rating = Int.min
				var max_index = Int.min
				for i in start..<end {
					if ratings[i] >= max_rating {
						max_rating = ratings[i]
						max_index = i
					}
				}
				var left_count = max_index - start
				var right_count = end - max_index - 1
				if max_index - 1 >= start && ratings[max_index - 1] == max_rating { //	two max
					right_count += 1
				} else {
					if left_count > right_count {
						left_count += 1
					} else {
						right_count += 1
					}
				}
				count += (2 + left_count + 1) * left_count / 2 + (2 + right_count + 1) * right_count / 2
			}
			prev = index
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
    print(Solution().candy([1,1,1,1,1,1]))
	print(Solution().candy([1,2,3,4,5,5]))
	print(Solution().candy([5,5,4,3,2,1]))
	print(Solution().candy([1,1,2,2,3,3,2,2]))
}