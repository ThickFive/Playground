/*	FILEPATH = "./LeetCode/250/234_palindrome_linked_list.swift"
 *	234. Palindrome Linked List
	Given the head of a singly linked list, return true if it is a palindrome.

	Example 1:
	Input: head = [1,2,2,1]
	Output: true

	Example 2:
	Input: head = [1,2]
	Output: false

	Constraints:
		The number of nodes in the list is in the range [1, 105].
		0 <= Node.val <= 9
	Follow up: Could you do it in O(n) time and O(1) space?
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
​
//  wrong answer, e.g. [1,3,0,2] 1^3^0^2 == 2^0^2 == 0
class Solution0 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var count = 0
        var curr = head
        while curr != nil {
            count += 1
            curr = curr?.next
        }
        var res = 0
        var index = 0
        curr = head
        while curr != nil {
            if count % 2 == 1 && index == count / 2 {
                //  skip
            } else {
                res ^= curr!.val
            }
            index += 1
            curr = curr?.next
        }
        return res == 0
    }
}

//  T(n), S(n)
class Solution1 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var nodes: [ListNode] = []
        var curr = head
        while let node = curr {
            nodes.append(node)
            curr = node.next
        }
        for i in 0..<nodes.count / 2 {
            if nodes[i].val != nodes[nodes.count - 1 - i].val {
                return false
            }
        }
        return true
    }
}

//  T(n), S(1), 从中间将链表分为2部分, 后半部分翻转, 比较两部分是否相同
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var tail: ListNode?
        var count = 0
        var curr = head
        while curr != nil {
            count += 1
            if curr?.next == nil {
                tail = curr
            }
            curr = curr?.next
        }
        
        var prev: ListNode?
        var next: ListNode?
        var index = 0
        curr = head
        while curr != nil {
            if index >= count / 2 {
                next = curr?.next
                curr?.next = prev
                prev = curr
                curr = next
            } else {
                curr = curr?.next
            }
            index += 1
        }
        
        var head = head
        while head != nil && tail != nil {
            if head!.val != tail!.val {
                return false
            }
            head = head?.next
            tail = tail?.next
        }
        return true
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