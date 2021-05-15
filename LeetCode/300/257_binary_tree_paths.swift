/*	FILEPATH = "./LeetCode/300/257_binary_tree_paths.swift"
 *	257. Binary Tree Paths
	Given the root of a binary tree, return all root-to-leaf paths in any order.
	A leaf is a node with no children.

	Example 1:
	Input: root = [1,2,3,null,5]
	Output: ["1->2->5","1->3"]

	Example 2:
	Input: root = [1]
	Output: ["1"]

	Constraints:
		The number of nodes in the tree is in the range [1, 100].
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        var res: [String] = []
        func backtrack(_ path: [TreeNode], _ root: TreeNode) {
            if root.left == nil && root.right == nil {
                res.append(path.map({String($0.val)}).joined(separator: "->"))
            }
            var path = path
            for i in 0..<2 {
                if let node = i == 0 ? root.left : root.right {
                    path.append(node)
                    backtrack(path, node)
                    path.remove(at: path.count - 1)
                } 
            }
        }
        backtrack([root], root)
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