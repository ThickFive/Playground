/*	FILEPATH = "./LeetCode/100/70_climbing_stairs.swift"
 *	70. Climbing Stairs
	You are climbing a staircase. It takes n steps to reach the top.
	Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

	Example 1:
	Input: n = 2
	Output: 2
	Explanation: There are two ways to climb to the top.
	1. 1 step + 1 step
	2. 2 steps

	Example 2:
	Input: n = 3
	Output: 3
	Explanation: There are three ways to climb to the top.
	1. 1 step + 1 step + 1 step
	2. 1 step + 2 steps
	3. 2 steps + 1 step

	Constraints:
		1 <= n <= 45
 */

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {return 1}
        if n == 2 {return 2}
        var map: [Int] = [1, 2]
        for i in 2..<n {
            let step = map[i - 1] + map[i - 2]
            map.append(step)
        }
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
    print(Solution().climbStairs(10))
}