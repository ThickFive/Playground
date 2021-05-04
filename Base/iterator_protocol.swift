/*	FILEPATH = "./Base/iterator_protocol.swift"
 *  IteratorProtocol
    required:   func next() -> Element?
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

class Class {
    var index: Int
    let nums: [Int]
    init(_ nums: [Int]) {
        self.index = -1
        self.nums = nums
    }
}

extension Class: IteratorProtocol {
    func next() -> Int? {
        index += 1
        return index < nums.count ? nums[index] : nil
    }
}

Test.run {
    let foo = Class([1,2,3,4])
    while let bar = foo.next() {
        print(bar)
    }
}
