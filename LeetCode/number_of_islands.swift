/*  FILEPATH = "./LeetCode/number_of_islands.swift"
 *  200. Number of Islands

    Given an m x n 2d grid map of '1's (land) and '0's (water), return the number of islands.
    An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

    Example 1:
    Input: grid = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
    ]
    Output: 1
    Example 2:

    Input: grid = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
    ]
    Output: 3
 */

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0                           //  岛屿总数
        let row = grid.count                     //  行数
        let col = row > 0 ? grid[0].count : 0    //  列数
        var mark_map = [[Int]](repeating: [Int](repeating: 0, count: col), count: row) //  初始化标记数组
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == "0" {
                    continue
                }
                //  1. 检测当前元素是否已被标记过, 未标记 count += 1
                if mark_map[i][j] == 0 {
                    count += 1
                    //  2. 标记所有与其相邻元素
                    func markNearbyItem(_ i: Int, _ j: Int) {
                        if i >= 0 && i < row  && j >= 0 && j < col {
                            if grid[i][j] == "1" && mark_map[i][j] != count { // 相邻元素为1, 且未标记过
                                mark_map[i][j] = count
                                markNearbyItem(i-1, j)  //  上
                                markNearbyItem(i+1, j)  //  下
                                markNearbyItem(i, j-1)  //  左
                                markNearbyItem(i, j+1)  //  右
                            }
                        }
                    }
                    markNearbyItem(i, j)
                }
            }
        }
        return count
    }
}