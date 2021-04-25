/*	FILEPATH = "./LeetCode/250/227_basic_calculator_ii.swift"
 *	227. Basic Calculator II
	Given a string s which represents an expression, evaluate this expression and return its value. 
	The integer division should truncate toward zero.

	Example 1:
	Input: s = "3+2*2"
	Output: 7

	Example 2:
	Input: s = " 3/2 "
	Output: 1

	Example 3:
	Input: s = " 3+5 / 2 "
	Output: 5

	Constraints:
		1 <= s.length <= 3 * 105
		s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
		s represents a valid expression.
		All the integers in the expression are non-negative integers in the range [0, 231 - 1].
		The answer is guaranteed to fit in a 32-bit integer.
 */

class Solution {
    func calculate(_ s: String) -> Int {
        let (nums, operators) = parse(s)
        if operators.count == 0 {
            return nums[0]
        }
        var stack1: [Int] = []
        var stack2: [Character] = []
        for (i, num) in nums.enumerated() {
            stack1.append(num)
            if stack1.count > 2 {
                if (stack2[0] == "+" || stack2[0] == "-") && (stack2[1] == "*" || stack2[1] == "/") {
                    let val = calculate(stack1[1], stack1[2], stack2[1])
                    stack1 = [stack1[0], val]
                    stack2 = [stack2[0]]
                } else {
                    let val = calculate(stack1[0], stack1[1], stack2[0])
                    stack1 = [val, stack1[2]]
                    stack2 = [stack2[1]]
                }
            }
            if i < operators.count {
                stack2.append(operators[i])
            }  
        }
        return calculate(stack1[0], stack1[1], stack2[0])
    }
    
    func calculate(_ num1: Int, _ num2: Int, _ `operator`: Character) -> Int {
        switch `operator` {
            case "+": return num1 + num2
            case "-": return num1 - num2
            case "*": return num1 * num2
            case "/": return num1 / num2
            default: return 0
        }
    }
    
    func parse(_ s: String) -> ([Int], [Character]) {
        var nums: [Int] = []
        var operators: [Character] = []
        var num: Int = 0
        for c in s {
            switch c {
                case let c where c.isNumber:
                    num = num * 10 + c.wholeNumberValue!
                case "+", "-", "*", "/":
                    nums.append(num)
                    num = 0
                    operators.append(c)
                default: break
            }
        }
        nums.append(num)
        return (nums, operators)
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
    print(Solution().calculate("3+2*2"))
    print(Solution().calculate(" 3/2 "))
    print(Solution().calculate(" 3+5 / 2 "))
}