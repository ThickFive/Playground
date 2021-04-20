/*	FILEPATH = "./LeetCode/250/225_implement_stack_using_queues.swift"
 *	225. Implement Stack using Queues
	Implement a last in first out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal queue (push, top, pop, and empty).
	Implement the MyStack class:
		void push(int x) Pushes element x to the top of the stack.
		int pop() Removes the element on the top of the stack and returns it.
		int top() Returns the element on the top of the stack.
		boolean empty() Returns true if the stack is empty, false otherwise.
	Notes:
		You must use only standard operations of a queue, which means only push to back, peek/pop from front, size, and is empty operations are valid.
		Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue), as long as you use only a queue's standard operations.

	Example 1:
	Input
	["MyStack", "push", "push", "top", "pop", "empty"]
	[[], [1], [2], [], [], []]
	Output
	[null, null, null, 2, 2, false]
	Explanation
	MyStack myStack = new MyStack();
	myStack.push(1);
	myStack.push(2);
	myStack.top(); // return 2
	myStack.pop(); // return 2
	myStack.empty(); // return False

	Constraints:
		1 <= x <= 9
		At most 100 calls will be made to push, pop, top, and empty.
		All the calls to pop and top are valid.
	Follow-up: Can you implement the stack such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer. You can use more than two queues.
 */

​
class MyStack {
    var stack: [Int]
​
    /** Initialize your data structure here. */
    init() {
        self.stack = []
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        stack.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        let top = stack[stack.count - 1]
        stack.remove(at: stack.count - 1)
        return top
    }
    
    /** Get the top element. */
    func top() -> Int {
        return stack[stack.count - 1]
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return stack.count == 0
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