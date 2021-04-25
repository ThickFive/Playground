/*	FILEPATH = "./Base/deque.swift"
 *	Deque
 */

struct Deque<Element> {
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

    @discardableResult
    mutating func dequeue() -> Element? {
        guard size > 0 else {
            return nil
        }
        return array.removeFirst()
    }

    mutating func enqueue_front(_ item: Element) {
        array.insert(item, at: 0)
    }

    @discardableResult
    mutating func dequeue_back() -> Element? {
        guard size > 0 else {
            return nil
        }
        return array.removeLast()
    }

    mutating func peek_front() -> Element? {
        return array.first
    }

    mutating func peek_back() -> Element? {
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

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res: [Int] = []
        var deque = Deque<(index: Int, value: Int)>()
        for i in 0..<nums.count  {
            let num = nums[i]
            //  去掉 <= num 的所有元素
            while deque.size > 0, deque.peek_back()!.value <= num {
                deque.dequeue_back()
            }
            //  添加最后一个元素
            deque.enqueue((index: i, value: num))
            if i < k - 1 {
                continue
            }
            //  去掉第一个滑出窗口的元素, 如果还存在
            if deque.size > 0, deque.peek_front()!.index < i - k {
                deque.dequeue()
            }
            res.append(deque.peek_front()!.value)
        }
        return res
    }
}

Test.run {
    print(Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
    print(Solution().maxSlidingWindow([1], 1))
    print(Solution().maxSlidingWindow([1,-1], 1))
    print(Solution().maxSlidingWindow([9,11], 2))
    print(Solution().maxSlidingWindow([4,-2], 2))
}