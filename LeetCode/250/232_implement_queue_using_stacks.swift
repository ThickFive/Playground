/*	FILEPATH = "./LeetCode/250/232_implement_queue_using_stacks.swift"
 *	232. Implement Queue using Stacks
	Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (push, peek, pop, and empty).
	Implement the MyQueue class:
		void push(int x) Pushes element x to the back of the queue.
		int pop() Removes the element from the front of the queue and returns it.
		int peek() Returns the element at the front of the queue.
		boolean empty() Returns true if the queue is empty, false otherwise.
	Notes:
		You must use only standard operations of a stack, which means only push to top, peek/pop from top, size, and is empty operations are valid.
		Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
	Follow-up: Can you implement the queue such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer.

	Example 1:
	Input
	["MyQueue", "push", "push", "peek", "pop", "empty"]
	[[], [1], [2], [], [], []]
	Output
	[null, null, null, 1, 1, false]
	Explanation
	MyQueue myQueue = new MyQueue();
	myQueue.push(1); // queue is: [1]
	myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
	myQueue.peek(); // return 1
	myQueue.pop(); // return 1, queue is [2]
	myQueue.empty(); // return false

	Constraints:
		1 <= x <= 9
		At most 100 calls will be made to push, pop, peek, and empty.
		All the calls to pop and peek are valid.
 */

​
class MyQueue {
    var stack: [Int]
    /** Initialize your data structure here. */
    init() {
        self.stack = []
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        let peek = stack[0]
        stack.remove(at: 0)
        return peek
    }
    
    /** Get the front element. */
    func peek() -> Int {
        let peek = stack[0]
        return peek
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack.count == 0
    }
}
​
/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

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