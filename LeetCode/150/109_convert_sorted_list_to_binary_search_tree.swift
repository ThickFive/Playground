/*	FILEPATH = "./LeetCode/150/109_convert_sorted_list_to_binary_search_tree.swift"
 *	109. Convert Sorted List to Binary Search Tree
	Given the head of a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
	For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

	Example 1:
	Input: head = [-10,-3,0,5,9]
	Output: [0,-3,9,-10,null,5]
	Explanation: One possible answer is [0,-3,9,-10,null,5], which represents the shown height balanced BST.

	Example 2:
	Input: head = []
	Output: []

	Example 3:
	Input: head = [0]
	Output: [0]

	Example 4:
	Input: head = [1,3]
	Output: [3,1]

	Constraints:
		The number of nodes in head is in the range [0, 2 * 104].
		-10^5 <= Node.val <= 10^5
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var nums: [ListNode] = []
        var curr = head
        while curr != nil {
            nums.append(curr!)
            curr = curr?.next
        }
        return sortedArrayToBST(nums)
    }
    
    func sortedArrayToBST(_ nums: [ListNode]) -> TreeNode? {
        let count = nums.count
        guard count > 0 else {
            return nil
        }
        let root_index = count / 2
        let root = TreeNode(nums[root_index].val)
        root.left = root_index > 0 ? sortedArrayToBST(Array(nums[0..<root_index])) : nil
        root.right = root_index < count - 1 ? sortedArrayToBST(Array(nums[root_index+1..<count])) : nil
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