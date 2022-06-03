import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */

func solution(_ text: String) -> String {
    // Convert string into array
    var chars = Array(text)
    
    // Create stack
    var result = [String]()
    
    // Push chars onto stack
    for i in chars {
        result.append(String(i))
    }
    
    // Pop chars off of stack
    for i in 0..<result.count {
        chars[i] = Character(result.popLast()!)
    }
    
    return String(chars)
}

solution("abc") // bca
solution("Would you like to play a game?")
