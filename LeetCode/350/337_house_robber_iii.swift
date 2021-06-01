/*	FILEPATH = "./LeetCode/350/337_house_robber_iii.swift"
 *	337. House Robber III
	The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.
	Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.
	Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

	Example 1:
	Input: root = [3,2,3,null,3,null,1]
	Output: 7
	Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.

	Example 2:
	Input: root = [3,4,5,1,3,null,1]
	Output: 9
	Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.

	Constraints:
		The number of nodes in the tree is in the range [1, 104].
		0 <= Node.val <= 104
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

//  O(4^log2(n)) = O(n^2)
class Solution0 {
    func rob(_ root: TreeNode?) -> Int {
        return rob(root, false)
    }
    
    func rob(_ root: TreeNode?, _ parent: Bool) -> Int {
        guard let root = root else {
            return 0
        }
        if parent {
            return rob(root.left, false) + rob(root.right, false)
        } else {
            return max(root.val + rob(root.left, true) + rob(root.right, true), rob(root.left, false) + rob(root.right, false))
        }
    }
}

//  O(n)
class Solution {
    func rob(_ root: TreeNode?) -> Int {
        let res = rob_or_not(root)
        return max(res.rob, res.not)
    }
    
    func rob_or_not(_ root: TreeNode?) -> (rob: Int, not: Int) {
        guard let root = root else {
            return (0, 0)
        }
        let lhs = rob_or_not(root.left)
        let rhs = rob_or_not(root.right)
        return (root.val + lhs.not + rhs.not, max(lhs.rob, lhs.not) + max(rhs.rob, rhs.not))
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

func build_tree_from_level_order(_ nums: [Int?]) -> TreeNode? {
    guard nums.count > 0, let num0 = nums[0] else {
        return nil
    }
    let root = TreeNode(num0)
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

Test.run {
    var root: TreeNode?
    root = build_tree_from_level_order([3,2,3,nil,3,nil,1])
    print(Solution().rob(root))
    root = build_tree_from_level_order([3,4,5,1,3,nil,1])
    print(Solution().rob(root))
}

Test.run {
    var nums: [Int?] = []
    for i in 0..<10000 {
        nums.append(i)
        nums.append(nil)
    }
    let root = build_tree_from_level_order(nums)
    print(Solution().rob(root))
}