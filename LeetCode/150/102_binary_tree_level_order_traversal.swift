/*	FILEPATH = "./LeetCode/150/102_binary_tree_level_order_traversal.swift"
 *	102. Binary Tree Level Order Traversal
	Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

	Example 1:
	Input: root = [3,9,20,null,null,15,7]
	Output: [[3],[9,20],[15,7]]

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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []
        var queue: [TreeNode?] = root != nil ? [root] : []
        var parent_count = root != nil ? 1 : 0
        var child_count = 0
        var array: [Int] = []
        var index = 0
        while parent_count > 0 {
            if let node = queue[index] {
                if node.left != nil {
                    queue.append(node.left)
                    child_count += 1
                }
                if node.right != nil {
                    queue.append(node.right)
                    child_count += 1
                }
                array.append(node.val)
                if array.count == parent_count {
                    res.append(array)
                    array = []
                    parent_count = child_count
                    child_count = 0
                }
                index += 1
            }
        }
        return res
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