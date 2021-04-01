/*	FILEPATH = "./LeetCode/150/112_path_sum.swift"
 *	112. Path Sum
	Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.
	A leaf is a node with no children.

	Example 1:
	Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
	Output: true

	Example 2:
	Input: root = [1,2,3], targetSum = 5
	Output: false

	Example 3:
	Input: root = [1,2], targetSum = 0
	Output: false

	Constraints:
		The number of nodes in the tree is in the range [0, 5000].
		-1000 <= Node.val <= 1000
		-1000 <= targetSum <= 1000
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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        if root.val == targetSum && root.left == nil && root.right == nil {
            return true
        }
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
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