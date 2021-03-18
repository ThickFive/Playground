/*	FILEPATH = "./LeetCode/50/11_container_with_most_water.swift"
 *	11. Container With Most Water
	Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.
	Notice that you may not slant the container.

	Example 1:
	Input: height = [1,8,6,2,5,4,8,3,7]
	Output: 49
	Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

	Example 2:
	Input: height = [1,1]
	Output: 1

	Example 3:
	Input: height = [4,3,2,1,4]
	Output: 16

	Example 4:
	Input: height = [1,2,1]
	Output: 2

	Constraints:
		n == height.length
		2 <= n <= 10^5
		0 <= height[i] <= 10^4
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var max: Int = 0
        while i < j {
            let area = (j - i) * min(height[i], height[j])
            max = max > area ? max : area
            if (height[i] < height[j]) {
                i += 1
            } else {
                j -= 1
            }
            
        }
        return max
    }

    func _maxArea(_ height: [Int]) -> Int {
        let count = height.count
        var max: Int = 0
        for i in 0..<count-1 {
            for j in i+1..<count {
                let area = (j - i) * min(height[i], height[j])
                max = max > area ? max : area
            }
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
    print(Solution().maxArea([1,8,6,2,5,4,8,3,7]))
    print(Solution().maxArea([1,1]))
    print(Solution().maxArea([4,3,2,1,4]))
    print(Solution().maxArea([1,2,1]))
}