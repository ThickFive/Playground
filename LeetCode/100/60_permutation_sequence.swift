/*	FILEPATH = "./LeetCode/100/60_permutation_sequence.swift"
 *	60. Permutation Sequence
	The set [1, 2, 3, ..., n] contains a total of n! unique permutations.
	By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
		"123"
		"132"
		"213"
		"231"
		"312"
		"321"
	Given n and k, return the kth permutation sequence.

	Example 1:
	Input: n = 3, k = 3
	Output: "213"

	Example 2:
	Input: n = 4, k = 9
	Output: "2314"

	Example 3:
	Input: n = 3, k = 1
	Output: "123"

	Constraints:
		1 <= n <= 9
		1 <= k <= n!
 */

class Solution {
    /*
        n! = n * (n-1)!
        1. (n-1)! < k <= n! 表示 k 的第一个字符不再可能是 1, 因为以 1 开头的排列最多有 (n-1)! 种
        2. 同样的以 m 开头的排列也有 (n-1)! 种, 现在只需要确定 (m - 1)(n-1)! < k <= (m) * (n-1)!, 那么 k 一定是以数字 m 开头
        3. 余下的位数以同样的逻辑逐步确定

        例如 1, 2, 3 排列的第 k = 5 个数字确定方式为: 
        1. 2 * (3-1)! < 5 <= 3 * (3-1)! 第一个数为 3, 剩下 1, 2 两个数
        2. 5 - 2 * (3-1)! = 1, 0 * (3-2)! < 1 <= 1 * (3-2)!, 第二个数字为 1, 剩下 2
        3. 那么 k = 5 时对应的数字为 312
    */
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var digitals: [Int] = []
        for i in 1...n {
            digitals.append(i)
        }
        var res: String = ""
        var val = k
        var m = n
        while res.count < n && val > 0 {
            let i = Int(ceil(Double(val) / Double(permutation(m - 1))))
            res += "\(digitals[i-1])"
            print(i, digitals)
            digitals.remove(at: i - 1)
            val -= (i - 1) * permutation(m - 1)
            m -= 1
        }
        return res
    }

    func permutation(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var res = 1
        for i in 1...n {
            res *= i
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
    // print(Solution().getPermutation(3, 1))
    // print(Solution().getPermutation(3, 2))
    // print(Solution().getPermutation(3, 3))
    // print(Solution().getPermutation(3, 4))
    // print(Solution().getPermutation(3, 5))
    // print(Solution().getPermutation(3, 6))
    print(Solution().getPermutation(9, 100)) // "123495786"
}