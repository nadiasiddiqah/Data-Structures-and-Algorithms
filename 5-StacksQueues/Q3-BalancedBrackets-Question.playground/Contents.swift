import UIKit
import Security

/*
 Balanced brackets
 https://www.hackerrank.com/challenges/balanced-brackets/problem
 
 A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].

 Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().

 A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].

 By this logic, we say a sequence of brackets is balanced if the following conditions are met:

 It contains no unmatched brackets.
 The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
 Given  strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.
 
 */

// MARK: - My solution
func isBalanced(s: String) -> String { // "{[()]}"
    let arr = Array(s)
    
    let b1 = "[]"
    let b2 = "{}"
    let b3 = "()"
    var leftPair = [String]()
    var rightPair = [String]()
    
    for i in 0..<arr.count {  // O(n)
        let char = arr[i]
        if char == b1.first || char == b2.first || char == b3.first {
            leftPair.append(String(char))
        } else {
            rightPair.append(String(char))
        }
    }
    
    if leftPair.count == rightPair.count {
        return "YES"
    }

    return "NO"
}


// MARK: - Given solution
func isBalancedGiven(s: String) -> String {
    var stack = [Character]()
    
    for c in s {  // O(n)
        switch c {
        // as you loop through array of chars, append left pair onto the stack
        case "{", "(", "[":
            stack.append(c)
        // if char is right pair + stack is empty OR last char isn't matching pair -> return NO
        // ..if stack is not empty OR last char is matching -> pop off last char
        case "}":
            if (stack.isEmpty || (stack.last != "{")) {
                return "NO"
            }
            stack.popLast()
        case ")":
            if (stack.isEmpty || (stack.last != "(")) {
                return "NO";
            }
            stack.popLast()
        case "]":
            if (stack.isEmpty || (stack.last != "[")) {
                return "NO";
            }
            stack.popLast()
        default:
            print("breaking \(c)")
        }
    }
    
    // if stack is empty, we have handled all matching pairs
    return stack.isEmpty ? "YES" : "NO"
}

    
// MARK: - TEST CASES
isBalancedGiven(s: "{[()]}") // Yes
isBalancedGiven(s: "[()]}") // No
isBalancedGiven(s: "{}()(){}((){})({[[({({(){}{}}){}})]{({()}((())))}()]})(({}(()){[][]}){()}(({}{}))())()[](){{((){})}}()([[]])[][]()({}((([()]{})())[][[()]]())){{}}[]{()}()[][]{}([])[]{({})}{}{{}{[[]]}[]{}}{[()]}[]{(([{{[{[]}]}[{}]}]))}(){}{{}}[]((([])([{(){}[(()[]((()(){})({([]({{{[]{}}[({})()({}{([()])()()[]{}})][{[]}]{{}([]({{{(()(({}[[[{{}}]]{{[()]([[{{}([[]][([{{}}(([])[][({()}())()({}[])]{}[])]())[]]){}}[]]])([]({{[[][]{[]}[]]}}{}(){[]}))}()[]((){{}()[{[[()]]}()]}[()]{})}][]{}))())}(())}{{[]}{}}({[([{[{[[[]]]{()}[]}]{}}()((({{{{({{(){}}}[[()]()[]]())({{{[]}{{[[{{[{}]}}[][]]]([][](()(()[]){{}}))([])}}}}[{}{}])[(){{()()}{(())}()}]{(){{}[]{}[][{[]([[]()]{(){[{}[()]][{}{}]{(){}}}{[]}}{[]}[]){[]}[]}][((){}{}[[[[{{}()[([({{[[][{{()}(([[]][[[[[[[{}]][{}]]]()](())[()[][]({({[][][[]{}][]}{})}{({})([[][]({}{[]})])[([([])][[]{([])(({}))}](()[]){[[]]}({}))]}[])()]]]))([{}()()([([[{}][()]][])])][[[{}][][]({[]})][(({{()}}))]])}]]}})])]}]]]])]}}}}}})))])]})}))}}}))})))]}])))") // Yes
