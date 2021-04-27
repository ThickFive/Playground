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
    var root: TreeNode?
    var nums: [Int?] = [0]
    for i in 1..<14 {
        if arc4random() % 4 == 0 {
            nums.append(nil)
        } else {
            nums.append(i)
        }
    }
    root = build_tree_from_level_order(nums)
    output_tree(root)
}