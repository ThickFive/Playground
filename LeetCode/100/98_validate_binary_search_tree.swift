/*	FILEPATH = "./LeetCode/100/98_validate_binary_search_tree.swift"
 *	98. Validate Binary Search Tree
	Given the root of a binary tree, determine if it is a valid binary search tree (BST).
	A valid BST is defined as follows:
		The left subtree of a node contains only nodes with keys less than the node's key.
		The right subtree of a node contains only nodes with keys greater than the node's key.
		Both the left and right subtrees must also be binary search trees.

	Example 1:
	Input: root = [2,1,3]
	Output: true

	Example 2:
	Input: root = [5,1,4,null,null,3,6]
	Output: false
	Explanation: The root node's value is 5 but its right child's value is 4.

	Constraints:
		The number of nodes in the tree is in the range [1, 104].
		-231 <= Node.val <= 231 - 1
 */

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var res = true
        var prev: Int?
        func inorder(_ root: TreeNode?) {
            if root == nil {
                return
            }
            inorder(root?.left)
            if prev != nil {
                if root!.val <= prev! {
                    res = false
                    return
                }
            }
            prev = root!.val
            inorder(root?.right)
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