/*	FILEPATH = "./LeetCode/150/104_maximum_depth_of_binary_tree.swift"
 *	104. Maximum Depth of Binary Tree
	Given the root of a binary tree, return its maximum depth.
	A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

	Example 1:
	Input: root = [3,9,20,null,null,15,7]
	Output: 3

	Example 2:
	Input: root = [1,null,2]
	Output: 2

	Example 3:
	Input: root = []
	Output: 0

	Example 4:
	Input: root = [0]
	Output: 1

	Constraints:
		The number of nodes in the tree is in the range [0, 104].
		-100 <= Node.val <= 100
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
    func maxDepth(_ root: TreeNode?) -> Int {
        func max_depth(_ root: TreeNode?, _ level: Int) -> Int {
            if root == nil {
                return level
            } else {
                return max(max_depth(root?.left, level + 1), max_depth(root?.right, level + 1))
            }
        }
        return max_depth(root, 0)
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