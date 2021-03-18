/*	FILEPATH = "./LeetCode/50/21_merge_two_sorted_lists.swift"
 *	21. Merge Two Sorted Lists
	Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

	Example 1:
	Input: l1 = [1,2,4], l2 = [1,3,4]
	Output: [1,1,2,3,4,4]

	Example 2:
	Input: l1 = [], l2 = []
	Output: []

	Example 3:
	Input: l1 = [], l2 = [0]
	Output: [0]

	Constraints:
		The number of nodes in both lists is in the range [0, 50].
		-100 <= Node.val <= 100
		Both l1 and l2 are sorted in non-decreasing order.
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
		return "ListNode(val: \(val), next: \(desc))"
	}
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		if l1 == nil { return l2 }
		if l2 == nil { return l1 }
		if l1!.val < l2!.val {
			l1!.next = mergeTwoLists(l1!.next, l2)
			return l1
		} else {
			l2!.next = mergeTwoLists(l2!.next, l1)
			return l2
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
	let l1 = ListNode(1, ListNode(2, ListNode(4)))
	let l2 = ListNode(1, ListNode(3, ListNode(4)))
    print(Solution().mergeTwoLists(l1, l2)!)
}