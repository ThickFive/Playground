/*	FILEPATH = "./LeetCode/300/299_bulls_and_cows.swift"
 *	299. Bulls and Cows
	You are playing the Bulls and Cows game with your friend.
	You write down a secret number and ask your friend to guess what the number is. When your friend makes a guess, you provide a hint with the following info:
		The number of "bulls", which are digits in the guess that are in the correct position.
		The number of "cows", which are digits in the guess that are in your secret number but are located in the wrong position. Specifically, the non-bull digits in the guess that could be rearranged such that they become bulls.
	Given the secret number secret and your friend's guess guess, return the hint for your friend's guess.
	The hint should be formatted as "xAyB", where x is the number of bulls and y is the number of cows. Note that both secret and guess may contain duplicate digits.

	Example 1:
	Input: secret = "1807", guess = "7810"
	Output: "1A3B"
	Explanation: Bulls are connected with a '|' and cows are underlined:
	"1807"
	  |
	"7810"

	Example 2:
	Input: secret = "1123", guess = "0111"
	Output: "1A1B"
	Explanation: Bulls are connected with a '|' and cows are underlined:
	"1123"        "1123"
	  |      or     |
	"0111"        "0111"
	Note that only one of the two unmatched 1s is counted as a cow since the non-bull digits can only be rearranged to allow one 1 to be a bull.

	Example 3:
	Input: secret = "1", guess = "0"
	Output: "0A0B"

	Example 4:
	Input: secret = "1", guess = "1"
	Output: "1A0B"

	Constraints:
		1 <= secret.length, guess.length <= 1000
		secret.length == guess.length
		secret and guess consist of digits only.
 */

class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        let s1 = Array(secret), s2 = Array(guess)
        var a = 0, b = 0
        var map1 = [Character: Int](), map2 = [Character: Int]()
        for i in 0..<s1.count {
            if s1[i] == s2[i] {
                a += 1
            } else {
                increase(&map1, &map2, s2[i], &b)
                increase(&map2, &map1, s1[i], &b)
            }
        }
        return "\(a)A\(b)B"
    }
    
    func increase(_ map1: inout [Character: Int], _ map2: inout [Character: Int], _ c: Character, _ b: inout Int) {
        if let count = map1[c], count > 0 {
            map1[c] = count - 1
            b += 1
        } else {
            add(&map2, c)
        }
    }
    
    func add(_ map: inout [Character: Int], _ c: Character) {
        if let count = map[c] {
            map[c] = count + 1
        } else {
            map[c] = 1
        }
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
    
}