/*	FILEPATH = "./LeetCode/250/233_number_of_digit_one.swift"
 *	233. Number of Digit One
	Given an integer n, count the total number of digit 1 appearing in all non-negative integers less than or equal to n.

	Example 1:
	Input: n = 13
	Output: 6

	Example 2:
	Input: n = 0
	Output: 0

	Constraints:
		0 <= n <= 2 * 109
 */

class Solution {
    //  计算每一位贡献 1 的数量, ooo1xx, 只需要计算 ooo 与 xx 所有可能出现的组合数
    //  e.g. 2105
    //  千, base = 10^3, high = 0, digit = 2, 那么千位上 1xxx (xxx: 000 - 999) 出现 1000 次 1, 合计 1000
    //  百, base = 10^2, high = 2, digit = 1, 那么百位上 o1xx (o: 0-1, xx: 00 - 99) 共出现 200 次 1, 另外加上 2.100 - 2.105 共出现 6 次 1, 合计 206
    //  十, base = 10^1, high = 21, digit = 0, 那么十位上 oo1x (oo: 00-20, x: 0 - 9) 共 21 * 10 次 1, 合计 210
    //  个, base = 10^0, high = 210, digit = 5, 那么个位上 ooo1 (oo: 000-209) 共 210 次 1, 另外加上 210.1 共出现 1 次 1, 合计 211
    //  合计 1000 + 206 + 210 + 211 = 1627
    func countDigitOne(_ n: Int) -> Int {
        let digits = digit(n)
        var sum = 0
        for (i, digit) in digits.enumerated() {
            let base = Int(pow(10.0, Double(digits.count - i - 1)))
            let high = n / (base * 10)
            sum += high * base      
            if digit > 1 {
                sum += base         
            } else if digit == 1 {
                sum += n % base + 1
            }
        }
        return sum
    }
    
    func digit(_ n: Int) -> [Int] {
        var res: [Int] = []
        var num = n
        var rem = 0
        while num > 0 {
            rem = num % 10
            num = num / 10
            res.append(rem)
        }
        return res.reversed()
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
    print(Solution().countDigitOne(13))
    print(Solution().countDigitOne(0))
    print(Solution().countDigitOne(100))
}