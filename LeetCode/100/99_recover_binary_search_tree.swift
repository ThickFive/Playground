/*	FILEPATH = "./LeetCode/100/99_recover_binary_search_tree.swift"
 *	99. Recover Binary Search Tree
	You are given the root of a binary search tree (BST), where exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.
	Follow up: A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?

	Example 1:
	Input: root = [1,3,null,null,2]
	Output: [3,1,null,null,2]
	Explanation: 3 cannot be a left child of 1 because 3 > 1. Swapping 1 and 3 makes the BST valid.

	Example 2:
	Input: root = [3,1,4,null,null,2]
	Output: [2,1,4,null,null,3]
	Explanation: 2 cannot be in the right subtree of 3 because 2 < 3. Swapping 2 and 3 makes the BST valid.

	Constraints:
		The number of nodes in the tree is in the range [2, 1000].
		-231 <= Node.val <= 231 - 1
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
    func recoverTree(_ root: TreeNode?) {
        var mistake_nodes: [[TreeNode?]] = []
        var prev_node: TreeNode?
        func inorder(_ root: TreeNode?) {
            if (root == nil) {
                return
            }
            inorder(root?.left)
            if prev_node != nil {
                if root!.val <= prev_node!.val {
                    mistake_nodes.append([prev_node, root])
                }
            }
            prev_node = root
            inorder(root?.right)
        }
        inorder(root)
        func swap(_ node1: TreeNode?, _ node2: TreeNode?) {
            let tmp = node1?.val
            node1?.val = node2?.val ?? 0
            node2?.val = tmp ?? 0
        }
        if mistake_nodes.count == 1 {
            swap(mistake_nodes[0][0], mistake_nodes[0][1])
        } else if mistake_nodes.count == 2 {
            swap(mistake_nodes[0][0], mistake_nodes[1][1])
        }
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