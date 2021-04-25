/*	FILEPATH = "./LeetCode/250/215_kth_largest_element_in_an_array.swift"
 *	215. Kth Largest Element in an Array
	Given an integer array nums and an integer k, return the kth largest element in the array.
	Note that it is the kth largest element in the sorted order, not the kth distinct element.

	Example 1:
	Input: nums = [3,2,1,5,6,4], k = 2
	Output: 5

	Example 2:
	Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
	Output: 4

	Constraints:
		1 <= k <= nums.length <= 10^4
		-10^4 <= nums[i] <= 10^4
 */

//  O(n * log(n)), Sort
class Solution1 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return nums.sorted()[nums.count - k]
    }
}

//  O(n * log(k)), MinHeap
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var min_heap = MinHeap<Int>(capacity: nums.count)
        for num in nums {
            min_heap.insert(num)
            if min_heap.size > k {
                _ = min_heap.poll()
            }
        }
        return min_heap.peek()!
    }
}

struct MinHeap<Element: Comparable> {
    //  Swift 里 Array.append 平均时间复杂度为 O(1), capacity 可以不设置, 因此不需要手动扩容
    let capacity: Int
    var size: Int
    var array: [Element]

    init(capacity: Int) {
        self.capacity = capacity
        self.size = 0
        self.array = []
    }

    mutating func insert(_ item: Element) {
        array.append(item)
        size += 1
        heapify_up()
    }

    mutating func poll() -> Element? {
        guard size > 0 else {
            return nil
        }
        let item = peek()
        array[0] = array[size - 1]
        array.remove(at: size - 1)
        size -= 1
        heapify_down()
        return item
    }

    func peek() -> Element? {
        guard size > 0 else {
            return nil
        }
        return array[0]
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
    print(Solution().findKthLargest([3,2,1,5,6,4], 2))
    print(Solution().findKthLargest([3,2,3,1,2,4,5,5,6], 4))
}