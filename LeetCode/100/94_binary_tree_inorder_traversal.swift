/*	FILEPATH = "./LeetCode/100/94_binary_tree_inorder_traversal.swift"
 *	94. Binary Tree Inorder Traversal
	Given the root of a binary tree, return the inorder traversal of its nodes' values.

	Example 1:
	Input: root = [1,null,2,3]
	Output: [1,3,2]

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
	Output: [1,2]

	Constraints:
		The number of nodes in the tree is in the range [0, 100].
		-100 <= Node.val <= 100
	Follow up:
	Recursive solution is trivial, could you do it iteratively?
 */

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        func inorder(_ node: TreeNode?) {
            if node == nil {
                return
            } 
            inorder(node!.left)
            res.append(node!.val)
            inorder(node!.right)
        }
        inorder(root)
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