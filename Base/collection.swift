/*  FILEPATH = "./Base/collection.swift"
 *  Collection
    Protocol:   Collection, https://github.com/apple/swift/blob/main/stdlib/public/core/Collection.swift
    required:   var startIndex: Self.Index { get }
                var endIndex: Self.Index { get }
                subscript(position: Self.Index) -> Self.Element { get }
                func index(after i: Self.Index) -> Self.Index
    optional:   override func makeIterator() -> Self.Iterator
                subscript(bounds: Range<Self.Index>) -> Self.SubSequence { get }
                var indices: Self.Indices { get }
                var isEmpty: Bool { get }
                var count: Int { get }
                func index(_ i: Self.Index, offsetBy distance: Int) -> Self.Index
                func index(_ i: Self.Index, offsetBy distance: Int, limitedBy limit: Self.Index) -> Self.Index?
                func distance(from start: Self.Index, to end: Self.Index) -> Int
                func formIndex(after i: inout Self.Index)

    When creating a custom collection type, add the minimal requirements of the 
    `Collection` protocol: starting and ending indices and a subscript for accessing
    elements. With those elements defined, the inherited `makeIterator()`
    method satisfies the requirements of the `Sequence` protocol

    typealias IndexDistance = Int
    associatedtype Element
    associatedtype Iterator = IndexingIterator<Self>
    associatedtype SubSequence : Collection = Slice<Self> where 
        Self.Element == Self.SubSequence.Element, Self.SubSequence == Self.SubSequence.SubSequence
    associatedtype Indices : Collection = DefaultIndices<Self> where
        Self.Indices == Self.Indices.SubSequence
    associatedtype Index : Comparable where
        Self.Index == Self.Indices.Element,
        Self.Indices.Element == Self.Indices.Index,
        Self.Indices.Index == Self.SubSequence.Index,
        Self.SubSequence.Index == Self.Indices.Indices.Element,
        Self.Indices.Indices.Element == Self.Indices.Indices.Index,
        Self.Indices.Indices.Index == Self.SubSequence.Indices.Element,
        Self.SubSequence.Indices.Element == Self.SubSequence.Indices.Index,
        Self.SubSequence.Indices.Index == Self.Indices.Indices.Indices.Element,
        Self.Indices.Indices.Indices.Element == Self.Indices.Indices.Indices.Index,
        Self.Indices.Indices.Indices.Index == Self.SubSequence.Indices.Indices.Element,
        Self.SubSequence.Indices.Indices.Element == Self.SubSequence.Indices.Indices.Index,
        Self.SubSequence.Indices.Indices.Index == Self.SubSequence.Indices.Indices.Indices.Element,
        Self.SubSequence.Indices.Indices.Indices.Element == Self.SubSequence.Indices.Indices.Indices.Index
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

class Class<Element>: Collection {
    var elements: (Element, Element)

    init(_ first: Element, _ second: Element) {
        self.elements = (first, second)
    }

    var startIndex: Int {
        print("Get startIndex")
        return 0 
    }
    var endIndex: Int   { 
        print("Get endIndex")
        return 2 
    }

    subscript(index: Int) -> Element {
        get {
            switch index {
            case 0: return elements.0
            case 1: return elements.1
            default: fatalError("Index out of bounds.")
            }
        }
        set {
            switch index {
            case 0: elements.0 = newValue
            case 1: elements.1 = newValue
            default: fatalError("Index out of bounds.")
            }
        }
    }
    
    func index(after i: Int) -> Int {
        print("Indext after \(i)")
        precondition(i < endIndex, "Can't advance beyond endIndex")
        return i + 1
    }
}

Test.run {
    let foo = Class<Int>(1, 2)
    for bar in foo {
        print(bar)
    }
    print(foo[0])
    print(foo.indices)
    print(foo.count)
    print(Class<Int>.self.Indices)
    print(Class<Int>.self.SubSequence)
}

