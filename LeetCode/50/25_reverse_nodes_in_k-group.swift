/*	FILEPATH = "./LeetCode/50/25_reverse_nodes_in_k-group.swift"
 *	25. Reverse Nodes in k-Group
	Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
	k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.
	Follow up:
		Could you solve the problem in O(1) extra memory space?
		You may not alter the values in the list's nodes, only nodes itself may be changed.

	Example 1:
	Input: head = [1,2,3,4,5], k = 2
	Output: [2,1,4,3,5]

	Example 2:
	Input: head = [1,2,3,4,5], k = 3
	Output: [3,2,1,4,5]

	Example 3:
	Input: head = [1,2,3,4,5], k = 1
	Output: [1,2,3,4,5]

	Example 4:
	Input: head = [1], k = 1
	Output: [1]

	Constraints:
		The number of nodes in the list is in the range sz.
		1 <= sz <= 5000
		0 <= Node.val <= 1000
		1 <= k <= sz
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var tmp1: ListNode? = head
        for _ in 0..<k-1 {
            tmp1 = tmp1?.next
        }
        if tmp1 == nil { //  长度小于 k 不交换
            return head
        } else {    //  将前 k 个元素交换
            var current: ListNode?
            var tmp2: ListNode?
            for _ in 0..<k {
                if current == nil {
                    current = head?.next
                    head?.next = reverseKGroup(tmp1?.next, k)
                    tmp1 = head
                } else {
                    tmp2 = current?.next
                    current?.next = tmp1
                    tmp1 = current
                    current = tmp2
                }
            }
            return tmp1
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
    let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
    print(Solution().reverseKGroup(head, 4)!)
}