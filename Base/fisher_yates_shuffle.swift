/*	FILEPATH = "./Base/fisher_yates_shuffle.swift"
 *	Fisher–Yates Shuffle
    一个包含 n 个元素的素组, 乱序之后有 n! 种不同排列方式
    从最后一位开始与它之前(包括自己)的随机一位元素交换, 那么每个元素出现在最后一位的概率为 1 / n
    倒数第二位与之前的元素交换, 每个元素出现在最后一位的概率为 (1 - 1 / n) * 1 / (n - 1) = 1 / n
    以此类推, n 轮过后, 每个元素出现在每个位置的概率都为 1 / n
 */

func shuffle<T>(_ array: [T]) -> [T] {
    var array = array
    let count = array.count
    for i in (0..<count).reversed() {
        let j = Int(arc4random_uniform(UInt32(i + 1)))
        let tmp = array[j]
        array[j] = array[i]
        array[i] = tmp
    }
    return array
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
    let array: [Int] = [1,2,3] // 共有 3! 种不同排列方式
    var map: [String: Int] = [:]
    for _ in 0..<100000 {
        let key = shuffle(array).map({"\($0)"}).joined(separator: "-")
        if let count = map[key] {
            map[key] = count + 1
        } else {
            map[key] = 1 
        }
    }
    for (key, value) in map {
        print("\(key) count: \(value)")
    }
}
