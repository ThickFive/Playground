/*	FILEPATH = "./LeetCode/50/19_remove_nth_node_from_end_of_list.swift"
 *	19. Remove Nth Node From End of List
	Given the head of a linked list, remove the nth node from the end of the list and return its head.
	Follow up: Could you do this in one pass?

	Example 1:
	Input: head = [1,2,3,4,5], n = 2
	Output: [1,2,3,5]

	Example 2:
	Input: head = [1], n = 1
	Output: []

	Example 3:
	Input: head = [1,2], n = 1
	Output: [1]

	Constraints:
		The number of nodes in the list is sz.
		1 <= sz <= 30
		0 <= Node.val <= 100
		1 <= n <= sz
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
		// return "ListNode(val: \(val), next: \(desc))"
        return "\(val), \(desc)"
	}
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var slow = head
        var count = n
        while count > 0 {
            count -= 1
            fast = fast?.next
        }
        if fast == nil {    //  移除第一个
            return head?.next
        }
        while slow != nil && fast != nil {
            if fast?.next == nil {   //  end
                slow?.next = slow?.next?.next
            }
            slow = slow?.next
            fast = fast?.next
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
    var head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
    print(Solution().removeNthFromEnd(head, 5))
    head = ListNode(1)
    print(Solution().removeNthFromEnd(head, 1))
    head = ListNode(1, ListNode(2))
    print(Solution().removeNthFromEnd(head, 1))
}