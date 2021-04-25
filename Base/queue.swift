/*	FILEPATH = "./Base/queue.swift"
 *	Queue
 */

struct Queue<Element> {
    private var array: [Element]
    
    init() {
        self.array = []
    }

    var size: Int {
        return array.count
    }

    mutating func enqueue(_ item: Element) {
        array.append(item)
    }

    mutating func dequeue() -> Element? {
        guard size > 0 else {
            return nil
        }
        return array.removeFirst()
    }

    func front() -> Element? {
        return array.first
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
    var queue = Queue<Int>()
    queue.enqueue(0)
    queue.enqueue(1)
    print(queue.dequeue()!)
    queue.enqueue(2)
    print(queue.dequeue()!)
    print(queue.front()!)
}