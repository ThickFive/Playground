/*	FILEPATH = "./LeetCode/300/264_ugly_number_ii.swift"
 *	264. Ugly Number II
	An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
	Given an integer n, return the nth ugly number.

	Example 1:
	Input: n = 10
	Output: 12
	Explanation: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.

	Example 2:
	Input: n = 1
	Output: 1
	Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.

	Constraints:
		1 <= n <= 1690
 */

var map: [Int] = [1]

func nth_ugly_num(_ n: Int) {
    var next = Int.max
    for num in map {
        if num * 2 > map[map.count - 1] {
            next = min(next, num * 2)
        }
        if num * 3 > map[map.count - 1] {
            next = min(next, num * 3)
        }
        if num * 5 > map[map.count - 1] {
            next = min(next, num * 5)
        } 
    }
    map.append(next)
    if map.count <= n {
        nth_ugly_num(n)
    }
}

nth_ugly_num(1690)

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        return map[n - 1]
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
    print(Solution().nthUglyNumber(10))
    print(Solution().nthUglyNumber(1))
    print(Solution().nthUglyNumber(1690))
}