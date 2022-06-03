import UIKit

/*
 Detect A Cycle
 https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
 https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
 
 A linked list is said to contain a cycle if any node is visited more than once while traversing the list. For example, in the following graph there is a cycle formed when node 5 points back to node 3.
 
        4
      /   \
 1 2 3      5
     \_____/
 
 */

class Node {
    var data: Int
    weak var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


// MARK: - MY SOLUTION - O(n)
func hasCycle(first: Node) -> Bool {
    var allValues = ""
    var repeatValues = ""
    
    var currentNode = first.next
    while(currentNode?.next != nil) {  // O(n)
        guard let val = currentNode?.data else { return false }
        
        if allValues.contains(String(val)) {
            repeatValues += String(val)
            if repeatValues.count >= 2 {
                if allValues.contains(repeatValues) {
                    return true
                }
            }
        } else {
            allValues += String(val)
        }
        
        currentNode = currentNode?.next
    }
    
    return false
}




// MARK: - INSIGHT SOLUTION - O(n)
func hasCycleInsight(first: Node) -> Bool {
    var slow: Node? = first
    var fast: Node? = first
    
    while fast != nil && fast!.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.data == fast?.data {
            return true
        }
    }

    return false
}





// MARK: - TEST CASE
let node5 = Node(5)
let node4 = Node(4)
let node3 = Node(3)
let node2 = Node(2)
let head = Node(1)

head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node3

hasCycleInsight(first: head)
