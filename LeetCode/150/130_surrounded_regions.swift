/*	FILEPATH = "./LeetCode/150/130_surrounded_regions.swift"
 *	130. Surrounded Regions
	Given an m x n matrix board containing 'X' and 'O', capture all regions surrounded by 'X'.
	A region is captured by flipping all 'O's into 'X's in that surrounded region.

	Example 1:
	Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
	Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
	Explanation: Surrounded regions should not be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.

	Example 2:
	Input: board = [["X"]]
	Output: [["X"]]

	Constraints:
		m == board.length
		n == board[i].length
		1 <= m, n <= 200
		board[i][j] is 'X' or 'O'.
 */

class Solution {
    func solve(_ board: inout [[Character]]) {
        let row = board.count
        let col = board[0].count
        var map = Array(repeating: Array(repeating: 0, count: col) , count: row)
        //  1...n 表示相邻的 "O"
        var index = 1
        var indexs: [Int] = []
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "O" && map[i][j] < 1 {
                    mark_region(i, j, board, &map, index, &indexs)
                    index += 1
                }
            } 
        }
        for i in 0..<row {
            for j in 0..<col {
                if map[i][j] > 0 && indexs.contains(map[i][j]) == false {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    func mark_region(_ i: Int, _ j: Int, _ board: [[Character]], _ map: inout [[Int]], _ index: Int, _ indexs: inout [Int]) {
        let row = board.count
        let col = board[0].count
        if i >= 0 && i < row && j >= 0 && j < col {
            if board[i][j] == "O" && map[i][j] == 0 {
                map[i][j] = index
                mark_region(i + 1, j, board, &map, index, &indexs)
                mark_region(i - 1, j, board, &map, index, &indexs)
                mark_region(i, j - 1, board, &map, index, &indexs)
                mark_region(i, j + 1, board, &map, index, &indexs) 
            }
        } else { // 说明越界
            indexs.append(index)
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
    
}