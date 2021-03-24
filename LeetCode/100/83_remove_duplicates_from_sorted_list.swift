/*	FILEPATH = "./LeetCode/100/83_remove_duplicates_from_sorted_list.swift"
 *	83. Remove Duplicates from Sorted List
	Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

	Example 1:
	Input: head = [1,1,2]
	Output: [1,2]

	Example 2:
	Input: head = [1,1,2,3,3]
	Output: [1,2,3]

	Constraints:
		The number of nodes in the list is in the range [0, 300].
		-100 <= Node.val <= 100
		The list is guaranteed to be sorted in ascending order.
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        var last: ListNode?
        while current != nil {
            if last != nil && current!.val == last!.val {
                last?.next = current?.next
            } else {
                last = current
            }
            current = current?.next
        }
        return head
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