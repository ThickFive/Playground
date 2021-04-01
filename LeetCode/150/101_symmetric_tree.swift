/*	FILEPATH = "./LeetCode/150/101_symmetric_tree.swift"
 *	101. Symmetric Tree
	Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

	Example 1:
	Input: root = [1,2,2,3,4,4,3]
	Output: true

	Example 2:
	Input: root = [1,2,2,null,3,null,3]
	Output: false

	Constraints:
		The number of nodes in the tree is in the range [1, 1000].
		-100 <= Node.val <= 100
	Follow up: Could you solve it both recursively and iteratively?
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue0: [TreeNode?] = [root]
        var queue1: [TreeNode?] = []
        while queue0.count > 0 {
            var count = queue0.count
            for i in 0..<count {
                let left = queue0[i]
                let right = queue0[count - 1 - i]
                if left != nil && right != nil && left!.val != right!.val {
                    return false
                }
                if left != nil && right == nil {
                    return false
                }
                if left == nil && right != nil {
                    return false
                }
                if left != nil {
                    queue1.append(queue0[i]?.left) 
                    queue1.append(queue0[i]?.right) 
                }
            }
            queue0 = queue1
            queue1 = []
        }
        return true
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