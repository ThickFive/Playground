/*	FILEPATH = "./Base/typealias.swift"
 *	Typealias
    利用 typealias 0. 指定别名 1. 省略泛型类初始化时的类型设置 2. 扩展带约束的协议方法
    e.g.    ListNode(2) > ListNode<Int>(1)
 */

class ListNode<Element> {
    typealias Next = ListNode
    typealias Element = Element
    
    var val: Element
    var next: Next?

    init(_ val: Element, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: Equatable where ListNode.Element: Equatable {
    static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
}

extension ListNode: Comparable where ListNode.Element: Comparable {
    static func <(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
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
    let node1 = ListNode(1)
    precondition(type(of: node1) == ListNode<Int>.self, "type(of: node1) != ListNode<Int>.self")
    let node2 = ListNode(1.0)
    print(type(of: node2))
}

Test.run { 
    let node1 = ListNode("abc")
    let node2 = ListNode<String>("bbc")
    precondition(node1 < node2, "ListNode(\"abc\") >= ListNode<String>(\"bbc\")")
}

Test.run { 
    let node1 = ListNode([1,2,3])
    let node2 = ListNode<[Int]>([1,2,3])
    print(node1 == node2)
    //  error: binary operator '>' cannot be applied to two 'ListNode<[Int]>' operands
    //  note: candidate requires that '[Int]' conform to 'Comparable'
    //  print(node1 > node2)
}