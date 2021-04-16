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
    var count = 0
    for _ in 0..<1 {
        for _ in 0..<1000 {
            for i in 0..<10000 {
                if i > 5000 {
                    count += 1
                }
            }
        }
    }
    print("Loop total count: \(count)")
}