/*	FILEPATH = "./LeetCode/250/204_count_primes.swift"
 *	204. Count Primes
	Count the number of prime numbers less than a non-negative number, n.

	Example 1:
	Input: n = 10
	Output: 4
	Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

	Example 2:
	Input: n = 0
	Output: 0

	Example 3:
	Input: n = 1
	Output: 0

	Constraints:
		0 <= n <= 5 * 10^6
 */

class Solution {
    func countPrimes(_ n: Int) -> Int {
        var count = 0
        for num in 0..<n {
            var is_prime = true
            var i = 2
            while i * i <= num {
                if num % i == 0 {
                    is_prime = false
                    break
                }
                i += 1
            }
            if is_prime && num > 1 {
                count += 1
            }
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
    print(Solution().countPrimes(10))
    print(Solution().countPrimes(0))
    print(Solution().countPrimes(1))
}