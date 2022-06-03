import UIKit

/*
 ___ _       ___    ___        _                _
| _ |_)__ _ / _ \  | _ \___ __| |_  _ __ ___ __| |
| _ \ / _` | (_) | |   / -_) _` | || / _/ -_) _` |
|___/_\__, |\___/  |_|_\___\__,_|\_,_\__\___\__,_|
      |___/

 */


// MARK: - RULE 1: DROP THE NON-DOMINANT
// O(1) + O(n) + O(n^2)
// Non-dom: O(1) + O(n)
// Dom: O(n^2)
// Reduced: O(n^2)
func someFunc(_ n: Int) {
    var a = 0
    a = 5
    a += 1  // O(1)
    
    for _ in 0..<n {  // O(n)
        // simple statements
    }
    
    // O(n^2) = Dominant term
    // ..does the heavy lifting
    for _ in 0..<n {
        // simple statements
        for _ in 0..<n {
            // simple statements
        }
    }
}



// MARK: - RULE 2: DROP THE CONSTANTS
// O(n) + O(n) + O(n)
// Reduced: O(n)
func dropConstants(_ n: Int) {
    for _ in 0..<n { // O(n)
        // simple statements
    }

    for _ in 0..<n { // O(n)
        // simple statements
    }

    for _ in 0..<n { // O(n)
        // simple statements
    }
}



// MARK: - RULE 3: ADD DOMINANT
// O(n) + O(m)
// Reduced: O(n+m)
func addDominant(_ n: Int, _ m: Int) {
    for _ in 0..<n { // O(n)
        // simple statements
    }

    for _ in 0..<m { // O(m)
        // simple statements
    }
}



// MARK: - RULE 4: MULTIPLY NESTED
// Reduced: O(n*m)
func nested(_ n: Int, _ m: Int) {
    for _ in 0..<n { // O(n)
        // simple statements
        for _ in 0..<m { // O(m)
            // simple statements
        }
    }
}



// MARK: - CHALLENGES

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    
    var len = 0
    var current = head
    while current != nil {
        len += 1
        current = current?.next
    }
    return len
}

// CHALLENGE 1
// O(m) + O(n) + O(m*n)
// REDUCED: O(m*n)
func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    let m = length(headA)  // O(m) - non-dom
    let n = length(headB)  // O(n) - non-dom
    
    var currentA = headA
    
    for _ in 0..<m {  // O(m) - loops through headA count
        var currentB = headB
        for _ in 0..<n {  // O(n) - loops through headB count
            let A = currentA?.data
            let B = currentB?.data
            print("A: \(A ?? 0) B: \(B ?? 0)")
            if A == B {
                return A
            }
            currentB = currentB?.next
        }
    
        currentA = currentA?.next
    }
    
    return nil
}


// O(a) + O(b) + O(a) + O(b)
// O(2a) + O(2b)
// Reduced: O(a+b)
func findMergeSpaceTime(headA: Node?, headB: Node?) -> Int? {
    // Create a Dict of all nodes of B
    // ..use it to loop through each element of A
    let aLen = length(headA) // O(a)
    let bLen = length(headB) // O(b)
    
    var dictB = [Int?: Bool]()
    var currentB = headB
    
    // Build dictB
    for _ in 0..<bLen {  // O(b)
        let bValue = currentB?.data
        dictB[bValue] = true
        currentB = currentB?.next
    }
    
    // Check if aValue is in dictB
    var currentA = headA
    for _ in 0..<aLen {  // O(a)
        let aValue = currentA?.data
        if dictB[aValue] == true {
            return aValue
        }
        currentA = currentA?.next
    }
    
    return nil
}



// O(a) + O(b) + O(a) + O(b)
// O(a + b)
func findMergeInsight(headA: Node?, headB: Node?) -> Int? {
    // Figure out which is longer
    
    let aLen = length(headA) // O(a)
    let bLen = length(headB) // O(b)
    
    var currentA = headA
    var currentB = headB
    
    // Swap if necessary
    if aLen < bLen {
        let temp = currentA
        currentA = currentB
        currentB = temp
    }
    
    // Abs = if diff is negative
    let lenDiff = abs(aLen - bLen)
    
    // Only walk through lenDiff of listA
    for _ in 0..<lenDiff {  // could be O(a) or O(b) - select either
        currentA = currentA?.next
    }
    
    // Check if any bValue matches with aValue
    for _ in 0..<bLen {  // O(n)
        let aValue = currentA?.data
        let bValue = currentB?.data
        if aValue == bValue {
            return aValue
        }
        currentA = currentA?.next
        currentB = currentB?.next
    }
    
    return nil
}


// MARK: - REDUCTION EXAMPLES

// Ex: O(n + log n)
// Reduces: O(n) = linear
// ..why? Drop O(log n), keep O(n) is worst case


// Ex: O(7*2^n + 5000*n^99)
// Reduces: O(2^n) = exponential
// ..why? Reduces to O(2^n + n^2). Drop n^2, and keep O(2^n)



func someConditional(_ n: Int) {
    if n == 2 {
        for _ in 0..<n {
            // simple statements
        }
    } else {
        for _ in 0..<n {
            // simple statements
            for _ in 0..<n {
                // simple statements
            }
        }
    }
}












/*
   _                  _
  /_\  _ _ __ __ _ __| |___
 / _ \| '_/ _/ _` / _` / -_)
/_/ \_\_| \__\__,_\__,_\___|
 
 */

func foo(_ n: Int) {
    for _ in 0..<n {
        // ...
    }
    for _ in 0..<n {
        // ...
    }
}

func bar(_ n: Int, _ m: Int) {
    for _ in 0..<n {
        // ...
        for _ in 0..<m {
            // ...
        }
    }
}

func baz(_ array: [Int]) {
    for i in 0..<array.count {
        // ...
        for j in 0..<array.count {
            // ...
            if array[i] == array[j] {
                // Launch!
            }
        }
    }
}

func bep(_ array: [Int]) {
    for _ in 0..<array.count {
        // ...
        for _ in 0..<array.count {
            // ...
            for _ in 0..<999999999 {
                // Jump!
            }
        }
    }
}






// foo > O(2n) > O(n)
// bar > O(n*m)
// baz > O(n^2)
// bep > O(n^2)
