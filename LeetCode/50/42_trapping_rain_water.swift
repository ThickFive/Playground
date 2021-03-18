/*	FILEPATH = "./LeetCode/50/42_trapping_rain_water.swift"
 *	42. Trapping Rain Water
	Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

	Example 1:
	Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
	Output: 6
	Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

	Example 2:
	Input: height = [4,2,0,3,2,5]
	Output: 9

	Constraints:
		n == height.length
		0 <= n <= 3 * 104
		0 <= height[i] <= 105
 */

class Solution {
    //  1. 假设现在要从给定的数组中间, 找下标为 i, j 的两根柱子能装下最多的水, 那么中间加入的柱子只会让水往两边溢出
    //  2. 那么数组就可以分为三个部分 [0..<j] [i..<j] [j..<], 那么 i, j 之间的容量就只需要减去柱子的体积即可
    //  3. 补充: 如果中间有突出的柱子, 需要额外计算这一部分多出的容积
    //  4. 两边的部分可以利用以上步骤递归计算
    //  5. 合并得到最后结果
    func trap(_ height: [Int]) -> Int {
        func subtrap(_ height: [Int], _ i: Int, _ j: Int) -> Int {
            var max = 0
            var max_i = i
            var max_j = j
            var tmp_i = i
            var tmp_j = j
            while  tmp_i < tmp_j {
                let area = (tmp_j - tmp_i - 1) * min(height[tmp_i], height[tmp_j])
                if area > max {
                    max = area
                    max_i = tmp_i
                    max_j = tmp_j
                }
                if height[tmp_i] < height[tmp_j] {
                    tmp_i += 1
                } else {
                    tmp_j -= 1
                }
            }
            if max == 0 {
                return 0
            } else {
                for k in max_i+1..<max_j {
                    let h = min(height[max_i], height[max_j])
                    max -= (height[k] > h ? h : height[k])
                }
                var extra = -1
                var tmp_height = 0
                for k in max_i+1...max_j-1 {
                    if height[k] > min(height[max_i], height[max_j]) && height[k] > tmp_height {
                        tmp_height = height[k]
                        extra = k
                    }
                }
                if extra >= 0 {   // 这一部分重新计算
                    max = subtrap(height, max_i, extra) + subtrap(height, extra, max_j)
                }
                return max + subtrap(height, i, max_i) + subtrap(height, max_j, j)
            }
        }
        return subtrap(height, 0, height.count - 1)
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
    print(Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]))
    print(Solution().trap([4,2,0,3,2,5]))
    print(Solution().trap([5,5,1,7,1,1,5,2,7,6]))
    print(Solution().trap([4,9,4,5,3,2]))
}