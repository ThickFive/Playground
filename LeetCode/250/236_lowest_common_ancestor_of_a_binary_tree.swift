/*	FILEPATH = "./LeetCode/250/236_lowest_common_ancestor_of_a_binary_tree.swift"
 *	236. Lowest Common Ancestor of a Binary Tree
	Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
	According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

	Example 1:
	Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
	Output: 3
	Explanation: The LCA of nodes 5 and 1 is 3.

	Example 2:
	Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
	Output: 5
	Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.

	Example 3:
	Input: root = [1,2], p = 1, q = 2
	Output: 1

	Constraints:
		The number of nodes in the tree is in the range [2, 105].
		-109 <= Node.val <= 109
		All Node.val are unique.
		p != q
		p and q will exist in the tree.
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

//  回溯遍历二叉树, 找到 p, q 两个节点及其所有父节点
extension TreeNode: Hashable {
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
}

class Solution0 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var path_p: [TreeNode?] = []
        var path_q: [TreeNode?] = []
        func traverse_binary_tree(_ path: [TreeNode?], _ root: TreeNode?) {
            if path_p.count > 0 && path_q.count > 0 {
                return
            }
            if root === p {
                path_p = path
            }
            if root === q {
                path_q = path
            }
            var path = path
            for i in 0..<2 {
                let node = i == 0 ? root?.left : root?.right
                if node == nil {
                    continue
                }
                path.append(node)
                traverse_binary_tree(path, node)
                path.remove(at: path.count - 1)
            }
        }
        traverse_binary_tree([root], root)
        let set_path_p = Set(path_p)
        for node in path_q.reversed() {
            if set_path_p.contains(node) {
                return node
            }
        }
        return nil
    }
}

//  利用带有 parent 的类重建二叉树
class Node {
    var node: TreeNode
    var parent: Node?
    var left: Node?
    var right: Node?
    init(_ node: TreeNode) {
        self.node = node
    }
}

extension Node: Hashable {
    public static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.node.val == rhs.node.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.node.val)
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var node_p: Node?
        var node_q: Node?
        func rebuild_binary_tree(_ root: TreeNode?, _ parent: Node?) -> Node? {
            guard let root = root else {
                return nil
            }
            let _root = Node(root)
            _root.parent = parent
            _root.left = rebuild_binary_tree(root.left, _root)
            _root.right = rebuild_binary_tree(root.right, _root)
            if p === root {
                node_p = _root
            }
            if q === root {
                node_q = _root
            }
            return _root
        }
        rebuild_binary_tree(root, nil)
        var set: Set<Node?> = []
        var curr = node_p
        while curr != nil {
            set.insert(curr)
            curr = curr?.parent
        }
        curr = node_q
        while curr != nil {
            if set.contains(curr) {
                return curr?.node
            }
            curr = curr?.parent
        }
        return nil
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