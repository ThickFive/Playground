/*	FILEPATH = "./LeetCode/250/223_rectangle_area.swift"
 *	223. Rectangle Area
	Given the coordinates of two rectilinear rectangles in a 2D plane, return the total area covered by the two rectangles.
	The first rectangle is defined by its bottom-left corner (A, B) and its top-right corner (C, D).
	The second rectangle is defined by its bottom-left corner (E, F) and its top-right corner (G, H).

	Example 1:
	Input: A = -3, B = 0, C = 3, D = 4, E = 0, F = -1, G = 9, H = 2
	Output: 45

	Example 2:
	Input: A = -2, B = -2, C = 2, D = 2, E = -2, F = -2, G = 2, H = 2
	Output: 16

	Constraints:
		-104 <= A, B, C, D, E, F, G, H <= 104
 */

class Solution {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        let area_a = computeArea(A, B, C, D)
        let area_b = computeArea(E, F, G, H)
        let area_intersect = compute_intersect_area(A, B, C, D, E, F, G, H)
        return area_a + area_b - area_intersect
    }
    
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int) -> Int {
        return abs((C - A) * (D - B))
    }
    
    func compute_intersect_area(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        let x = [A, C, E, G].sorted()
        let y = [B, D, F, H].sorted()
        let intersect_x = (x[3] - x[0]) < (abs(C - A) + abs(G - E))
        let intersect_y = (y[3] - y[0]) < (abs(D - B) + abs(H - F))
        if intersect_x && intersect_y {
            return computeArea(x[1], y[1], x[2], y[2])
        } else {
            return 0
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
    print(Solution().computeArea(-3, 0, 3, 4, 0, -1, 9, 2))
}