/*	FILEPATH = "./LeetCode/100/68_text_justification.swift"
 *	68. Text Justification
	Given an array of words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.
	You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.
	Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
	For the last line of text, it should be left justified and no extra space is inserted between words.
	Note:
		A word is defined as a character sequence consisting of non-space characters only.
		Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
		The input array words contains at least one word.

	Example 1:
	Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
	Output:
	[
	   "This    is    an",
	   "example  of text",
	   "justification.  "
	]

	Example 2:
	Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
	Output:
	[
	  "What   must   be",
	  "acknowledgment  ",
	  "shall be        "
	]
	Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.
	Note that the second line is also left-justified becase it contains only one word.

	Example 3:
	Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
	Output:
	[
	  "Science  is  what we",
	  "understand      well",
	  "enough to explain to",
	  "a  computer.  Art is",
	  "everything  else  we",
	  "do                  "
	]

	Constraints:
		1 <= words.length <= 300
		1 <= words[i].length <= 20
		words[i] consists of only English letters and symbols.
		1 <= maxWidth <= 100
		words[i].length <= maxWidth
 */

class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res: [String] = []
        var i = 0
        while i < words.count {
            var j = i
            var tmp_length = 0
            while j < words.count {
                tmp_length += words[j].count + ((j > i) ? 1 : 0)
                if tmp_length <= maxWidth {
                    j += 1
                } else {
                    res.append(string_with_words(words, maxWidth, i, j))
                    break
                }
            }
            if j == words.count {
                res.append(string_with_words(words, maxWidth, i, j))
            }
            i = j
        }
        return res
    }

    func string_with_words(_ words: [String], _ maxWidth: Int, _ i: Int, _ j: Int) -> String {
        var length = 0
        for k in i..<j {
            length += words[k].count
        }
        func space(_ n: Int) -> String {
            var string = ""
            for _ in 0..<n {
                string += " "
            }
            return string
        }
        func space(_ index: Int, _ count: Int, _ length: Int, _ maxWidth: Int, _ is_last: Bool) -> String {
            if is_last {
                return index == count - 1 ? space(maxWidth - length - count + 1) : " "
            }
            if count == 1 {
                return space(maxWidth - length)
            }
            if index == count - 1 {
                return ""
            }
            return space((maxWidth - length) / (count - 1)) + (index < ((maxWidth - length) % (count - 1)) ? " " : "")
        }
        var string = ""
        for k in i..<j {
            print(j, words.count)
            string += words[k] + space(k - i, j - i, length, maxWidth, j == words.count)
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
    var words: [String]
    var maxWidth: Int
    words = ["This", "is", "an", "example", "of", "text", "justifi", "cation."]; maxWidth = 16
    print(Solution().fullJustify(words, maxWidth))
}