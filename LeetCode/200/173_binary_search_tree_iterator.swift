/*	FILEPATH = "./LeetCode/200/173_binary_search_tree_iterator.swift"
 *	173. Binary Search Tree Iterator
	Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):
		BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
		boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
		int next() Moves the pointer to the right, then returns the number at the pointer.
	Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.
	You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.

	Example 1:
	Input
	["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
	[[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
	Output
	[null, 3, 7, true, 9, true, 15, true, 20, false]
	Explanation
	BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
	bSTIterator.next();    // return 3
	bSTIterator.next();    // return 7
	bSTIterator.hasNext(); // return True
	bSTIterator.next();    // return 9
	bSTIterator.hasNext(); // return True
	bSTIterator.next();    // return 15
	bSTIterator.hasNext(); // return True
	bSTIterator.next();    // return 20
	bSTIterator.hasNext(); // return False

	Constraints:
		The number of nodes in the tree is in the range [1, 105].
		0 <= Node.val <= 106
		At most 105 calls will be made to hasNext, and next.
	Follow up:
		Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?
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

//  只添加左节点 O(logn)
class BSTIterator {
    var nodes: [TreeNode] = []
    
    init(_ root: TreeNode?) {
        left_nodes(root)
    }
    
    func next() -> Int {
        let index = nodes.count - 1
        let node = nodes[index]
        nodes.remove(at: index)
        left_nodes(node.right)
        return node.val
    }
    
    func hasNext() -> Bool {
        return nodes.count > 0
    }
    
    func left_nodes(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        nodes.append(root)
        left_nodes(root.left)
    }
}
​
//  中序遍历, O(n)
class BSTIterator {
    var nodes: [TreeNode] = []
    var index: Int = -1
    
    init(_ root: TreeNode?) {
        mid_order(root)
    }
    
    func next() -> Int {
        index += 1
        return nodes[index].val
    }
    
    func hasNext() -> Bool {
        return index < nodes.count - 1
    }
    
    func mid_order(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        mid_order(root.left)
        nodes.append(root)
        mid_order(root.right)
    }
}
​
/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */

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