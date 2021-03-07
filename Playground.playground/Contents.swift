/*	FILEPATH = "./LeetCode/pow(x,_n).swift"
 *	50. Pow(x, n)
	Implement pow(x, n), which calculates x raised to the power n (i.e. xn).

	Example 1:
	Input: x = 2.00000, n = 10
	Output: 1024.00000

	Example 2:
	Input: x = 2.10000, n = 3
	Output: 9.26100

	Example 3:
	Input: x = 2.00000, n = -2
	Output: 0.25000
	Explanation: 2-2 = 1/22 = 1/4 = 0.25

	Constraints:
		-100.0 < x < 100.0
		-231 <= n <= 231-1
		-104 <= xn <= 104
 */

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        return pow(x, Double(n))
    }
}

/*
 *  TEST
 */
import Foundation
class Test {
    class func run(_ code:() -> ()) {
        print(Date(), "TEST START")
        code()
        print(Date(), "TEST END")
    }
}

Test.run {
    print(Solution().myPow(2, 10))
    print(Solution().myPow(2.1, 3))
    print(Solution().myPow(2, -2))
}

