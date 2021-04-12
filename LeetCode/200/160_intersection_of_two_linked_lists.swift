/*	FILEPATH = "./LeetCode/200/160_intersection_of_two_linked_lists.swift"
 *	160. Intersection of Two Linked Lists
	Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.
	For example, the following two linked lists begin to intersect at node c1:
	It is guaranteed that there are no cycles anywhere in the entire linked structure.
	Note that the linked lists must retain their original structure after the function returns.

	Example 1:
	Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
	Output: Intersected at '8'
	Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect).
	From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.

	Example 2:
	Input: intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
	Output: Intersected at '2'
	Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect).
	From the head of A, it reads as [1,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.

	Example 3:
	Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
	Output: No intersection
	Explanation: From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5]. Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
	Explanation: The two lists do not intersect, so return null.

	Constraints:
		The number of nodes of listA is in the m.
		The number of nodes of listB is in the n.
		0 <= m, n <= 3   104
		1 <= Node.val <= 105
		0 <= skipA <= m
		0 <= skipB <= n
		intersectVal is 0 if listA and listB do not intersect.
		intersectVal == listA[skipA + 1] == listB[skipB + 1] if listA and listB intersect.
	Follow up: Could you write a solution that runs in O(n) time and use only O(1) memory?
 */

/**
 *  Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        //  计算两条链的长度
        let countA = length_of_list(headA)
        let countB = length_of_list(headB)
        var head_a = headA
        var head_b = headB
        if countA < countB {
            head_a = headB
            head_b = headA
        }
        //  让长链先走 abs(countA - countB) 步骤
        var step = 0
        while step < abs(countA - countB) {
            head_a = head_a?.next
            step += 1
        }
        //  然后两条链同时走, 判断两个节点是否相等即可
        while head_a != nil {
            if head_a === head_b {
                break
            }
            head_a = head_a?.next
            head_b = head_b?.next
        }
        return head_a
    }
    
    func length_of_list(_ head: ListNode?) -> Int {
        var count = 0
        var curr = head
        while curr != nil {
            count += 1
            curr = curr?.next
        }
        return count
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