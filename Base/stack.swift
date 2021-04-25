/*	FILEPATH = "./Base/stack.swift"
 *	Stack
 */

struct Stack<Element> {
    private var array: [Element]
    
    init() {
        self.size = 0
        self.array = []
    }

    var size: Int {
        return array.count
    }

    mutating func push(_ item: Element) {
        array.append(item)
    }

    mutating func pop() -> Element? {
        guard size > 0 else {
            return nil
        }
        return array.removeLast()
    }

    func top() -> Element? {
        return array.last
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
    var stack = Stack<Int>()
    stack.push(0)
    stack.push(1)
    print(stack.top()!)
    stack.push(2)
    print(stack.pop()!)
    print(stack.top()!)
}