/*	FILEPATH = "./LeetCode/150/117_populating_next_right_pointers_in_each_node_ii.swift"
 *	117. Populating Next Right Pointers in Each Node II
	Given a binary tree
	struct Node {
	  int val;
	  Node *left;
	  Node *right;
	  Node *next;
	}
	Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
	Initially, all next pointers are set to NULL.
	Follow up:
		You may only use constant extra space.
		Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.

	Example 1:
	Input: root = [1,2,3,4,5,null,7]
	Output: [1,#,2,3,#,4,5,7,#]
	Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.

	Constraints:
		The number of nodes in the given tree is less than 6000.
		-100 <= node.val <= 100
 */

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */
​
class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        var queue: [Node] = [root]
        while queue.count > 0 {
            var level: [Node] = []
            var prev: Node?
            for node in queue {
                if let left = node.left {
                    level.append(left)
                }
                if let right = node.right {
                    level.append(right)
                }
                if prev != nil {
                    prev?.next = node
                }
                prev = node
            }
            queue = level
        }
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