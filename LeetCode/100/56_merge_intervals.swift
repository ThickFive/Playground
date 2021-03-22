/*	FILEPATH = "./LeetCode/100/56_merge_intervals.swift"
 *	56. Merge Intervals
	Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

	Example 1:
	Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
	Output: [[1,6],[8,10],[15,18]]
	Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

	Example 2:
	Input: intervals = [[1,4],[4,5]]
	Output: [[1,5]]
	Explanation: Intervals [1,4] and [4,5] are considered overlapping.

	Constraints:
		1 <= intervals.length <= 10^4
		intervals[i].length == 2
		0 <= starti <= endi <= 10^4
 */

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals
        }
        var sorted = intervals
        sorted.sort(by: {$0[0] < $1[0]})
        var res: [[Int]] = []
        var prev = sorted[0]
        for interval in sorted {
            if interval[0] <= prev[1] {
                prev = [prev[0], max(interval[1], prev[1])]
            } else {
                res.append(prev)
                prev = interval
            }
        }
        res.append(prev)
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
    print(Solution().merge([[12,33],[2,6],[8,10],[15,18]]))
    print(Solution().merge([[1,4],[4,7]]))
    print(Solution().merge([[1,2]]))
}