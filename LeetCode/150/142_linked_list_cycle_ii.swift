/*	FILEPATH = "./LeetCode/150/142_linked_list_cycle_ii.swift"
 *	142. Linked List Cycle II
	Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
	There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
	Notice that you should not modify the linked list.

	Example 1:
	Input: head = [3,2,0,-4], pos = 1
	Output: tail connects to node index 1
	Explanation: There is a cycle in the linked list, where tail connects to the second node.

	Example 2:
	Input: head = [1,2], pos = 0
	Output: tail connects to node index 0
	Explanation: There is a cycle in the linked list, where tail connects to the first node.

	Example 3:
	Input: head = [1], pos = -1
	Output: no cycle
	Explanation: There is no cycle in the linked list.

	Constraints:
		The number of the nodes in the list is in the range [0, 104].
		-105 <= Node.val <= 105
		pos is -1 or a valid index in the linked-list.
	Follow up: Can you solve it using O(1) (i.e. constant) memory?
 */

/**
 * Definition for singly-linked list.
 */
public class ListNode: NSObject {
	public var val: Int
	public var next: ListNode?
	public init(_ val: Int) {
		self.val = val
		self.next = nil
	}
}

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next
        var nodes = Set<ListNode>()
        var count = 0
        while slow != nil && count < 2 {
            if slow === fast {
                count += 1
            }
            if count == 1 {
                nodes.insert(slow!)
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        if nodes.count > 0 {
            var current = head
            while current != nil {
                if nodes.contains(current!) {
                    return current
                }
                current = current?.next
            }
        }
		return nil
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
    let node1 = ListNode(3)
	let node2 = ListNode(2)
	let node3 = ListNode(0)
	let node4 = ListNode(-4)
	node1.next = node2
	node2.next = node3
	node3.next = node4
	node4.next = node2
	print(Solution().detectCycle(node1)!)
}