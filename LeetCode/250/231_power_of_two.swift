/*	FILEPATH = "./LeetCode/250/231_power_of_two.swift"
 *	231. Power of Two
	Given an integer n, return true if it is a power of two. Otherwise, return false.
	An integer n is a power of two, if there exists an integer x such that n == 2x.

	Example 1:
	Input: n = 1
	Output: true
	Explanation: 2^0 = 1

	Example 2:
	Input: n = 16
	Output: true
	Explanation: 2^4 = 16

	Example 3:
	Input: n = 3
	Output: false

	Example 4:
	Input: n = 4
	Output: true

	Example 5:
	Input: n = 5
	Output: false

	Constraints:
		-2^31 <= n <= 2^31 - 1
	Follow up: Could you solve it without loops/recursion?
 */

class Solution0 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var count = 0
        for i in 0..<32 {
            let mask = 1 << i
            mask & n > 0 ? (count += 1) : ()
        }
        return n > 0 && count == 1
    }
}

class Solution1 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824, 2147483648].contains(n)
    }
}

//  n & (n - 1) == 0
//  e.g. 0b_.._0010..0000 & 0b_.._0001..1111 == 0
//  e.g. 0b_.._0010..0100 & 0b_.._0010..0011 >  0, 至少还有一个高位是 1
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && n & (n - 1) == 0
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
    print(Solution().isPowerOfTwo(1))
    print(Solution().isPowerOfTwo(16))
    print(Solution().isPowerOfTwo(3))
    print(Solution().isPowerOfTwo(4))
    print(Solution().isPowerOfTwo(5))
    print(Solution().isPowerOfTwo(-1))
    print(Solution().isPowerOfTwo(-2))
}