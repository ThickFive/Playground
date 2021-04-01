/*	FILEPATH = "./LeetCode/150/121_best_time_to_buy_and_sell_stock.swift"
 *	121. Best Time to Buy and Sell Stock
	You are given an array prices where prices[i] is the price of a given stock on the ith day.
	You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
	Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

	Example 1:
	Input: prices = [7,1,5,3,6,4]
	Output: 5
	Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
	Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

	Example 2:
	Input: prices = [7,6,4,3,1]
	Output: 0
	Explanation: In this case, no transactions are done and the max profit = 0.

	Constraints:
		1 <= prices.length <= 105
		0 <= prices[i] <= 104
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var max = 0
        var dp: [Int] = [0]
        var prev = prices[0]
        for (i, price) in prices.enumerated() {
            let profit = dp[i] + price - prev
            if profit > 0 {
                dp.append(profit)
            } else {
                dp.append(0)
            }
            prev = price
            max = max > profit ? max : profit
        }
        return max
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
    
}