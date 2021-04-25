/*	FILEPATH = "./LeetCode/250/230_kth_smallest_element_in_a_bst.swift"
 *	230. Kth Smallest Element in a BST
	Given the root of a binary search tree, and an integer k, return the kth (1-indexed) smallest element in the tree.

	Example 1:
	Input: root = [3,1,4,null,2], k = 1
	Output: 1

	Example 2:
	Input: root = [5,3,6,2,4,null,null,1], k = 3
	Output: 3

	Constraints:
		The number of nodes in the tree is n.
		1 <= k <= n <= 104
		0 <= Node.val <= 104
	Follow up: If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        return tree_to_array(root)[k - 1]
    }
    
    func tree_to_array(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        return tree_to_array(root.left) + [root.val] + tree_to_array(root.right)
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