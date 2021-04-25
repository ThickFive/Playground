/*	FILEPATH = "./LeetCode/250/222_count_complete_tree_nodes.swift"
 *	222. Count Complete Tree Nodes
	Given the root of a complete binary tree, return the number of the nodes in the tree.
	According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

	Example 1:
	Input: root = [1,2,3,4,5,6]
	Output: 6

	Example 2:
	Input: root = []
	Output: 0

	Example 3:
	Input: root = [1]
	Output: 1

	Constraints:
		The number of nodes in the tree is in the range [0, 5 * 104].
		0 <= Node.val <= 5 * 104
		The tree is guaranteed to be complete.
	Follow up: Traversing the tree to count the number of nodes in the tree is an easy solution but with O(n) complexity. Could you find a faster algorithm?
 */

 /**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

//  O(log(n)), 一直遍历左子树可以得到树的高度 h 
//  O(log(n)^2), 再根据高度用二分法遍历叶子节点, 直到找到最后一个叶子节点为止, 2^(h-1) <= index < 2^h
//  e.g. 节点数为 6, 高度为 3, [4, 8) 中点 为 6 存在, [6, 8) 中点为 7 不存在, 那么可以确定 6 是最后一个节点
//          1
//          /\
//         2  3
//        /\  /
//       4  5 6
//  用二进制表示节点的序号
//            1
//          /   \
//         10   11
//        / \   /
//      100 101 110
//  可以看到, 除去最高位的 1 表示根节点外, 0 代表左节点, 1代表右节点, 5 = 0b101 即 root -> left -> right
class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let height = height_of_tree(root)
        var left = povv(2, height - 1) 
        var right = povv(2, height)
        var mid = (left + right) / 2
        var index = mid
        while left < right {
            if exist_node_of_index(mid, height, root) {
                index = mid
                left = mid + 1
            } else {
                right = mid
            }
            mid = (left + right) / 2
        }
        return index
    }
    
    func height_of_tree(_ root: TreeNode?) -> Int {
        var height = 0
        var curr = root
        while curr != nil {
            height += 1
            curr = curr?.left
        }
        return height
    }
    
    func exist_node_of_index(_ num: Int, _ height: Int, _ root: TreeNode?) -> Bool {
        var curr = root
        for i in 0..<height - 1 {
            let mask = 1 << (height - i - 2)
            curr = mask & num == 0 ? curr?.left : curr?.right
        }
        return curr != nil
    }
    
    func povv(_ num: Int, _ exp: Int) -> Int {
        return Int(pow(Double(num), Double(exp)))
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