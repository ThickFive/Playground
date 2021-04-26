/*	FILEPATH = "./Base/build_tree_from_level_order.swift"
 *	Build Tree From Level Order
 */

/**
 * Definition for a binary tree node.
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
    var root: TreeNode?
    root = build_tree_from_level_order([1,2,3,nil,5,nil,4])
    root = build_tree_from_level_order([1,nil,3])
    root = build_tree_from_level_order([])
}