/*	FILEPATH = "./LeetCode/150/143_reorder_list.swift"
 *	143. Reorder List
	You are given the head of a singly linked-list. The list can be represented as:
	L0 → L1 → … → Ln - 1 → Ln
	Reorder the list to be on the following form:
	L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
	You may not modify the values in the list's nodes. Only nodes themselves may be changed.

	Example 1:
	Input: head = [1,2,3,4]
	Output: [1,4,2,3]

	Example 2:
	Input: head = [1,2,3,4,5]
	Output: [1,5,2,4,3]

	Constraints:
		The number of nodes in the list is in the range [1, 5 * 104].
		1 <= Node.val <= 1000
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
class Solution {
    func reorderList(_ head: ListNode?) {
        var nodes: [ListNode?] = []
        var curr = head
        while curr != nil {
            nodes.append(curr)
            curr = curr?.next
        }
        var prev: ListNode?
        for i in 0..<nodes.count {
            let index = i % 2 == 0 ? i / 2 : nodes.count - 1 - i / 2
            let node = nodes[index]
            prev?.next = node
            prev = node
        }
        prev?.next = nil
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