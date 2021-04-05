/*	FILEPATH = "./LeetCode/150/150_evaluate_reverse_polish_notation.swift"
 *	150. Evaluate Reverse Polish Notation
	Evaluate the value of an arithmetic expression in Reverse Polish Notation.
	Valid operators are +, -, *, and /. Each operand may be an integer or another expression.
	Note that division between two integers should truncate toward zero.
	It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.

	Example 1:
	Input: tokens = ["2","1","+","3","*"]
	Output: 9
	Explanation: ((2 + 1) * 3) = 9

	Example 2:
	Input: tokens = ["4","13","5","/","+"]
	Output: 6
	Explanation: (4 + (13 / 5)) = 6

	Example 3:
	Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
	Output: 22
	Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
	= ((10 * (6 / (12 * -11))) + 17) + 5
	= ((10 * (6 / -132)) + 17) + 5
	= ((10 * 0) + 17) + 5
	= (0 + 17) + 5
	= 17 + 5
	= 22

	Constraints:
		1 <= tokens.length <= 104
		tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].
 */

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var nums: [Int] = []
        for token in tokens {
            let count = nums.count
            switch (token) {
            case "+":
                nums[count - 2] = nums[count - 2] + nums[count - 1]
                nums.remove(at: count - 1)
            case "-":
                nums[count - 2] = nums[count - 2] - nums[count - 1]
                nums.remove(at: count - 1)
            case "*":
                nums[count - 2] = nums[count - 2] * nums[count - 1]
                nums.remove(at: count - 1)
            case "/":
                nums[count - 2] = nums[count - 2] / nums[count - 1]
                nums.remove(at: count - 1)
            default:
                nums.append(Int(token)!)
            }
        }
        return nums[0]
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
    print(Solution().evalRPN(["2","1","+","3","*"]))
	print(Solution().evalRPN(["4","13","5","/","+"]))
	print(Solution().evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))
	let a-b = 5
}