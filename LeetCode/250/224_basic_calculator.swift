/*	FILEPATH = "./LeetCode/250/224_basic_calculator.swift"
 *	224. Basic Calculator
	Given a string s representing an expression, implement a basic calculator to evaluate it.

	Example 1:
	Input: s = "1 + 1"
	Output: 2

	Example 2:
	Input: s = " 2-1 + 2 "
	Output: 3

	Example 3:
	Input: s = "(1+(4+5+2)-3)+(6+8)"
	Output: 23

	Constraints:
		1 <= s.length <= 3 * 105
		s consists of digits, '+', '-', '(', ')', and ' '.
		s represents a valid expression.
 */

class Solution {
    func calculate(_ s: String) -> Int {
        let tokens = parse(s)
        return Int(calculate(tokens))!
    }

    func calculate(_ tokens: [String]) -> String {
        var tokens = tokens
        var stack: [Int] = []   //  记录 "(" 的位置
        var i = 0
        while i < tokens.count {
            let token = tokens[i]
            switch token {
            case "(":
                stack.append(i)
            case ")":
                let start = stack[stack.count - 1]
                let end = i
                stack.remove(at: stack.count - 1)
                let val = calculate_tokens_without_brackets(Array(tokens[start+1..<end]))
                tokens.replaceSubrange(start...end, with: [val])
                i = start
            default:    break
            }
            i += 1
        }
        return calculate_tokens_without_brackets(tokens)
    }

    func calculate_tokens_without_brackets(_ tokens: [String]) -> String {
        print(tokens)
        var sum = 0
        var pos = 1
        for token in tokens {
            switch token {
            case "+":
                pos = 1
            case "-":
                pos = -1
            default:
                sum += pos * Int(token)!
            }
        }
        return String(sum)
    }
    
    func parse(_ s: String) -> [String] {
        var tokens: [String] = []
        var number: String = ""
        let append_number_if_exist = {
            if number.count > 0 {
                tokens.append(number)
                number = ""
            }
        }
        for c in s {
            switch c {
            case "+", "-", "(", ")":
                append_number_if_exist()
                tokens.append(String(c))
            case " ": 
                append_number_if_exist()
            default:
                number += String(c)
            }
        }
        append_number_if_exist()
        return tokens
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
    // print(Solution().calculate("1 + 1"))
    // print(Solution().calculate(" 2-1 + 2 "))
    print(Solution().calculate("(1+(4+5+2)-3)+(6+8)"))
}