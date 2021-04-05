/*	FILEPATH = "./LeetCode/150/110_balanced_binary_tree.swift"
 *	110. Balanced Binary Tree
	Given a binary tree, determine if it is height-balanced.
	For this problem, a height-balanced binary tree is defined as:
	a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

	Example 1:
	Input: root = [3,9,20,null,null,15,7]
	Output: true

	Example 2:
	Input: root = [1,2,2,3,3,null,null,4,4]
	Output: false

	Example 3:
	Input: root = []
	Output: true

	Constraints:
		The number of nodes in the tree is in the range [0, 5000].
		-104 <= Node.val <= 104
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        let left_height = height_of_tree(root.left, 0)
        let right_height = height_of_tree(root.right, 0)
        return abs(left_height - right_height) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    func height_of_tree(_ root: TreeNode?, _ height: Int) -> Int {
        guard let root = root else {
            return height
        }
        return max(height_of_tree(root.left, height + 1), height_of_tree(root.right, height + 1) )
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