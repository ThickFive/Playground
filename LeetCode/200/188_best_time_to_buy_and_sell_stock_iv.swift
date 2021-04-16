/*	FILEPATH = "./LeetCode/200/188_best_time_to_buy_and_sell_stock_iv.swift"
 *	188. Best Time to Buy and Sell Stock IV
	You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k.
	Find the maximum profit you can achieve. You may complete at most k transactions.
	Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

	Example 1:
	Input: k = 2, prices = [2,4,1]
	Output: 2
	Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.

	Example 2:
	Input: k = 2, prices = [3,2,6,5,0,3]
	Output: 7
	Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4. Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.

	Constraints:
		0 <= k <= 100
		0 <= prices.length <= 1000
		0 <= prices[i] <= 1000
 */

class Solution {
    func _1_maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var buy: [[Int]] = Array(repeating: Array(repeating: 0, count: k), count: prices.count)
        var sell: [[Int]] = Array(repeating: Array(repeating: 0, count: k), count: prices.count)
        for i in 0..<prices.count {
            let price = prices[i]
            for j in 0..<k {
                if i == 0 {
                    buy[i][j] = -price
                    sell[i][j] = 0
                } else {
                    let profit_buy = buy[i - 1][j]
                    var profit_sell = 0
                    if j > 0 {
                        profit_sell = sell[i - 1][j - 1]
                    }
                    buy[i][j] = max(buy[i - 1][j], profit_sell - price)
                    sell[i][j] = max(sell[i - 1][j], price + profit_buy)
                }
                print(i, j, buy[i][j], sell[i][j])
            }
        }
        return sell[prices.count - 1].max() ?? 0
    }

    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var buy: [Int] = Array(repeating: Int.max, count: k)
        var sell: [Int] = Array(repeating: 0, count: k)
        for price in prices {
            for i in 0..<k {
                buy[i] = min(buy[i], price - (i > 0 ? sell[i - 1]: 0))
                sell[i] = max(sell[i], price - buy[i])
            }
        }
        return sell.max() ?? 0
    }

    //  wrong answer
    func _0_maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let min_peaks: [(Int, Int)] = get_min_peaks(prices)
        var max_peaks: [(Int, Int)] = get_max_peaks(prices)
        if min_peaks.count > 0 && max_peaks.count > 0 {
            if min_peaks[0].1 > max_peaks[0].1 {
                max_peaks.remove(at: 0)
            }
        } else {
            return 0
        }
        print(min_peaks)
        print(max_peaks)
        let count = min(min_peaks.count, max_peaks.count)
        var profits: [Int] = []
        for i in 0..<count {
            let profit = max_peaks[i].0 - min_peaks[i].0
            profits.append(profit)
        }
        print(profits)
        profits.sort(by: >)
        print(profits)
        var max_profit = 0
        for (i, profit) in profits.enumerated() {
            if i > k - 1 {
                break
            }
            print(profit)
            max_profit += profit
        }
        return max_profit
    }

    func get_min_peaks(_ prices: [Int]) -> [(Int, Int)] {
        var min_peaks: [(Int, Int)] = []
        var temp: Int?
        for i in 0..<prices.count {
            let curr = prices[i]
            let next = i < prices.count - 1 ? prices[i + 1] : Int.max
            let prev = temp ?? Int.max
            if curr == next {
                continue
            }
            if curr < next && curr < prev {
                min_peaks.append((curr, i))
            }
            temp = curr
        }
        return min_peaks
    }

    func get_max_peaks(_ prices: [Int]) -> [(Int, Int)] {
        var max_peaks: [(Int, Int)] = []
        var temp: Int?
        for i in 0..<prices.count {
            let curr = prices[i]
            let next = i < prices.count - 1 ? prices[i + 1] : Int.min
            let prev = temp ?? Int.min
            if curr == next {
                continue
            }
            if curr > next && curr > prev {
                max_peaks.append((curr, i))
            }
            temp = curr
        }
        return max_peaks
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
    // print(Solution().maxProfit(3, [2,4,1]))
    // print(Solution().maxProfit(3, [2,2,1,1,3,3]))
    // print(Solution().maxProfit(3, [2,2,2,3,3,3,4,4,4,1,1,1]))
    // print(Solution().maxProfit(3, [2,2,2,3,3,3,2]))
    // print(Solution().maxProfit(6, [2,1,2,1,2,1]))
    print(Solution().maxProfit(2, [1,4,3,6,2,4]))
    // print(Solution().maxProfit(10, [1,4,1,2,3,4,10,0,10,1,2,3,10,9,1,2,8,2,5,1,5,4,2,3,1,1,10,5,2,2,2,2,5,1,1,8,4,1,1,1,2,3,6,0,3,2,5,1]))
}