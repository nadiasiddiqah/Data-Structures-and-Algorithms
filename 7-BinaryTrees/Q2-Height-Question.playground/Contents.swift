import Foundation
import XCTest
import Darwin

/*
 TreeHeight
 https://app.codility.com/programmers/lessons/99-future_training/tree_height/
 
 Height is the number of steps to the lowest leaf.
 Length of the longest path.
 Tree with one node has height of zero.
   
                    20
                  /    \
                8        22
              /   \
            4       12
                  /    \
                10      14
 */



class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.data = data
    }
    
    func height() -> Int? {
        if left == nil && right == nil {
            return 0
        } else {
            let leftHeight = left?.height() ?? 0
            let rightHeight = right?.height() ?? 0
            
            return 1 + max(leftHeight, rightHeight)
        }
    }

}

let bst = Node(20)
bst.left = Node(8)
bst.right = Node(22)
bst.left?.left = Node(4)
bst.left?.right = Node(12)
bst.left?.right?.left = Node(10)
bst.left?.right?.right = Node(14)

bst.height()






























class Node1 {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
    
    func height() -> Int {
        if isChild {
            print("\(self.key) isChild")
            return 0
        } else {
            let currentHeight = 1 + max(left?.height() ?? 0, right?.height() ?? 0)
            print("\(self.key) isParent")
            print("left: \(left?.height() ?? 0) right: \(right?.height() ?? 0) total: \(currentHeight)")
            return currentHeight
        }
    }
    
    var isChild: Bool {
        return left == nil && right == nil
    }
}

//let bst = Node(20)
//bst.left = Node(8)
//bst.right = Node(22)
//bst.left?.left = Node(4)
//bst.left?.right = Node(12)
//bst.left?.right?.left = Node(10)
//bst.left?.right?.right = Node(14)
//
//bst.height()
