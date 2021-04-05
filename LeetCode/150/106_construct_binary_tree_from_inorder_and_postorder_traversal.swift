/*	FILEPATH = "./LeetCode/150/106_construct_binary_tree_from_inorder_and_postorder_traversal.swift"
 *	106. Construct Binary Tree from Inorder and Postorder Traversal
	Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

	Example 1:
	Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
	Output: [3,9,20,null,null,15,7]

	Example 2:
	Input: inorder = [-1], postorder = [-1]
	Output: [-1]

	Constraints:
		1 <= inorder.length <= 3000
		postorder.length == inorder.length
		-3000 <= inorder[i], postorder[i] <= 3000
		inorder and postorder consist of unique values.
		Each value of postorder also appears in inorder.
		inorder is guaranteed to be the inorder traversal of the tree.
		postorder is guaranteed to be the postorder traversal of the tree.
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
​
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard postorder.count > 0 else {
            return nil
        }
        let total_count = postorder.count
        let root = TreeNode(postorder[total_count - 1])
        var root_index = -1
        for (i, val) in inorder.enumerated() {
            if val == root.val {
                root_index = i
                break
            } 
        }
        let left_count = root_index
        let right_count = total_count - left_count - 1
        root.left = buildTree(Array(inorder[0..<left_count]), Array(postorder[0..<left_count]))
        root.right = buildTree(Array(inorder[1+left_count..<total_count]), Array(postorder[left_count..<total_count-1]))
        return root
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