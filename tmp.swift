//===--- Common Begin ---------------------------------------------------===//

/*	FILEPATH = "./Base/common.swift"
 *	Common
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func build_tree_from_level_order(_ nums: [Int?]) -> TreeNode? {
    guard nums.count > 0, let num0 = nums[0] else {
        return nil
    }
    let root = TreeNode(num0)
    var queue: [TreeNode] = [root]
    var index = 0
    while queue.count > 0 {
        var list: [TreeNode] = []
        for node in queue {
            index += 1
            if index < nums.count, let val = nums[index] {
                let left = TreeNode(val)
                node.left = left
                list.append(left)
            }
            index += 1
            if index < nums.count, let val = nums[index] {
                let right = TreeNode(val)
                node.right = right
                list.append(right)
            }
        }
        queue = list
    }
    return root
}

func output_tree(_ root: TreeNode?) {
    func traverse_tree(_ root: TreeNode?, _ level: Int, _ index: Int, _ height: Int, _ res: inout [[Character]]) {
        guard let root = root else {
            return 
        }
        //  输出当前节点
        let n = height - level - 1
        let m = level > 0 ? index - (_pow(2, level) - 1) : 0
        var row = level * 2
        var col = position_of_node(n, m)
        let chars = Array(String(root.val))
        var start = col - (chars.count - (m % 2 == 0 ? 1 : 0)) / 2
        start = (start > 0 && res[row][start] == " " ? start : col)
        let end = start + chars.count
        res[row].replaceSubrange(start..<end, with: chars)
        if level > 0 {  // 对应的 `/` or '\'
            row = level * 2 - 1
            col = position_of_char(n, m)
            res[row][col] = m % 2 == 0 ? "/" : "\\"
        }
        //  输出子节点
        traverse_tree(root.left, level + 1, index * 2 + 1, height, &res)
        traverse_tree(root.right, level + 1, index * 2 + 2, height, &res)
    }

    func height_of_tree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(height_of_tree(root.left), height_of_tree(root.right)) + 1
    }

    func position_of_node(_ n: Int, _ m: Int) -> Int {
        //  p(n, m) = 2^(n+1) - 2 +  m * 2^(n + 2)
        return _pow(2, n + 1) - 2 + m * _pow(2, n + 2)
    }

    func position_of_char(_ n: Int, _ m: Int) -> Int {
        //  p'(n, m) = (p(n, m) + p(n+1, m / 2)) / 2
        return (position_of_node(n, m) + position_of_node(n + 1, m / 2)) / 2
    }

    func _pow(_ n: Int, _ e: Int) -> Int {
        return Int(pow(Double(n), Double(e)))
    }

    let height = height_of_tree(root)
    var res: [[Character]] = Array(repeating: Array(repeating: " ", count: _pow(2, height - 1) * 4 + 10), count: height * 2 - 1) 
    traverse_tree(root, 0, 0, height, &res)
    for level in res.map({$0.map({String($0)}).joined(separator: "")}) {
        print(level)
    }
}

//===--- Common End ---------------------------------------------------===//

/*	FILEPATH = "./Base/kmp.swift"
 *	Knuth-Morris-Pratt 
 */

func match(_ s: String, _ p: String) -> Bool {
    let s = Array(s)
    let p = Array(p)
    let next = get_next(p)
    var len = 0 //  相同字符长度
    var i = 0
    var j = 0
    while i < s.count && j < p.count {
        if s[i] == p[j] {
            len += 1
            if len == p.count {
                return true
            }
        } else {
            len = next[len]
            j = len - 1
        }
        j += 1
        i += 1
    }
    return false
}

func get_next(_ s: [Character]) -> [Int] {
    var next = Array(repeating: 0, count: s.count)
    for i in 1..<s.count {
        if s[i] == s[next[i - 1]] {
            next[i] = next[i - 1] + 1
        } else {
            next[i] = s[i] == s[0] ? 1 : 0
        }
    }
    return next
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
    print(match("123125", "124"))
    print(match("123125", "312"))
    print(match("111", "111"))
    print(match("a", "a"))
    print(match("a", "b"))
    print(match("1111111b1111111c1111111d1111111e1111111f1111111g", "1111111a"))
    print(match("1111111b1111111c1111111d1111111e1111111f1111111g", "1111111g"))
}
