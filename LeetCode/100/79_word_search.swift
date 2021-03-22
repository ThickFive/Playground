/*	FILEPATH = "./LeetCode/100/79_word_search.swift"
 *	79. Word Search
	Given an m x n grid of characters board and a string word, return true if word exists in the grid.
	The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.
	Note: There will be some test cases with a board or a word larger than constraints to test if your solution is using pruning.

	Example 1:
	Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
	Output: true

	Example 2:
	Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
	Output: true

	Example 3:
	Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
	Output: false

	Constraints:
		m == board.length
		n = board[i].length
		1 <= m, n <= 6
		1 <= word.length <= 15
		board and word consists of only lowercase and uppercase English letters.
 */

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let chs = reverse_if_needed(chars(word))
        if is_valid(board, chs) == false {
            return false
        }
        var res = false
        func backtrack(_ path: [[Int]], _ position: [Int], _ target: Int) {
            if res || path.count == target {
                res = true
                return
            }
            let char = chs[path.count]
            let positions = next(board, position, char)
            var path = path
            for position in positions {
                if path.contains(position) {
                    continue
                }
                path.append(position)
                backtrack(path, position, target)
                path.remove(at: path.count - 1)
            }
        }
        backtrack([], [-1, -1], chs.count)
        return res
    }

    func is_valid(_ board: [[Character]], _ chars: [Character]) -> Bool {
        var res = true
        loop1: for c in chars {
            var tmp = false
            loop2: for i in 0..<board.count {
                for j in 0..<board[0].count {
                    if board[i][j] == c {
                        tmp = true
                        break loop2
                    }
                }
            }
            if tmp == false {
                res = false
                break loop1
            }
        }
        return res
    }

    func reverse_if_needed(_ chars: [Character]) -> [Character] {
        var head_count = 0
        var tail_count = 0
        for c in chars {
            if c == chars[0] {
                head_count += 1
            }
            if c == chars[chars.count - 1] {
                tail_count += 1
            }
        }
        if tail_count < head_count {
            return chars.reversed()
        } else {
            return chars
        }
    }

    func next(_ board: [[Character]], _ position: [Int], _ char: Character) -> [[Int]] {
        var res: [[Int]] = []
        if position[0] == -1 {  //  寻找第一个字符
            for i in 0..<board.count {
                for j in 0..<board[0].count {
                    if board[i][j] == char {
                        res.append([i, j])
                    }
                }
            }
        } else {    //  寻找上下左右最多四个字符
            var c: Character = " "
            if position[0] > 0 {
                let i = position[0] - 1
                let j = position[1]
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
            if position[0] < board.count - 1 {
                let i = position[0] + 1
                let j = position[1]
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
            if position[1] > 0 {
                let i = position[0]
                let j = position[1] - 1
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
            if position[1] < board[0].count - 1 {
                let i = position[0]
                let j = position[1] + 1
                c = board[i][j]
                c == char ? res.append([i, j]) : ()
            }
        }
        return res
    }

    func chars(_ s: String) -> [Character] {
        var chs: [Character] = []
        for c in s {
            chs.append(c)
        }
        return chs
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
    var board: [[Character]]
    var word: String
    board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]; word = "ABCCED"
    print(Solution().exist(board, word))
    board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]; word = "SEE"
    print(Solution().exist(board, word))
    board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]; word = "ABCB"
    print(Solution().exist(board, word))
}