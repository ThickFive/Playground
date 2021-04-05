/*	FILEPATH = "./LeetCode/150/114_flatten_binary_tree_to_linked_list.swift"
 *	114. Flatten Binary Tree to Linked List
	Given the root of a binary tree, flatten the tree into a "linked list":
		The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
		The "linked list" should be in the same order as a pre-order traversal of the binary tree.

	Example 1:
	Input: root = [1,2,5,3,4,null,6]
	Output: [1,null,2,null,3,null,4,null,5,null,6]

	Example 2:
	Input: root = []
	Output: []

	Example 3:
	Input: root = [0]
	Output: [0]

	Constraints:
		The number of nodes in the tree is in the range [0, 2000].
		-100 <= Node.val <= 100
	Follow up: Can you flatten the tree in-place (with O(1) extra space)?
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
    func flatten(_ root: TreeNode?) {
        var tail: TreeNode?
        func pre_order(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            let left = root.left
            let right = root.right
            if tail == nil {
                tail = root
            } else {
                tail?.right = root
            }
            tail?.left = nil
            tail = root
            pre_order(left)
            pre_order(right)
        }
        pre_order(root)
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