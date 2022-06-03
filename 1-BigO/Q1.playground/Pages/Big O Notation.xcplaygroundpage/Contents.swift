/*
 ___ _         ___    _  _     _        _   _
| _ |_)__ _   / _ \  | \| |___| |_ __ _| |_(_)___ _ _
| _ \ / _` | | (_) | | .` / _ \  _/ _` |  _| / _ \ ' \
|___/_\__, |  \___/  |_|\_\___/\__\__,_|\__|_\___/_||_|
      |___/
 */

import Foundation
// MARK: - INTERVIEW EXAMPLE

/*
 Given two arrays, create a function that let's a user know whether these two arrays contain any common items.
 */





// Brute force approach

// Time: O(n^2) - quadratic, very slow
// Space: O(1) - linear, space efficient, function takes no more space than the arrays elements passed in, not creating extra data structures
func commonItemsBrute(_ A: [Int], _ B: [Int]) -> Bool {
    for i in 0..<A.count {
        for j in 0..<B.count {
            if A[i] == B[j] {
                return true
            }
        }
    }
    return false
}

commonItemsBrute([1, 2, 3], [4, 5, 6])
commonItemsBrute([1, 2, 3], [3, 5, 6])

// Convert to hash and lookup via other index
// Here we are trading off time for space

// Time: O(n) - linear, better!
// Space: O(n) - created extra data structure, create more memory relative to the size of the array elements passed in
func commonItemsHash(_ A: [Int], _ B: [Int]) -> Bool {
    var hashA = [Int: Bool]() // O(n)
   
    // Still looping but not nested - O(2n) vs O(n^2)
    for a in A {  // O(n)
        hashA[a] = true
    }
    
    // Now lookup in the hash to see if elements of B exist
    for b in B {
        if hashA[b] == true {
            return true
        }
    }
    
    return false
}

commonItemsHash([1, 2, 3], [4, 5, 6])
commonItemsHash([1, 2, 3], [3, 5, 6])



