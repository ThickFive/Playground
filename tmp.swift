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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        let left_height = height_of_tree(root.left)
        let right_height = height_of_tree(root.right)
        return abs(left_height - right_height) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    func height_of_tree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(height_of_tree(root.left), height_of_tree(root.right)) + 1
    }
}