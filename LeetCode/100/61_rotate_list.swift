/*	FILEPATH = "./LeetCode/100/61_rotate_list.swift"
 *	61. Rotate List
	Given the head of a linked list, rotate the list to the right by k places.

	Example 1:
	Input: head = [1,2,3,4,5], k = 2
	Output: [4,5,1,2,3]

	Example 2:
	Input: head = [0,1,2], k = 4
	Output: [2,0,1]

	Constraints:
		The number of nodes in the list is in the range [0, 500].
		-100 <= Node.val <= 100
		0 <= k <= 2 * 109
 */

/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var length = 0
        var current = head
        var tail = head
        while current != nil {
            length += 1
            if current != nil {
                tail = current
            }
            current = current?.next
        }
        if length <= 1 || k % length == 0 {
            return head
        }
        let count = k % length
        var new_tail = head
        var new_head = head
        for i in 0..<length - count {
            new_tail = new_head
            new_head = new_head?.next
        }
        new_tail?.next = nil
        tail?.next = head
        return new_head
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