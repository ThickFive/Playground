/*  FILEPATH = "./Base/substring.swift"
 *  Substring
 */
 
extension String {
    subscript(position: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: position)
        return String(self[index])
    }

    subscript(bounds: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: bounds.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex..<endIndex])
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
    let string = "abc😆e🇺🇸fg"
    var index = string.startIndex
    while index != string.endIndex {
        print(string[index])
        string.formIndex(after: &index)
    }

    print(string[0..<string.count])
    print(string[3])
}