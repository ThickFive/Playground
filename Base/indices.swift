/*  FILEPATH = "./Base/indices.swift"
 *  Indices Of Collection
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

Test.run {
    let string: String = "abc123"
    print(string.indices)
    for indice in string.indices {
        print(indice, string[indice])
    }
}

Test.run {
    let array: [Int] = [1, 2, 3]
    print(array.indices)
    for indice in array.indices {
        print(indice, array[indice])
    }
}

Test.run {
    let dict: [String: Int] = [
        "a": 100,
        "b": 200,
        "c": 300,
    ]
    print(dict.indices)
    for indice in dict.indices {
        print(indice, dict[indice])
    }
}

Test.run {
    let set: Set<Int> = [1, 2, 3, 4]
    print(set.indices)
    for indice in set.indices {
        print(indice, set[indice])
    }
}