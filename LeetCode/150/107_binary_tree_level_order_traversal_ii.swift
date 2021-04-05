/*	FILEPATH = "./LeetCode/150/107_binary_tree_level_order_traversal_ii.swift"
 *	107. Binary Tree Level Order Traversal II
	Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

	Example 1:
	Input: root = [3,9,20,null,null,15,7]
	Output: [[15,7],[9,20],[3]]

	Example 2:
	Input: root = [1]
	Output: [[1]]

	Example 3:
	Input: root = []
	Output: []

	Constraints:
		The number of nodes in the tree is in the range [0, 2000].
		-1000 <= Node.val <= 1000
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
 
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var queue: [TreeNode] = [root]
        var res: [[TreeNode]] = []
        while queue.count > 0 {
            res.append(queue)
            var list: [TreeNode] = []
            for node in queue {
                if let left = node.left {
                    list.append(left)
                }
                if let right = node.right {
                    list.append(right)
                }
            }
            queue = list
        }
        return res.reversed().map({ (level: [TreeNode]) -> [Int] in
            return level.map({$0.val})
        })
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