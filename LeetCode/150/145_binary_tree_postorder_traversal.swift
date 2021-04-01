/*	FILEPATH = "./LeetCode/150/145_binary_tree_postorder_traversal.swift"
 *	145. Binary Tree Postorder Traversal
	Given the root of a binary tree, return the postorder traversal of its nodes' values.

	Example 1:
	Input: root = [1,null,2,3]
	Output: [3,2,1]

	Example 2:
	Input: root = []
	Output: []

	Example 3:
	Input: root = [1]
	Output: [1]

	Example 4:
	Input: root = [1,2]
	Output: [2,1]

	Example 5:
	Input: root = [1,null,2]
	Output: [2,1]

	Constraints:
		The number of the nodes in the tree is in the range [0, 100].
		-100 <= Node.val <= 100
	Follow up:
	Recursive solution is trivial, could you do it iteratively?
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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        func post_order(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            post_order(root.left)
            post_order(root.right)
            res.append(root.val)
        }
        post_order(root)
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