/*	FILEPATH = "./LeetCode/150/148_sort_list.swift"
 *	148. Sort List
	Given the head of a linked list, return the list after sorting it in ascending order.
	Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?

	Example 1:
	Input: head = [4,2,1,3]
	Output: [1,2,3,4]

	Example 2:
	Input: head = [-1,5,3,4,0]
	Output: [-1,0,3,4,5]

	Example 3:
	Input: head = []
	Output: []

	Constraints:
		The number of nodes in the list is in the range [0, 5 * 104].
		-105 <= Node.val <= 105
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
    func sortList(_ head: ListNode?) -> ListNode? {
        var nodes: [ListNode] = []
        var curr = head
        while curr != nil {
            nodes.append(curr!)
            curr = curr?.next
        }
        nodes.sort(by: {$0.val < $1.val})
        var new_head: ListNode?
        var prev: ListNode?
        for node in nodes {
            if new_head == nil {
                new_head = node
            }
            prev?.next = node
            prev = node
        }
        prev?.next = nil
        return new_head
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