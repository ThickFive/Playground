/*	FILEPATH = "./LeetCode/200/199_binary_tree_right_side_view.swift"
 *	199. Binary Tree Right Side View
	Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

	Example 1:
	Input: root = [1,2,3,null,5,null,4]
	Output: [1,3,4]

	Example 2:
	Input: root = [1,null,3]
	Output: [1,3]

	Example 3:
	Input: root = []
	Output: []

	Constraints:
		The number of nodes in the tree is in the range [0, 100].
		-100 <= Node.val <= 100
 */

/**
   Definition for a binary tree node.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res: [Int] = []
        var queue: [TreeNode] = [root]
        while queue.count > 0 {
            res.append(queue[0].val)
            var list: [TreeNode] = []
            for node in queue {
                if let right = node.right {
                    list.append(right)
                }
                if let left = node.left {
                    list.append(left)
                }
            }
            queue = list
        }
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
    func build_tree_from_level_order(_ nums: [Int?]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        let root = TreeNode(nums[0]!)
        var queue: [TreeNode] = [root]
        var index = 0
        while queue.count > 0 {
            var list: [TreeNode] = []
            for node in queue {
                index += 1
                if index < nums.count, let val = nums[index] {
                    let left = TreeNode(val)
                    node.left = left
                    list.append(left)
                }
                index += 1
                if index < nums.count, let val = nums[index] {
                    let right = TreeNode(val)
                    node.right = right
                    list.append(right)
                }
            }
            queue = list
        }
        return root
    }
    var root: TreeNode?
    root = build_tree_from_level_order([1,2,3,nil,5,nil,4])
    print(Solution().rightSideView(root))
    root = build_tree_from_level_order([1,nil,3])
    print(Solution().rightSideView(root))
    root = build_tree_from_level_order([])
    print(Solution().rightSideView(root))
}