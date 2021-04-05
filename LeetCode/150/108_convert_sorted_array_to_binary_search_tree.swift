/*	FILEPATH = "./LeetCode/150/108_convert_sorted_array_to_binary_search_tree.swift"
 *	108. Convert Sorted Array to Binary Search Tree
	Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.
	A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

	Example 1:
	Input: nums = [-10,-3,0,5,9]
	Output: [0,-3,9,-10,null,5]
	Explanation: [0,-10,5,null,-3,null,9] is also accepted:

	Example 2:
	Input: nums = [1,3]
	Output: [3,1]
	Explanation: [1,3] and [3,1] are both a height-balanced BSTs.

	Constraints:
		1 <= nums.length <= 104
		-104 <= nums[i] <= 104
		nums is sorted in a strictly increasing order.
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let count = nums.count
        guard count > 0 else {
            return nil
        }
        let root_index = count / 2
        let root = TreeNode(nums[root_index])
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