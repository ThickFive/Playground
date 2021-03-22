/*	FILEPATH = "./LeetCode/100/71_simplify_path.swift"
 *	71. Simplify Path
	Given a string path, which is an absolute path (starting with a slash '/') to a file or directory in a Unix-style file system, convert it to the simplified canonical path.
	In a Unix-style file system, a period '.' refers to the current directory, a double period '..' refers to the directory up a level, and any multiple consecutive slashes (i.e. '//') are treated as a single slash '/'. For this problem, any other format of periods such as '...' are treated as file/directory names.
	The canonical path should have the following format:
		The path starts with a single slash '/'.
		Any two directories are separated by a single slash '/'.
		The path does not end with a trailing '/'.
		The path only contains the directories on the path from the root directory to the target file or directory (i.e., no period '.' or double period '..')
	Return the simplified canonical path.

	Example 1:
	Input: path = "/home/"
	Output: "/home"
	Explanation: Note that there is no trailing slash after the last directory name.

	Example 2:
	Input: path = "/../"
	Output: "/"
	Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.

	Example 3:
	Input: path = "/home//foo/"
	Output: "/home/foo"
	Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.

	Example 4:
	Input: path = "/a/./b/../../c/"
	Output: "/c"

	Constraints:
		1 <= path.length <= 3000
		path consists of English letters, digits, period '.', slash '/' or '_'.
		path is a valid absolute Unix path.
 */

class Solution {
    func simplifyPath(_ path: String) -> String {
        let dirs: [String] = path.split("/").filter({$0 != "."})
        var stack: [String] = []
        for dir in dirs {
            if dir == ".." {
                stack.count > 0 ? _ = stack.remove(at: stack.count - 1) : () 
            } else {
                stack.append(dir)
            }
        }
        return "/" + stack.join("/")
    }
}

extension Array {
    func join(_ s: String) -> String {
        if self.count == 0 {
            return ""
        }
        if self.count == 1 {
            return "\(self[0])"
        }
        var string = ""
        for i in 0..<self.count - 1 {
            string += "\(self[i])\(s)"
        }
        string += "\(self[self.count - 1])"
        return string
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
    print(Solution().simplifyPath("/a//b////c/d//././/.."))
    print(Solution().simplifyPath("/../"))
    print(Solution().simplifyPath("/home//foo"))
    print(Solution().simplifyPath("/a/./b/../../c/"))
}