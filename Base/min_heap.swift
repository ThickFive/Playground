/*	FILEPATH = "./Base/min_heap.swift"
 *	MinHeap
 */

struct MinHeap<Element: Comparable> {
    //  Swift 里 Array.append 平均时间复杂度为 O(1), capacity 可以不设置, 因此不需要手动扩容
    private(set) var capacity: Int
    private var array: [Element]

    init(capacity: Int) {
        self.capacity = capacity
        self.array = []
    }

    var size: Int {
        return array.count
    }

    mutating func insert(_ item: Element) {
        if size == capacity {
            capacity *= 2
        }
        array.append(item)
        heapify_up()
    }

    @discardableResult
    mutating func poll() -> Element? {
        guard size > 0 else {
            return nil
        }
        let item = peek()
        array[0] = array[size - 1]
        array.removeLast()
        heapify_down()
        return item
    }

    func peek() -> Element? {
        return array.first
    }

    mutating private func heapify_up() {
        var index = size - 1
        while has_parent(index) && parent(index) > array[index] {
            swap(get_parent_index(index), index)
            index = get_parent_index(index)
        }
    }

    mutating private func heapify_down() {
        var index = 0
        while has_left_child(index) {
            var smaller_child_index = get_left_child_index(index)
            if has_right_child(index) && right_child(index) < left_child(index) {
                smaller_child_index = get_right_child_index(index)
            } 
            if array[index] > array[smaller_child_index] {
                swap(index, smaller_child_index)
            } else {
                break
            }
            index = smaller_child_index
        }
    }

    mutating private func swap(_ lhs: Int, _ rhs: Int) {
        let tmp = array[lhs]
        array[lhs] = array[rhs]
        array[rhs] = tmp
    }

    private func get_left_child_index(_ index: Int) -> Int {
        return index * 2 + 1
    }

    private func get_right_child_index(_ index: Int) -> Int {
        return index * 2 + 2
    }

    private func get_parent_index(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    private func has_left_child(_ index: Int) -> Bool {
        return get_left_child_index(index) < size
    }

    private func has_right_child(_ index: Int) -> Bool {
        return get_right_child_index(index) < size
    }

    private func has_parent(_ index: Int) -> Bool {
        return get_parent_index(index) >= 0
    }

    private func left_child(_ index: Int) -> Element {
        return array[get_left_child_index(index)]
    }

    private func right_child(_ index: Int) -> Element {
        return array[get_right_child_index(index)]
    }

    private func parent(_ index: Int) -> Element {
        return array[get_parent_index(index)]
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
    //  求第 3 大的数
    var min_heap = MinHeap<Int>(capacity: 10)
    for num in [9,8,7,6,5,0,1,2,3,4] {
        min_heap.insert(num)
        if min_heap.size > 3 {
            min_heap.poll()
        }
    }
    print(min_heap.peek()!)
}