/*	FILEPATH = "./LeetCode/150/122_best_time_to_buy_and_sell_stock_ii.swift"
 *	122. Best Time to Buy and Sell Stock II
	You are given an array prices where prices[i] is the price of a given stock on the ith day.
	Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
	Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

	Example 1:
	Input: prices = [7,1,5,3,6,4]
	Output: 7
	Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
	Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.

	Example 2:
	Input: prices = [1,2,3,4,5]
	Output: 4
	Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
	Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

	Example 3:
	Input: prices = [7,6,4,3,1]
	Output: 0
	Explanation: In this case, no transaction is done, i.e., max profit = 0.

	Constraints:
		1 <= prices.length <= 3 * 104
		0 <= prices[i] <= 104
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var max_profit = 0
        var prev = prices[0]
        for price in prices {
            if price > prev {
                max_profit += price - prev
            }
            prev = price
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
    
}