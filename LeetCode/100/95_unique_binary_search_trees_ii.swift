/*	FILEPATH = "./LeetCode/100/95_unique_binary_search_trees_ii.swift"
 *	95. Unique Binary Search Trees II
	Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

	Example 1:
	Input: n = 3
	Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]

	Example 2:
	Input: n = 1
	Output: [[1]]

	Constraints:
		1 <= n <= 8
 */

/**
 * Definition for a binary tree node.
 */
public class TreeNode: NSObject {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    override public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

    override public var description: String {
        var desc = ""
		desc += left != nil ? String(describing: left!) : "nil"
        desc += ","
        desc += right != nil ? String(describing: right!) : "nil"
        return "(\(val), \(desc))"
	}
}

// 0  = (root, left, right) = 1
// 1  = (0, 0, 0) = 1 * 1
// 2  = (1, 1, 0) + (2 - 1, 0, 1) = 1 + 1 = 2
// 3  = (2, 2, 0) + (2, 1, 1) + (2, 0, 2) = 2 * 1 + 1 * 1 + 1 * 2 = 5
// 4  = (3, 3, 0) + (3, 2, 1) + (3, 1, 2) + (3, 0, 3) = 5 + 2 + 2 + 5 = 14

class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        //  遍历所有不同的组合
        var nums: [Int] = []
        for num in 1...n {
            nums.append(num)
        }

        func copy_nodes(_ node: TreeNode?, _ left: TreeNode?, _ right: TreeNode?) -> TreeNode? {
            if node == nil {
                return nil
            } else {
                let new_node = TreeNode(node!.val)
                new_node.left = copy_nodes(left, left?.left, left?.right)
                new_node.right = copy_nodes(right, right?.left, right?.right)
                return new_node
            }
        }

        func generate_nodes(_ node: TreeNode?, _ left: [TreeNode?], _ right: [TreeNode?]) -> [TreeNode?] {
            let left_count = left.count > 0 ? left.count : 1
            let right_count = right.count > 0 ? right.count : 1
            var res: [TreeNode?] = []
            for i in 0..<left_count {
                let left_node = left.count > 0 ? left[i] : nil
                for j in 0..<right_count {
                    let right_node = right.count > 0 ? right[j] : nil
                    res.append(copy_nodes(node, left_node, right_node))
                }
            }
            return res
        }

        func nodes(_ nums: [Int]) -> [TreeNode?] {
            if nums.count == 0 {
                return []
            }
            var res: [TreeNode?] = []
            for (i, num) in nums.enumerated() {
                let node = TreeNode(num)
                let left_nodes = i > 0 ? nodes(Array(nums[0..<i])) : nodes([])
                let right_nodes = i < nums.count - 1 ? nodes(Array(nums[i+1...nums.count - 1])) : nodes([])
                res += generate_nodes(node, left_nodes, right_nodes)
            }
            return res
        }
        
        return nodes(nums)
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
    print(Solution().generateTrees(3))
}