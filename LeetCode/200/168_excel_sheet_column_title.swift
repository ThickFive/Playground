/*	FILEPATH = "./LeetCode/200/168_excel_sheet_column_title.swift"
 *	168. Excel Sheet Column Title
	Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.
	For example:
	A -> 1
	B -> 2
	C -> 3
	...
	Z -> 26
	AA -> 27
	AB -> 28 
	...

	Example 1:
	Input: columnNumber = 1
	Output: "A"

	Example 2:
	Input: columnNumber = 28
	Output: "AB"

	Example 3:
	Input: columnNumber = 701
	Output: "ZY"

	Example 4:
	Input: columnNumber = 2147483647
	Output: "FXSHRXW"

	Constraints:
		1 <= columnNumber <= 2^31 - 1
 */

class Solution {
    /*  转换成二十六进制数, 然后用 0-A-Y (0d-1d-25d, d 表示10进制) 表示出来
     *  e.g. 27d = 11 = AA
        问题1. 没办法表示 26d^n = 1000(n个0) 这样包含 0 的数
        e.g. 676d = 26d * 26d = 100 = A??
        解决方案: 676d = 675d + 1d = YY + 1d = YZ, 也就是先减去 1 算出每个位, 最后一位再加回 1, 然后 0 用 Z 替换
        问题2. 17577d = 17576d + 1d = 1001 = AZZA, 多了一个 A
        解决方案: 去掉最高位的 A, 因为 10 = 26d = Z
     */
    func convertToTitle(_ columnNumber: Int) -> String {
        var string = ""
        var num = columnNumber - 1
        var rem = 0
        var nums: [Int] = []
        while num >= 0 {
            rem = num % 26
            num = num / 26
            nums.append(rem)
            if num == 0 {
                break
            }
        }
        nums[0] += 1
        if nums.count > 1 && nums[nums.count - 1] == 1 && nums[nums.count - 2] == 0 {
            nums.remove(at: nums.count - 1)
        }
        for num in nums {
            let c = num == 0 ? 26 : num
            string = "\(Character(Unicode.Scalar(c + 64)!))\(string)"
        }
        return string
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
    print(Solution().convertToTitle(26))
    print(Solution().convertToTitle(676))
    print(Solution().convertToTitle(677))
    print(Solution().convertToTitle(702))
    print(Solution().convertToTitle(17602))
    print(Solution().convertToTitle(17577))
}