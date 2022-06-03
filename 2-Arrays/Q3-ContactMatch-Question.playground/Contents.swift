import Foundation

/*
 When someone searches their contacts based on a phone number, it's nice when a list
 of contact pops up.
 
 Write an algorithm that searches you contacts for phone number strings, and returns:
  - NO CONTACT if contact can't be found
  - A contact if a contact is found
  - The first alphabetized contact if there are multiple
 
 A = ["pim", "pom"]             // Contacts (return one of these)
 B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
 P = "88999"                    // Search phrase

 Answer should be correct. Don't worry about performance.
 */

// SOLVED MYSELF :) 
public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    var contactMatch = [String]()
    
    for (index, phoneNo) in B.enumerated() {  // O(n)
        if phoneNo.contains(P) {
            contactMatch.append(A[index])
        }
    }
    
    if contactMatch.count > 1 {
        contactMatch = contactMatch.sorted()  // O(n log n)
    } else if contactMatch.count == 0 {
        contactMatch.append("NO CONTACT")
    }
    
    return contactMatch[0]
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P)   // pom
solution(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")   // NO CONTACT

// edge cases
solution([String](), [String](), "")
solution(A, B, "")



// GIVEN SOLUTION
public func givenSolution(_ A : [String], _ B : [String], _ P : String) -> String {
    var result = [String]()
    
    for i in 0..<B.count {  // O(n)
        if B[i].contains(P) {
            result.append(A[i])
        }
    }
    
    if result.count == 0 {
        return "NO CONTACT"
    } else if result.count == 1 {
        return result[0]
    }
    
    return result.sorted()[0]  // O(n log n)
}



