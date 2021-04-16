/*	FILEPATH = "./LeetCode/250/226_invert_binary_tree.swift"
 *	226. Invert Binary Tree
	Given the root of a binary tree, invert the tree, and return its root.

	Example 1:
	Input: root = [4,2,7,1,3,6,9]
	Output: [4,7,2,9,6,3,1]

	Example 2:
	Input: root = [2,1,3]
	Output: [2,3,1]

	Example 3:
	Input: root = []
	Output: []

	Constraints:
		The number of nodes in the tree is in the range [0, 100].
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        let left = root.left
        let right = root.right
        root.left = invertTree(right)
        root.right = invertTree(left)
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