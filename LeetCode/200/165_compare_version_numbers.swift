/*	FILEPATH = "./LeetCode/200/165_compare_version_numbers.swift"
 *	165. Compare Version Numbers
	Given two version numbers, version1 and version2, compare them.
	Version numbers consist of one or more revisions joined by a dot '.'. Each revision consists of digits and may contain leading zeros. Every revision contains at least one character. Revisions are 0-indexed from left to right, with the leftmost revision being revision 0, the next revision being revision 1, and so on. For example 2.5.33 and 0.1 are valid version numbers.
	To compare version numbers, compare their revisions in left-to-right order. Revisions are compared using their integer value ignoring any leading zeros. This means that revisions 1 and 001 are considered equal. If a version number does not specify a revision at an index, then treat the revision as 0. For example, version 1.0 is less than version 1.1 because their revision 0s are the same, but their revision 1s are 0 and 1 respectively, and 0 < 1.
	Return the following:
		If version1 < version2, return -1.
		If version1 > version2, return 1.
		Otherwise, return 0.

	Example 1:
	Input: version1 = "1.01", version2 = "1.001"
	Output: 0
	Explanation: Ignoring leading zeroes, both "01" and "001" represent the same integer "1".

	Example 2:
	Input: version1 = "1.0", version2 = "1.0.0"
	Output: 0
	Explanation: version1 does not specify revision 2, which means it is treated as "0".

	Example 3:
	Input: version1 = "0.1", version2 = "1.1"
	Output: -1
	Explanation: version1's revision 0 is "0", while version2's revision 0 is "1". 0 < 1, so version1 < version2.

	Example 4:
	Input: version1 = "1.0.1", version2 = "1"
	Output: 1

	Example 5:
	Input: version1 = "7.5.2.4", version2 = "7.5.3"
	Output: -1

	Constraints:
		1 <= version1.length, version2.length <= 500
		version1 and version2 only contain digits and '.'.
		version1 and version2 are valid version numbers.
		All the given revisions in version1 and version2 can be stored in a 32-bit integer.
 */

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let nums1 = version1.split(".").map({Int($0)!})
        let nums2 = version2.split(".").map({Int($0)!})
        var i = 0
        var v1 = 0
        var v2 = 0
        while i < nums1.count || i < nums2.count {
            v1 = i < nums1.count ? nums1[i] : 0
            v2 = i < nums2.count ? nums2[i] : 0
            if v1 < v2 {
                return -1
            } else if v1 > v2 {
                return 1
            }
            i += 1
        }
        return 0
    }
}

extension String {
    func split(_ s: Character) -> [String] {
        var array: [String] = []
        var string = ""
        for c in self {
            if c != s {
                string += String(c)
            } else {
                string.count > 0 ? array.append(string) : ()
                string = ""
            }
        }
        string.count > 0 ? array.append(string) : ()
        return array
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
   print(Solution().compareVersion("1.01", "1.001"))
   print(Solution().compareVersion("1.0", "1.0.0"))
   print(Solution().compareVersion("0.1", "1.1"))
   print(Solution().compareVersion("1.0.1", "1"))
   print(Solution().compareVersion("7.5.2.4", "7.5.3"))
}