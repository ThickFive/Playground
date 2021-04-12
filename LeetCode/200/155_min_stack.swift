/*	FILEPATH = "./LeetCode/200/155_min_stack.swift"
 *	155. Min Stack
	Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
	Implement the MinStack class:
		MinStack() initializes the stack object.
		void push(val) pushes the element val onto the stack.
		void pop() removes the element on the top of the stack.
		int top() gets the top element of the stack.
		int getMin() retrieves the minimum element in the stack.

	Example 1:
	Input
	["MinStack","push","push","push","getMin","pop","top","getMin"]
	[[],[-2],[0],[-3],[],[],[],[]]
	Output
	[null,null,null,null,-3,null,0,-2]
	Explanation
	MinStack minStack = new MinStack();
	minStack.push(-2);
	minStack.push(0);
	minStack.push(-3);
	minStack.getMin(); // return -3
	minStack.pop();
	minStack.top();    // return 0
	minStack.getMin(); // return -2

	Constraints:
		-231 <= val <= 231 - 1
		Methods pop, top and getMin operations will always be called on non-empty stacks.
		At most 3 * 104 calls will be made to push, pop, top, and getMin.
 */

class MinStack {
    var stack: [Node]
    /** initialize your data structure here. */
    init() {
        self.stack = []
    }
    
    func push(_ val: Int) {
        let node = Node(val)
        if stack.count > 0 {
            node.min = min(stack[stack.count - 1].min, val)
        } else {
            node.min = val
        }
        stack.append(node)
    }
    
    func pop() {
        stack.remove(at: stack.count - 1)
    }
    
    func top() -> Int {
        return stack[stack.count - 1].val
    }
    
    func getMin() -> Int {
        return stack[stack.count - 1].min
    }
}

class Node {
    var val: Int
    var min: Int = Int.max
    init(_ val: Int) {
        self.val = val
    } 
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
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