/*	FILEPATH = "./LeetCode/100/92_reverse_linked_list_ii.swift"
 *	92. Reverse Linked List II
	Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

	Example 1:
	Input: head = [1,2,3,4,5], left = 2, right = 4
	Output: [1,4,3,2,5]

	Example 2:
	Input: head = [5], left = 1, right = 1
	Output: [5]

	Constraints:
		The number of nodes in the list is n.
		1 <= n <= 500
		-500 <= Node.val <= 500
		1 <= left <= right <= n
	Follow up: Could you do it in one pass?
 */

/**
 *  Definition for singly-linked list.
 */
public class ListNode: NSObject {
    public var val: Int
    public var next: ListNode?
    override public init() { self.val = 0; self.next = nil; super.init()}
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
	override public var description: String {
		let desc = next != nil ? String(describing: next!) : "nil"
        return "\(val), \(desc)"
	}
}

class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        //  左侧部分
        var left_head = head
        var left_tail: ListNode?
        var current = head
        var index = 1
        while index < left {
            left_tail = current
            current = current?.next
            index += 1 
        }
        //  中间部分
        var mid_tail = current
        var node0: ListNode? = current
        var node1: ListNode? = node0?.next
        var node2: ListNode? = node1?.next
        while index < right {
            node1?.next = node0
            node0 = node1
            node1 = node2
            node2 = node2?.next
            index += 1
        }
        //  右侧部分
        if left_tail == nil {
            mid_tail?.next = node1
            return node0
        } else {
            left_tail?.next = node0
            mid_tail?.next = node1
            return left_head
        }
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