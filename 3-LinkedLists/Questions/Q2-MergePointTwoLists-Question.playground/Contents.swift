import UIKit
import Darwin

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

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

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}




// MARK: - My solution - O(n^2)
func findMerge(headA: Node?, headB: Node?) -> Int? {
    var nodeA = headA
    var aArr = [Int]()
    
    var nodeB = headB
    var bArr = [Int]()
    
    var match: Int?
    
    while(nodeA?.next != nil && nodeB?.next != nil) {  // O(n)
        if let aValue = nodeA?.data, let bValue = nodeB?.data {
            // Add each list's node data into an array
            aArr.append(aValue)
            bArr.append(bValue)
            
            // Check if aArr contains bValue, if so break loop
            for b in bArr {   // O(n)
                if aArr.contains(b) {
                    match = b
                    break
                }
            }
            
            // If aArr doesn't contain bValue
            // ..walk to next node in the list
            nodeA = nodeA?.next
            nodeB = nodeB?.next
        }
    }
    
    return match
}




// MARK: - Brute force -> O(m*n) -> reduced to O(n^2)
func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    let m = length(headA)  // O(m)
    let n = length(headB)  // O(n)
    
    var currentA = headA
    
    for _ in 0..<m {  // O(m)
        var currentB = headB
        for _ in 0..<n {  // O(n)
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




// MARK: - Time-efficient solution (use dictionary to trade-off time for space)
// O(2a+2b) -> reduces to -> O(n)
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



// MARK: - INSIGHT SOLUTION O(n)
func findMergeInsight(headA: Node?, headB: Node?) -> Int? {
    // Figure out which is longer
    
    let aLen = length(headA) // O(n)
    let bLen = length(headB) // O(n)
    
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
    for _ in 0..<lenDiff {  // O(n)
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



// MARK: - TEST CASE
// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 12 13 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

printLinkedList(node1)
printLinkedList(node10)

findMerge(headA: node10, headB: node1)   // 4
