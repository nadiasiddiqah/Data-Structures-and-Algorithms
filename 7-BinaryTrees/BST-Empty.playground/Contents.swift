import Foundation
import XCTest

/*
 ___ _                      ___                  _      _____
| _ |_)_ _  __ _ _ _ _  _  / __| ___ __ _ _ _ __| |_   |_   _| _ ___ ___
| _ \ | ' \/ _` | '_| || | \__ \/ -_) _` | '_/ _| ' \    | || '_/ -_) -_)
|___/_|_||_\__,_|_|  \_, | |___/\___\__,_|_| \__|_||_|   |_||_| \___\___|
                     |__/
 */

// MARK: - Node of BST (similar to node of link link)
class Node {
    var key: Int = 0   // reps way we find things in the tree
    var left: Node?    // left node (leaves of tree)
    var right: Node?   // right node
    
    init(_ key: Int) {
        self.key = key
    }
    
    var min: Node {
        // if there is no left, then we are at the min
        if left == nil {
            return self
        } else {
            // else, keep walking down the left to find min
            return left!.min
        }
    }
}

// MARK: - Create BST class
class BST {
    var root: Node?
    
    // MARK: - Public BST Find Function
    func find(key: Int) -> Int? {
        // check to see if root is nil (no tree)
        guard let root = root else { return nil }
        
        // use recursive find function
        // ..to walk through tree until you find the key
        guard let node = find(root, key) else { return nil }
        
        // return key found
        return node.key
    }
    
    // Private find: to do recursive walks through nodes of BST
    private func find(_ node: Node?, _ key: Int) -> Node? {
        // check to see if node is not nil
        guard let node = node else { return nil }
        
        // walk through down the nodes of the tree
        
        // check if current node's key is the key we're looking for
        if node.key == key {
            return node
        } else if key < node.key {
            // else, if current node's key is > than key, shift to left node
            return find(node.left, key)
        } else if key > node.key {
            // else, if current node's key is < than key, shift to right node
            return find(node.right, key)
        }
        
        // if no key is found
        return nil
    }
    
    // MARK: - Public BST Insert Function
    func insert(key: Int) {
        // Start with root and key that needs to be inserted
        root = insertItem(root, key)
    }
    
    // insert 5 3 2 4 7 6 8
    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        // Check that node exists
        // ..skip down, if it does
        // ..else, set the key as the node
        guard let node = node else {
            let node = Node(key)
            return node
        }
        
        // If key is < than currentNode's key
        // ..insert key to left of node
        if key < node.key {
            node.left = insertItem(node.left, key)
        }
        
        // If key is > than currentNode's key
        // ..insert key to right of node
        if key > node.key {
            node.right = insertItem(node.right, key)
        }
        
        return node
    }
    
    // MARK: - Public BST Delete Function
    func delete(key: Int) {
        guard let _ = root else { return }
        
        // & = pointer to root node + allows root to be passed by reference
        // w/o & = root is passed by value (as a copy)
        root = delete(&root, key)
    }
    
    // inout = gets a reference to the root node (not a copy)
    private func delete(_ node: inout Node?, _ key: Int) -> Node? {
        guard let nd = node else { return nil }
        
        if key < nd.key {
            nd.left = delete(&nd.left, key)
        } else if key > nd.key {
            nd.right = delete(&nd.right, key)
        } else {
            // Found node we want to delete
            
            // Case 1: No child
            if nd.left == nil && nd.right == nil {
                node = nil        // set node to nil to delete
            }
            
            // Case 2: One child
            else if nd.left == nil {
                node = nd.right   // delete node by replacing it with right node
            } else if nd.right == nil {
                node = nd.left    // delete node by replacing it with left node
            }
            
            // Case 3: Two children
            else {
                // Find the min node on the right (could also find max on left)
                let minRight = findMin(nd.right!)
                
                // Delete node value by replacing with min node
                node!.key = minRight.key
                
                // Delete min node we just duplicated (same key)
                node!.right = delete(&node!.right, node!.key)
            }
        }
        
        return node
    }
    
    
    // MARK: - Public BST Find Min Function
    func findMin() -> Int {
        return 0
    }

    private func findMin(_ node: Node) -> Node {
        return Node(0)
    }
    
    
    
    // MARK: - Inorder traversal (left right)
    func printInOrderTraversal() {
        inOrderTraversal(node: root)
    }
    
    func inOrderTraversal(node: Node?) {
        guard let node = node else { return }
        inOrderTraversal(node: node.left)
        print(node.key)  // root
        inOrderTraversal(node: node.right)
    }
    
    
    
    // MARK: - Preorder traversal (top down)
    func printPreOrderTraversal() {
        preOrderTraversal(node: root)
    }
    
    func preOrderTraversal(node: Node?) {
        guard let node = node else { return }
        print(node.key) // root
        preOrderTraversal(node: node.left)
        preOrderTraversal(node: node.right)
    }
    
    
    
    // MARK: - Postorder traversal (bottom up)
    func printPostOrderTraversal() {
        postOrderTraversal(node: root)
    }
    
    func postOrderTraversal(node: Node?) {
        guard let node = node else { return }
        postOrderTraversal(node: node.left)
        postOrderTraversal(node: node.right)
        print(node.key) // root
    }
    
    
    
    func prettyPrint() {
        // Hard code print for tree depth = 3
        let rootLeftKey = root?.left == nil ? 0 : root?.left?.key
        let rootRightKey = root?.right == nil ? 0 : root?.right?.key

        var rootLeftLeftKey = 0
        var rootLeftRightKey = 0

        if root?.left != nil {
            rootLeftLeftKey = root?.left?.left == nil ? 0 : root?.left?.left?.key as! Int
            rootLeftRightKey = root?.left?.right == nil ? 0 : root?.left?.right?.key as! Int
        }

        var rootRightLeftKey = 0
        var rootRightRightKey = 0

        if root?.right != nil {
            rootRightLeftKey = root?.right?.left == nil ? 0 : root?.right?.left?.key as! Int
            rootRightRightKey = root?.right?.right == nil ? 0 : root?.right?.right?.key as! Int
        }

        let str = """
                       \(root!.key)
                    /    \\
                   \(rootLeftKey!)      \(rootRightKey!)
                  / \\    /  \\
                 \(rootLeftLeftKey)   \(rootLeftRightKey)  \(rootRightLeftKey)    \(rootRightRightKey)
        """

        print(str)
    }
}

class BSTTests: XCTestCase {
    var bst: BST!
    override func setUp() {
        super.setUp()
        bst = BST()
    }
    
    func testInsert() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        
        bst.prettyPrint()
        
        // MARK: - TEST CASES FOR ORDER TRAVERSAL
//        bst.printInOrderTraversal()
//        bst.printPreOrderTraversal()
//        bst.printPostOrderTraversal()
//        XCTAssertNotNil(bst.find(key: 5))
    }
    
    func testDeleteNoChild() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        
        XCTAssertNotNil(bst.find(key: 2))
        bst.delete(key: 2)
        XCTAssertNil(bst.find(key: 2))
    }

    func testDeleteOneChild() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
//        bst.insert(key: 8)
        
        bst.delete(key: 7)
        XCTAssertNil(bst.find(key: 7))
    }

    func testDeleteTwoChildren() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        
        bst.delete(key: 7)
        XCTAssertNil(bst.find(key: 7))
        XCTAssertNotNil(6)
        XCTAssertNotNil(8)
    }
}


// Infrastructure for running unit tests in playground

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
BSTTests.defaultTestSuite.run()

