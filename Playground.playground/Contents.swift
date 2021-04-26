/*	FILEPATH = "./Base/build_tree_from_level_order.swift"
 *	Build Tree From Level Order
 */

/**
 * Definition for a binary tree node.
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

/*
    如何结构化输出一棵二叉树?
    0. 前提条件
    假定每个节点的长度都为 1, 父节点在左右两个连接符`/``\`正中间,  连接符在父节点与子节点正中间
    p 为父节点位置, k 为节点与连接符之间的间距(k >= 1), n 为当前层到最后一层的距离, n >= 0
    1. 确定子节点之间的间距
    p(root)     = p
    p('/')      = p(root) -  k = p - k
    p('\')      = p(root) +  k = p + k
    p(left)     = p('/') - k = p - 2*k
    p(right)    = p('/') - k = p + 2*k
    子节点间距 = p(right) - p(left) = 4*k
    2. 确定每层之间的间距 k(n)
    根据前提条件, 父节点必然处于左右两个子节点正中间
    """
          root
         /   \           k(n)
       l       r         p(r) -  p(l) = 4 * k(n)
      / \     / \        k(n-1)
     ll  lr  rl  rr      p(rl) - p(ll) = 4 * k(n-1) * 2
    """
    很显然 p(r) -  p(l) == p(rl) - p(ll), 那么 k(n) = k(n-1) * 2
    如果 k(0) = 1, 则有 k(n) = 2^n
    3. 确定第 n 层最左侧节点的位置 p(n)
    p(n) = p(n-1) + k(n - 1) * 2 = p(n-1) + 2^n, 即 p(n) = p(0) + ∑(2^n), (n >= 1)
    化简得 p(n) = 2^(n+1) - 2, p(0) = 0
    3. 确定第 n 层从左至右第 m 个节点的位置 p(n, m), m >= 0
    很显然 p(n, m) = p(n, m - 1) + 4 * k(n), 则有 p(n, m) = p(n, 0) + 4 * m * k(n)
    化简得 p(n, m) = 2^(n+1) - 2 +  m * 2^(n + 2)
    4. 确定第 n 层从左至右第 m 个连接符的位置 p'(n, m), m >= 0
    根据前提条件, 连接符在父节点与子节点中间, 并且第 m 个连接符对应下一层第 m / 2 个节点
    那么有 p'(n, m) = (p(n, m) + p(n+1, m / 2)) / 2
    总结, 只需要知道当前节点在倒数第 n 层, 第 m 个, 即可确定输出时的位置
    e.g.    
    """ 01234567890123456789012345678         
    3                 4                 p(3, 0) = 2^4 - 2 + 0 * 2^(2 + 2) = 14
                  /       \             p'(2, 1) = (p(2, 1) + p(3, 0)) / 2 = (22 + 14) / 2 = 18
    2         3               3         p(2, 1) = 2^3 - 2 + 1 * 2^(2 + 2)= 22
            /   \           /   \ 
    1     2       2       2       2
         / \     / \     / \     / \
    0   1   1   1   1   1   1   132 1
    """
    最多支持 6 层, 63 个节点, 叶子节点最好不要超过 3 位数, 否则可能相互覆盖, 效果入下
    e.g.
    """
                                                                  10                                                                
                                                  /                               \                                                 
                                  20                                                             30                                 
                          /               \                                               /               \                         
                  40                             50                               60                             70                 
              /       \                       /       \                       /       \                       /       \             
          80             90              100             110             120             130             140             150        
        /   \           /   \           /   \           /   \           /   \           /   \           /   \           /   \       
     160     170     180     190     200     210     220     230     240     250     260     270     280     290     300     310    
     / \     / \     / \     / \     / \     / \     / \     / \     / \     / \     / \     / \     / \     / \     / \     / \    
    320330 340 350 360 370 380 390 400 410 420 430 440 450 460 470 480 490 500 510 520 530 540 550 560 570 580 590 600 610 620 630
    """
 */
func output_tree(_ root: TreeNode?) {
    let height = height_of_tree(root)
    var tree: [[Character]] = Array(repeating: Array(repeating: " ", count: _pow(2, height - 1) * 4), count: height * 2 - 1)
    func traverse_tree(_ root: TreeNode?, _ level: Int, _ index: Int) {
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
        start = (start > 0 && tree[row][start] == " " ? start : col)
        let end = start + chars.count
        tree[row].replaceSubrange(start..<end, with: chars)
        if level > 0 {  // 对应的 `/` or '\'
            row = level * 2 - 1
            col = position_of_char(n, m)
            tree[row][col] = m % 2 == 0 ? "/" : "\\"
        }
        //  输出子节点
        traverse_tree(root.left, level + 1, index * 2 + 1)
        traverse_tree(root.right, level + 1, index * 2 + 2)
    }   
    traverse_tree(root, 0, 0)
    for level in tree.map({$0.map({String($0)}).joined(separator: "")}) {
        print(level)
    }
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
    var root: TreeNode?
    var nums: [Int?] = [0]
    for i in 1..<20 {
        if arc4random() % 4 == 0 {
            nums.append(nil)
        } else {
            nums.append(i)
        }
    }
    root = build_tree_from_level_order(nums)
    output_tree(root)
}