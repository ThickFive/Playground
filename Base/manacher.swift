/*	FILEPATH = "./Base/manacher.swift"
 *	Manacher 查找最长回文子串 O(n)
 */

//  Manacher O(n), 将每个字符都用 `#` 隔开, 新字符串长度为一定为奇数, 那么回文序列的长度也一定为奇数
//  中心扩散法, 确定以每个字符为中心长度的回文长度, 利用镜像对称的原理, 可以跳过部分已经扫描的序列
//  e.g. ab -> #a#b#, abc -> #a#b#c#
//  c: 中心点, r: 右边界 e.g. aba 以 b 为中心点时, c = 1, r = 2
func manacher(_ s: String) -> String {
    let chars = Array(s)
    var string: [Character] = ["#"]
    for c in chars {
        string.append(c)
        string.append("#")
    }
    var length = 0      //  回文长度
    var location = 0    //  对应原字符串起点
    var dp: [Int] = Array(repeating: 0, count: string.count)
    var r = 0
    var c = 0
    for i in 0..<string.count {
        let mirror = 2 * c - i
        if i < r {
            dp[i] = min(r - i, dp[mirror])
        }
        var a = i + (1 + dp[i])
        var b = i - (1 + dp[i])
        while a < string.count && b >= 0 && string[a] == string[b] {
            dp[i] += 1
            a += 1
            b -= 1
        }
        if i + dp[i] > r {
            c = i
            r = i + dp[i]
        }
        if dp[i] > length {
            length = dp[i]
            location = (i - length) / 2
        }
    }
    return String(chars[location..<location + length])
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
    print(manacher(""))
    print(manacher("a"))
    print(manacher("abba"))
    print(manacher("abbcccbbd"))
}