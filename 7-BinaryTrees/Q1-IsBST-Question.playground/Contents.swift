import Foundation
import XCTest

/*
 CheckBST
 https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
 
 Given the root node of a binary tree, determine if it is a binary search tree.
 
 The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func checkBST(root: Node?) -> Bool {
    return isBST(node: root, min: nil, max: nil)
}

private func isBST(node: Node?, min: Int?, max: Int?) -> Bool {
    print("Comparing: \(node?.key) min: \(min) max: \(max)")
    
    // if nil we hit the end of our branch
    // ..so we walk back up to the root
    guard let node = node else { return true }
    
    // else check if min < parent
    if let min = min, node.key <= min {
        print("min: \(min) key: \(node.key)")
        return false
    }
    
    // check if max > parent
    if let max = max, node.key >= max {
        print("max: \(max) key: \(node.key)")
        return false
    }
    
    let checkLeft = isBST(node: node.left, min: min, max: node.key)
    let checkRight = isBST(node: node.right, min: node.key, max: max)
    
    // if min max OK, go to next level passing in min/max and parent
    return checkLeft && checkRight
}

// MARK: - TEST CASES
let root1 = Node(4)
root1.left = Node(2)
root1.right = Node(6)
root1.left?.left = Node(1)
root1.left?.right = Node(3)
root1.right?.left = Node(5)
root1.right?.right = Node(7)

let root2 = Node(3)
root2.left = Node(2)
root2.right = Node(4)
root2.left?.left = Node(1)
root2.right?.left = Node(5)
root2.right?.right = Node(6)

let root3 = Node(3)
root3.left = Node(2)
root3.right = Node(5)
root3.left?.left = Node(1)
root3.right?.left = Node(6)
root3.right?.right = Node(1)

checkBST(root: root1)   // true
checkBST(root: root2)   // false bc 5 > 4 (on right)
checkBST(root: root3)   // false bc 6 > 5 (on right)


