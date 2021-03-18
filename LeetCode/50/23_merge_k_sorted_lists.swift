/*	FILEPATH = "./LeetCode/50/23_merge_k_sorted_lists.swift"
 *	23. Merge k Sorted Lists
	You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
	Merge all the linked-lists into one sorted linked-list and return it.

	Example 1:
	Input: lists = [[1,4,5],[1,3,4],[2,6]]
	Output: [1,1,2,3,4,4,5,6]
	Explanation: The linked-lists are:
	[
	  1->4->5,
	  1->3->4,
	  2->6
	]
	merging them into one sorted list:
	1->1->2->3->4->4->5->6

	Example 2:
	Input: lists = []
	Output: []

	Example 3:
	Input: lists = [[]]
	Output: []

	Constraints:
		k == lists.length
		0 <= k <= 10^4
		0 <= lists[i].length <= 500
		-10^4 <= lists[i][j] <= 10^4
		lists[i] is sorted in ascending order.
		The sum of lists[i].length won't exceed 10^4.
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var res: ListNode?
        for list in lists {
            res = mergeTwoLists(res, list)
        }
        return res
    }

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        if l1!.val < l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l2?.next, l1)
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
    
}