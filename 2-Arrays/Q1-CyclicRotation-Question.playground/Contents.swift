import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

// YOUR SOLUTION: O(n) - LINEAR RUNTIME
func solution(A: [Int], K: Int) -> [Int] {
    // Edge cases (ask interviewer if necessary / what return value should be)
    guard !A.isEmpty else { return A }
    guard K > 0 else { return A }
    guard A.count >= K else { return [] }
    
    var B = A
    
    for _ in 0..<K { // O(n)
        let removed = B.remove(at: B.count-1)
        B.insert(removed, at: 0)
    }
    
    return B
}

// GIVEN SOLUTION: O(n^2) - QUADRATIC RUNTIME
/*
func solution(A: [Int], K: Int) -> [Int] {
    var result = A
    
    for _ in 1...K { // O(n)
        result = rotateRightOnce(A: result)
    }
    
    return result
}

func rotateRightOnce(A: [Int]) -> [Int] {
    var newArray = Array(repeating: 0, count: A.count)
    
    for i in 0..<A.count - 1 {  // O(n)
        newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    
    return newArray
}

rotateRightOnce(A: [1, 2, 3, 4, 5])
*/

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]









