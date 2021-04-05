/*	FILEPATH = "./LeetCode/150/124_binary_tree_maximum_path_sum.swift"
 *	124. Binary Tree Maximum Path Sum
	A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.
	The path sum of a path is the sum of the node's values in the path.
	Given the root of a binary tree, return the maximum path sum of any path.

	Example 1:
	Input: root = [1,2,3]
	Output: 6
	Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.

	Example 2:
	Input: root = [-10,9,20,null,null,15,7]
	Output: 42
	Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.

	Constraints:
		The number of nodes in the tree is in the range [1, 3 * 104].
		-1000 <= Node.val <= 1000
 */

 class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var val_left_right_list: [[Int]] = []
        func max_single_path_sum(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            let max_left = max_single_path_sum(root.left)
            let max_right = max_single_path_sum(root.right)
            var max_val = root.val
            max_val += max(max_left, max_right, 0)
            val_left_right_list.append([root.val, max_left, max_right])
            return max_val
        }
        _ = max_single_path_sum(root)
        var max_sum = Int.min
        for val_left_right in val_left_right_list {
            var sum = val_left_right[0]
            sum += max(val_left_right[1], 0)
            sum += max(val_left_right[2], 0)
            max_sum = max(sum, max_sum)
        }
        return max_sum
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