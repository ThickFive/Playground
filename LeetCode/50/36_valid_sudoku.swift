/*	FILEPATH = "./LeetCode/50/36_valid_sudoku.swift"
 *	36. Valid Sudoku
	Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
		Each row must contain the digits 1-9 without repetition.
		Each column must contain the digits 1-9 without repetition.
		Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
	Note:
		A Sudoku board (partially filled) could be valid but is not necessarily solvable.
		Only the filled cells need to be validated according to the mentioned rules.

	Example 1:
	Input: board = 
	[["5","3",".",".","7",".",".",".","."]
	,["6",".",".","1","9","5",".",".","."]
	,[".","9","8",".",".",".",".","6","."]
	,["8",".",".",".","6",".",".",".","3"]
	,["4",".",".","8",".","3",".",".","1"]
	,["7",".",".",".","2",".",".",".","6"]
	,[".","6",".",".",".",".","2","8","."]
	,[".",".",".","4","1","9",".",".","5"]
	,[".",".",".",".","8",".",".","7","9"]]
	Output: true

	Example 2:
	Input: board = 
	[["8","3",".",".","7",".",".",".","."]
	,["6",".",".","1","9","5",".",".","."]
	,[".","9","8",".",".",".",".","6","."]
	,["8",".",".",".","6",".",".",".","3"]
	,["4",".",".","8",".","3",".",".","1"]
	,["7",".",".",".","2",".",".",".","6"]
	,[".","6",".",".",".",".","2","8","."]
	,[".",".",".","4","1","9",".",".","5"]
	,[".",".",".",".","8",".",".","7","9"]]
	Output: false

	Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

	Constraints:
		board.length == 9
		board[i].length == 9
		board[i][j] is a digit or '.'.
 */

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        func is_invalid(_ box: [Character]) -> Bool {
            var chars: [Character] = []
            for c in box {
                if c != "." {
                    if chars.contains(c) {
                        return true
                    } else {
                        chars.append(c)
                    }
                }
            }
            return false
        }
        for i in 0..<9 {
            //  行
            if is_invalid(board[i]) {
                return false
            }
            //  列
            if is_invalid(board.map({$0[i]})) {
                return false
            }
            //  九宫格, 左上角起点
            let col = (i % 3) * 3
            let row = (i / 3) * 3
            let box = Array(board[row][col..<col+3]) + Array(board[row+1][col..<col+3]) + Array(board[row+2][col..<col+3])
            if is_invalid(box) {
                return false
            }
        }
        return true
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
    print(Solution().isValidSudoku(
        [["5","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
        ))
    print(Solution().isValidSudoku(
        [["8","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
        ))
}