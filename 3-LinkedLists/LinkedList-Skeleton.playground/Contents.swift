import Foundation

// MARK: - A linked list is simply a node with a pointer to next
class Node {        // represent node as a class
    // data needed for Node: data and next
    var data: Int   // can be anything
    var next: Node? // next link is optional
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}





/* MARK: - Chain of nodes:
node1 (head) -> node2 -> node3 (tail)
*/
let node3 = Node(3)          // no/nil next parameter = tail of the linked list
let node2 = Node(2, node3)   // hooks node2 to node3
let node1 = Node(1, node2)   // hooks node1 to node2

// MARK: - We can print nodes by "walking the list"
func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}

/*
printLinkedListSimple(node1) // 1 2 3  (prints linked list)
*/

// MARK: - HOW TO BUILD A PRATICAL LINKEDLIST
class LinkList {
    // Head of LinkList
    private var head: Node?
    
    // Functions of LinkList
    
    // MARK: - O(1): insert element to front of the list
    func addFront(_ data: Int) {
        let newNode = Node(data)   // create newNode using data passed in
        newNode.next = head        // point its next to the head
        head = newNode             // redirect head's pointer to newNode
    }
    
    
    
    // MARK: - O(1): get first element in list
    func getFirst() -> Int? {
        if head == nil {           // check if head is nil == no elements
            return nil
        }
        
        return head!.data
    }
    
    
    
    // MARK: - O(n): insert element to back of the list
    func addBack(_ data: Int) {
        let newNode = Node(data)     // create newNode using data passed in
        
        if head == nil {             // if no head, add newNode as head
            head = newNode
            return
        }
        
        // walking through linked list starting from the head
        var node = head!            // start with head of the linked list
        while(node.next != nil) {   // update node with each node in the list
            node = node.next!       // ..until you reach last node
        }
        node.next = newNode         // point last node's next to newNode
                                    // ..making newNode == last node in list
    }
    
    
    
    // MARK: - O(n): get last element in list
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        
        // walking through linked list starting from the head
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        
        return node.data
    }
    
    
    
    // MARK: - O(n): insert new element into specific position
    func insert(position: Int, data: Int) {
        if position == 0 {           // if position is 1, add data to front
            addFront(data)
            return
        }
        
        let newNode = Node(data)              // create newNode
        var currentNode = head                // set head as currentNode
        
        // walking through linked list starting from head to (position-1)
        // ..zero-index starts @ 0, position starts @ 1 (so check position-1 in zero-index)
        for _ in 0..<(position-1) {
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next      // set newNode's next to currentNode's next
        currentNode?.next = newNode           // set currentNode's next to newNode
    }
    
    
    
    // MARK: - O(1): delete first element in list
    func deleteFirst() {
        head = head?.next   // move head to next element in list (to delete first element)
    }
    
    
    
    // MARK: - O(n): delete last element in list
    func deleteLast() {
        var nextNode = head
        var previousNode: Node?

        while(nextNode?.next != nil) {
            previousNode = nextNode
            nextNode = nextNode?.next
        }

        previousNode?.next = nil
    }
    
    
    // MARK: - O(n): delete element at specified position
    func delete(position: Int) {
        if position == 0 {
            self.deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        
        // walking through linked list starting from head to position
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        previousNode?.next = nextNode?.next   // skip over position
    }
    
    
    
    // MARK: - O(n): check if linked list in nil
    var isEmpty: Bool {
        return head == nil
    }
    
    
    // MARK: - O(n): clear out linked list
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
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
}


// Test linkedList
let linkedList = LinkList()

// Test addFront(_ : Int)
linkedList.addFront(3)        // add data backwards if adding to the front of the list
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()  // [1, 2, 3]

linkedList.addFront(4)
linkedList.printLinkedList()  // [4, 1, 2, 3]

// Test getFirst()
linkedList.getFirst()         // 4

// Test addBack(_ : Int)
linkedList.addBack(5)
linkedList.printLinkedList()  // [4, 1, 2, 3, 5]

// Test getLast()
linkedList.getLast()          // 5

// Test insert(position: Int, _ : Int)
linkedList.insert(position: 2, data: 6)
linkedList.printLinkedList()  // [4, 1, 6, 2, 3, 5]

// Test deleteFirst()
linkedList.deleteFirst()
linkedList.printLinkedList()   // [1, 6, 2, 3, 5] (removed 4)

// Test deleteLast()
linkedList.deleteLast()
linkedList.printLinkedList()   // [1, 6, 2, 3] (deletes 5)

// Test delete(position: Int)
linkedList.delete(position: 1)
linkedList.printLinkedList()   // [1, 2, 3] (delete 6)

// Test isEmpty var
linkedList.isEmpty             // false

// Test clear()
linkedList.clear()             // nil

// Double check clear() by adding to front
linkedList.addFront(1)
linkedList.printLinkedList()   // [1]
