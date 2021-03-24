/*	FILEPATH = "./LeetCode/100/82_remove_duplicates_from_sorted_list_ii.swift"
 *	82. Remove Duplicates from Sorted List II
	Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

	Example 1:
	Input: head = [1,2,3,3,4,4,5]
	Output: [1,2,5]

	Example 2:
	Input: head = [1,1,1,2,3]
	Output: [2,3]

	Constraints:
		The number of nodes in the list is in the range [0, 300].
		-100 <= Node.val <= 100
		The list is guaranteed to be sorted in ascending order.
 */

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var new_head: ListNode?
        var new_tail: ListNode?
        var current = head
        var last: ListNode?
        var count = 1
        while current != nil {
            if let _ = last {
                if last!.val == current!.val {
                    count += 1
                } else {
                    if count == 1 {
                        if new_head == nil {
                            new_head = last
                            new_tail = last
                            new_tail?.next = nil
                        } else {
                            new_tail?.next = last
                            new_tail = last
                            new_tail?.next = nil
                        }
                    }
                    count = 1
                }
            }
            last = current
            current = current?.next
        }
        if new_head == nil && count == 1 {
            new_head = last
        }
        if count == 1 {
            new_tail?.next = last
        }
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