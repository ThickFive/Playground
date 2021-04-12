/*	FILEPATH = "./LeetCode/200/171_excel_sheet_column_number.swift"
 *	171. Excel Sheet Column Number
	Given a string columnTitle that represents the column title as appear in an Excel sheet, return its corresponding column number.
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
	Input: columnTitle = "A"
	Output: 1

	Example 2:
	Input: columnTitle = "AB"
	Output: 28

	Example 3:
	Input: columnTitle = "ZY"
	Output: 701

	Example 4:
	Input: columnTitle = "FXSHRXW"
	Output: 2147483647

	Constraints:
		1 <= columnTitle.length <= 7
		columnTitle consists only of uppercase English letters.
		columnTitle is in the range ["A", "FXSHRXW"].
 */

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var res = 0
        for scalar in columnTitle.unicodeScalars {
            res = 26 * res + Int(scalar.value) - 64
        }
        return res
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
    print(Solution().titleToNumber("A"))
    print(Solution().titleToNumber("AB"))
    print(Solution().titleToNumber("ZY"))
    print(Solution().titleToNumber("FXSHRXW"))
}