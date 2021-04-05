/*	FILEPATH = "./LeetCode/150/129_sum_root_to_leaf_numbers.swift"
 *	129. Sum Root to Leaf Numbers
	You are given the root of a binary tree containing digits from 0 to 9 only.
	Each root-to-leaf path in the tree represents a number.
		For example, the root-to-leaf path 1 -> 2 -> 3 represents the number 123.
	Return the total sum of all root-to-leaf numbers.
	A leaf node is a node with no children.

	Example 1:
	Input: root = [1,2,3]
	Output: 25
	Explanation:
	The root-to-leaf path 1->2 represents the number 12.
	The root-to-leaf path 1->3 represents the number 13.
	Therefore, sum = 12 + 13 = 25.

	Example 2:
	Input: root = [4,9,0,5,1]
	Output: 1026
	Explanation:
	The root-to-leaf path 4->9->5 represents the number 495.
	The root-to-leaf path 4->9->1 represents the number 491.
	The root-to-leaf path 4->0 represents the number 40.
	Therefore, sum = 495 + 491 + 40 = 1026.

	Constraints:
		The number of nodes in the tree is in the range [1, 1000].
		0 <= Node.val <= 9
		The depth of the tree will not exceed 10.
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        func sum_numbers(_ root: TreeNode?, _ sum: Int) {
            guard let root = root else {
                return
            }
            if let left = root.left {
                sum_numbers(root.left, 10 * sum + root.val)
            }
            if let right = root.right {
                sum_numbers(root.right, 10 * sum + root.val)
            }
            if root.left == nil && root.right == nil {
                res += 10 * sum + root.val
            }
        }
        sum_numbers(root, 0)
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