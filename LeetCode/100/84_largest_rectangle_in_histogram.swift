/*	FILEPATH = "./LeetCode/100/84_largest_rectangle_in_histogram.swift"
 *	84. Largest Rectangle in Histogram
	Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

	Example 1:
	Input: heights = [2,1,5,6,2,3]
	Output: 10
	Explanation: The above is a histogram where width of each bar is 1.
	The largest rectangle is shown in the red area, which has an area = 10 units.

	Example 2:
	Input: heights = [2,4]
	Output: 4

	Constraints:
		1 <= heights.length <= 105
		0 <= heights[i] <= 104
 */

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        func largest_rectangle_area(_ heights: [Int], _ left: Int, _ right: Int) -> Int {
            if left == right {
                return heights[left]
            }
            if left > right {
                return 0
            }
            //  找到最小值, area = height * width
            let indexs = find_min_height_indexs(heights, left, right)
            var max = heights[indexs[0]] * (right - left + 1)
            //  去掉最小值, 将数组分割为多个部分, 分别计算这些部分的 max_area
            var tmp = left - 1
            for index in indexs {
                let area = largest_rectangle_area(heights, tmp + 1, index - 1)
                max = max > area ? max : area
                tmp = index
            }
            //  返回最大值
            return max
        }
        return largest_rectangle_area(heights, 0, heights.count - 1)
    }

    func find_min_height_indexs(_ heights: [Int], _ left: Int, _ right: Int) -> [Int] {
        var min = Int.max
        for i in left...right {
            min = min < heights[i] ? min : heights[i]
        }
        var indexs: [Int] = []
        for i in left...right {
            if heights[i] == min {
                indexs.append(i)
            }
        }
        if indexs[indexs.count - 1] != right {
            indexs.append(right + 1)
        }
        return indexs
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
    var heights: [Int]
    heights = [2,1,5,6,2,3]
    print(Solution().largestRectangleArea(heights))
    heights = [2,4]
    print(Solution().largestRectangleArea(heights))
}