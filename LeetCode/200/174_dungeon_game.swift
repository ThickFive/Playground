/*	FILEPATH = "./LeetCode/200/174_dungeon_game.swift"
 *	174. Dungeon Game
	The demons had captured the princess and imprisoned her in the bottom-right corner of a dungeon. The dungeon consists of m x n rooms laid out in a 2D grid. Our valiant knight was initially positioned in the top-left room and must fight his way through dungeon to rescue the princess.
	The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately.
	Some of the rooms are guarded by demons (represented by negative integers), so the knight loses health upon entering these rooms; other rooms are either empty (represented as 0) or contain magic orbs that increase the knight's health (represented by positive integers).
	To reach the princess as quickly as possible, the knight decides to move only rightward or downward in each step.
	Return the knight's minimum initial health so that he can rescue the princess.
	Note that any room can contain threats or power-ups, even the first room the knight enters and the bottom-right room where the princess is imprisoned.

	Example 1:
	Input: dungeon = [[-2,-3,3],[-5,-10,1],[10,30,-5]]
	Output: 7
	Explanation: The initial health of the knight must be at least 7 if he follows the optimal path: RIGHT-> RIGHT -> DOWN -> DOWN.

	Example 2:
	Input: dungeon = [[0]]
	Output: 1

	Constraints:
		m == dungeon.length
		n == dungeon[i].length
		1 <= m, n <= 200
		-1000 <= dungeon[i][j] <= 1000
 */

/*
    [   
        [1, -3, 3],
        [0, -2, 0],
        [-3,-3,-3]
    ]
*/
class Solution {
    //  O(m * n)
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let row = dungeon.count
        let col = dungeon[0].count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: col), count: row)
        for i in (0..<row).reversed() {
            for j in (0..<col).reversed() {
                var tmp = 0
                if i < row - 1 && j < col - 1 {
                    tmp = max(dp[i + 1][j], dp[i][j + 1])
                } else if i < row - 1 && j == col - 1 {
                    tmp = dp[i + 1][j]
                } else if j < col - 1 && i == row - 1 {
                    tmp = dp[i][j + 1]
                }
                if dungeon[i][j] < 0 && tmp >= 0 {
                    dp[i][j] = dungeon[i][j]
                } else {
                    dp[i][j] = dungeon[i][j] + tmp
                }
            }
        }
        return max(1 - dp[0][0], 1)
    }

    //  O(2^n)
    func _1_calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let row = dungeon.count
        let col = dungeon[0].count
        func minimum_hp(_ i: Int, _ j: Int, _ target: Int) -> Int {
            var target = target
            if dungeon[i][j] < target {
                target = dungeon[i][j]
            }
            if i == 0 && j == 0 {
                return target
            } else if i > 0 && j > 0 {
                let a = minimum_hp(i, j - 1, target + dungeon[i][j - 1]) 
                let b = minimum_hp(i - 1, j, target + dungeon[i - 1][j])
                return max(a, b)
            } else if i == 0 {
                return minimum_hp(i, j - 1, target + dungeon[i][j - 1])
            } else {
                return minimum_hp(i - 1, j, target + dungeon[i - 1][j])
            }
        }
        return max(1 - minimum_hp(row - 1, col - 1, dungeon[row - 1][col - 1]), 1)
    }

    //  wrong answer
    func _0_calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let row = dungeon.count + 1
        let col = dungeon[0].count + 1
        var dp: [[Int]] = Array(repeating: Array(repeating: Int(Int32.min), count: col), count: row)
        var mp: [[Int]] = Array(repeating: Array(repeating: Int(Int32.max), count: col), count: row)
        for i in 1..<row {
            for j in 1..<col {
                if i == 1 && j == 1 {
                    dp[i][j] = dungeon[i - 1][j - 1]
                    if dp[i][j] <= 0 {
                        mp[i][j] = 1 - dp[i][j]
                        dp[i][j] = 1
                    } else {
                        mp[i][j] = 1
                        dp[i][j] += 1
                    }
                } else {
                    //  2 种选择方案, a: 从上至下, b: 从左至右
                    let dpa = dp[i - 1][j] + dungeon[i - 1][j - 1]
                    let dpb = dp[i][j - 1] + dungeon[i - 1][j - 1]
                    let mpa = (dpa <= 0 ? 1 - dpa : 0) + mp[i - 1][j]
                    let mpb = (dpb <= 0 ? 1 - dpb : 0) + mp[i][j - 1]
                    print(i, j, dpa, dpb, mpa, mpb)
                    if mpa < mpb {
                        dp[i][j] = dpa <= 0 ? 1 : dpa
                        mp[i][j] = mpa
                    } else {
                        dp[i][j] = dpb <= 0 ? 1 : dpb
                        mp[i][j] = mpb
                    }
                }
            } 
        }
        return mp[row - 1][col - 1]
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
    var dungeon: [[Int]] = []
    for _ in 0..<10 {
        var row: [Int] = []
        for _ in 0..<10 {
            let hp = Int(arc4random()) % 10 - 6
            row.append(hp)
        }
        dungeon.append(row)
    }
    // print(dungeon)
    // print(Solution().calculateMinimumHP(dungeon))
    print(Solution().calculateMinimumHP([[-2,-3,3],[-5,-10,1],[10,30,-5]]))
    print(Solution().calculateMinimumHP([[1,-3,3],[0,-2,0],[-3,-3,-3]]))
    print(Solution().calculateMinimumHP([[100]]))
    print(Solution().calculateMinimumHP([[-100]]))
}