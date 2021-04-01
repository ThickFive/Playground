/*	FILEPATH = "./LeetCode/150/149_max_points_on_a_line.swift"
 *	149. Max Points on a Line
	Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

	Example 1:
	Input: points = [[1,1],[2,2],[3,3]]
	Output: 3

	Example 2:
	Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
	Output: 4

	Constraints:
		1 <= points.length <= 300
		points[i].length == 2
		-104 <= xi, yi <= 104
		All the points are unique.
 */

class Solution {
	//	HashMap O(n^2)
	func maxPoints(_ points: [[Int]]) -> Int {
		if points.count <= 2 {
			return points.count
		}
		var map: [String: Set<Int>] = [:]
		var max = 0
		for i in 0..<points.count {
			if i + 1 >= points.count {
				break
			}
			for j in i+1..<points.count {
				let line = line_of_two_point(i, j, points)
				let key = "\(line.0)-\(line.1)"
                var indexs = map[key] != nil ? map[key]! : Set<Int>()
                indexs.insert(i)
                indexs.insert(j)
                map[key] = indexs
				max = max > map[key]!.count ? max : map[key]!.count
			}
		}
		return max
	}

	//	直线方程 y = kx + a, idx0, idx1 分别表示 points 数组的下标
	func line_of_two_point(_ idx0: Int, _ idx1: Int, _ points: [[Int]]) -> (Double, Double) {
		let p0 = points[idx0]
		let p1 = points[idx1]
		var k, a: Double
		if p0[1] == p1[1] {		//	与 x 轴平行
			k = 0
			a = Double(p0[1])
		} else if p0[0] == p1[0] {	//	与 y 轴平行
			k = Double(Int.max)
			a = Double(p0[0])
		} else {
			k = Double(p0[1] - p1[1]) / Double(p0[0] - p1[0])
			a = Double(p0[1]) - k * Double(p0[0])
		}
		return (k, a)
	} 

	//	暴力循环 O(n^3)
    func _maxPoints(_ points: [[Int]]) -> Int {
        var lines: [[Int]] = [[]]
		var count = 0
		var max = 0
        for i in 0..<points.count {
            var new_line: [Int] = []
            for (j, var line) in lines.enumerated() {
                if line.count + points.count - i > max && is_point_in_line(i, line, points) {
                    line.append(i)
					max = max > line.count ? max : line.count
                    lines[j] = line
					count += 1
                } else {
                    for index in line {
                        if new_line.contains(index) == false {
                            lines.append([index, i])
                            new_line.append(index)
                        }
						count += 1
                    }
                }
            }
        }
		print(count)
        return max
    }
    
    func is_point_in_line(_ index: Int, _ line: [Int], _ points: [[Int]]) -> Bool {
        if line.count < 2 {
            return true
        } else {
            let p0 = points[line[0]]
            let p1 = points[line[1]]
			let p2 = points[index]
            return (p0[0] - p1[0]) * (p2[1] - p1[1]) == (p0[1] - p1[1]) * (p2[0] - p1[0])
        }
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
    var points: [[Int]]
	points = [[54,153],[1,3],[0,-72],[-3,3],[12,-22],[-60,-322],[0,-5],[-5,1],[5,5],[36,78],[3,-4],[5,0],[0,4],[-30,-197],[-5,0],[60,178],[0,0],[30,53],[24,28],[4,5],[2,-2],[-18,-147],[-24,-172],[-36,-222],[-42,-247],[2,3],[-12,-122],[-54,-297],[6,-47],[-5,3],[-48,-272],[-4,-2],[3,-2],[0,2],[48,128],[4,3],[2,4]]
	print(Solution().maxPoints(points))
}