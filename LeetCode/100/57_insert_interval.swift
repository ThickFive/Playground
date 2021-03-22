/*	FILEPATH = "./LeetCode/100/57_insert_interval.swift"
 *	57. Insert Interval
	Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
	You may assume that the intervals were initially sorted according to their start times.

	Example 1:
	Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
	Output: [[1,5],[6,9]]

	Example 2:
	Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
	Output: [[1,2],[3,10],[12,16]]
	Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

	Example 3:
	Input: intervals = [], newInterval = [5,7]
	Output: [[5,7]]

	Example 4:
	Input: intervals = [[1,5]], newInterval = [2,3]
	Output: [[1,5]]

	Example 5:
	Input: intervals = [[1,5]], newInterval = [2,7]
	Output: [[1,7]]

	Constraints:
		0 <= intervals.length <= 104
		intervals[i].length == 2
		0 <= intervals[i][0] <= intervals[i][1] <= 105
		intervals is sorted by intervals[i][0] in ascending order.
		newInterval.length == 2
		0 <= newInterval[0] <= newInterval[1] <= 105
 */

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.count == 0 {
            return [newInterval]
        }
        var res: [[Int]] = []
        var prev = newInterval
        for interval in intervals {
            if prev.count == 0 {
                res.append(interval)
            } else {
                if prev[1] < interval[0] {
                    res.append(prev)
                    res.append(interval)
                    prev = []
                } else if prev[0] > interval[1] {
                    res.append(interval)
                } else {
                    prev = [min(prev[0], interval[0]), max(prev[1], interval[1])]
                }
            }
        }
        prev.count > 0 ? res.append(prev) : ()
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
    print(Solution().insert([[1,3],[6,9]], [2,5]))
    print(Solution().insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))
    print(Solution().insert([], [5,7]))
    print(Solution().insert([[1,5]], [2,3]))
    print(Solution().insert([[1,5]], [2,7]))
}