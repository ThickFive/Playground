/*  FILEPATH = "./LeetCode/add_two_numbers.swift"
 *  2. Add Two Numbers
    
    You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
    You may assume the two numbers do not contain any leading zero, except the number 0 itself.

    Example 1:
    Input: l1 = [2,4,3], l2 = [5,6,4]
    Output: [7,0,8]
    Explanation: 342 + 465 = 807.
    Example 2:

    Input: l1 = [0], l2 = [0]
    Output: [0]
    Example 3:

    Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
    Output: [8,9,9,9,0,0,0,1]
 */

/**
 *  Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var add = 0
        var _l1 = l1
        var _l2 = l2
        var list: [ListNode] = []
        while _l1 != nil || _l2 != nil {
            let _l1_val = _l1?.val ?? 0
            let _l2_val = _l2?.val ?? 0
            let val = _l1_val + _l2_val + add
            let num = val % 10
            add = val / 10
            list.append(ListNode(num))
            _l1 = _l1?.next
            _l2 = _l2?.next
        }
        if (add == 1) { //  最后还需要进位
            list.append(ListNode(1))
        }
        var head: ListNode?
        for node in list.reversed() {
            node.next = head
            head = node
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
        print(Date(), "TEST START")
        code()
        print(Date(), "TEST END")
    }
}

Test.run {
    let l1 = ListNode(9, ListNode(9))
    let l2 = ListNode(9, ListNode(9, ListNode(9)))
    var res = Solution().addTwoNumbers(l1, l2)
    while res != nil {
        print(res!.val)
        res = res!.next;
    }
}

