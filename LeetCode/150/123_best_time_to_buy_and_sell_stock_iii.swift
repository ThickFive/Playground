/*	FILEPATH = "./LeetCode/150/123_best_time_to_buy_and_sell_stock_iii.swift"
 *	123. Best Time to Buy and Sell Stock III
	You are given an array prices where prices[i] is the price of a given stock on the ith day.
	Find the maximum profit you can achieve. You may complete at most two transactions.
	Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

	Example 1:
	Input: prices = [3,3,5,0,0,3,1,4]
	Output: 6
	Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
	Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

	Example 2:
	Input: prices = [1,2,3,4,5]
	Output: 4
	Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
	Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

	Example 3:
	Input: prices = [7,6,4,3,1]
	Output: 0
	Explanation: In this case, no transaction is done, i.e. max profit = 0.

	Example 4:
	Input: prices = [1]
	Output: 0

	Constraints:
		1 <= prices.length <= 105
		0 <= prices[i] <= 105
 */

class Solution {
    //  dp0[i] 表示第 i 天卖出能获得的最大利润
    //  dp1[j] 表示第 j + 1 天买进能获得的最大利润
    //  
    //  e.g [1,4,2,6,0,1]
    //          |   ----->     | 
    //  dp0 [0, 0, 3, 1, 5, 0, 1]
    //  dp1 [5, 2, 4, 0, 1, 0, 0]
    //       |     <-----   |
    //
    //  修改之后 dp0[i] 表示 第 i 天之前卖出的最大利润 (包含 i)
    //  修改之后 dp1[i] 表示 第 i 天之后买入的最大利润 (不包含 i)
    //  dp0 [0, 0, 3, 3, 5, 5, 5]   
    //  dp1 [5, 4, 4, 1, 1, 0, 0]
    func maxProfit(_ prices: [Int]) -> Int {
        var dp0: [Int] = Array(repeating: 0, count: prices.count + 1)
        var dp1: [Int] = Array(repeating: 0, count: prices.count + 1)
        var prev0 = prices[0]
        var prev1 = prices[prices.count - 1]
        for i in 0..<prices.count {
            let price0 = prices[i]
            let price1 = prices[prices.count - 1 - i]
            let profit0 = dp0[i] + price0 - prev0
            let profit1 = dp1[prices.count - i] + prev1 - price1
            dp0[i + 1] = max(0, profit0)
            dp1[prices.count - i - 1] = max(0, profit1)
            prev0 = price0
            prev1 = price1
        }
        for i in 0...prices.count {
            dp0[i] = max(dp0[i], (i > 0 ? dp0[i - 1] : 0))
            dp1[prices.count - i] = max(dp1[prices.count - i], (i > 0 ? dp1[prices.count - i + 1] : 0))
        }
		var max_profit = 0
        for i in 0...prices.count {
            let profit = dp0[i] + dp1[i]
            max_profit = max(profit, max_profit)
        }
        return max_profit
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
    print(Solution().maxProfit([3,3,5,0,0,3,1,4]))
	print(Solution().maxProfit([1,2,3,4,5]))
	print(Solution().maxProfit([7,6,4,3,1]))
	print(Solution().maxProfit([1]))
}