/*	FILEPATH = "./LeetCode/50/24_swap_nodes_in_pairs.swift"
 *	24. Swap Nodes in Pairs
	Given a linked list, swap every two adjacent nodes and return its head.

	Example 1:
	Input: head = [1,2,3,4]
	Output: [2,1,4,3]

	Example 2:
	Input: head = []
	Output: []

	Example 3:
	Input: head = [1]
	Output: [1]

	Constraints:
		The number of nodes in the list is in the range [0, 100].
		0 <= Node.val <= 100
	Follow up: Can you solve the problem without modifying the values in the list's nodes? (i.e., Only nodes themselves may be changed.)
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let res = head?.next
        head?.next = swapPairs(res?.next)
        res?.next = head
        return res
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
    let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
    print(Solution().swapPairs(head)!)
}