/*  FILEPATH = "./Base/sequence.swift"
 *  Sequence
    required:   func makeIterator() -> some IteratorProtocol
    Node: If some Sequence conform to protocol `IteratorProtocol`, `makeIterator()` is not necessary.
    extension Sequence where Self.Iterator == Self {
        /// Returns an iterator over the elements of this sequence.
        @inlinable
        public __consuming func makeIterator() -> Self {
            return self
        }
    }
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

}

extension Class: IteratorProtocol {
    func next() -> Int? {
        return nil
    }
}

extension Class: Sequence {
    internal func makeIterator() -> Iterator {
        print("makeIterator")
        return Iterator([1,2,3,4])
    }
}

class Iterator: IteratorProtocol {
    var index: Int
    let nums: [Int]
    init(_ nums: [Int]) {
        self.index = -1
        self.nums = nums
    }
    
    func next() -> Int? {
        index += 1
        return index < nums.count ? nums[index] : nil
    }
}

Test.run {
    let foo = Class()
    for bar in foo {
        print(bar)
    }
}

