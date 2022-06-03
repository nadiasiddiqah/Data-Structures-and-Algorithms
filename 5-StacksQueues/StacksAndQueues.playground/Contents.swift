import UIKit

/*
 ___ _           _
 / __| |_ __ _ __| |__ ___
 \__ \  _/ _` / _| / /(_-<
 |___/\__\__,_\__|_\_\/__/
 
 */

/*
 Last-in first-out (LIFO)
 Push and pop are O(1) operations.
 */


// T = generic class (can be anything: Int, Str, Person)
class Stack<T> {
    private var array: [T] = []
    
    func push(_ item: T) {
        array.append(item)  // O(1), can be O(n) if resizing
    }
    
    func pop() -> T? {
        array.popLast()     // O(1)
    }
    
    func peek() -> T? {
        array.last          // O(1)
    }
    
    var isEmpty: Bool {
        array.isEmpty       // O(1)
    }
    
    var count: Int {
        array.count         // O(1)
    }
}

struct StackStruct<T> {
    fileprivate var array = [T]()
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T? {
        array.popLast()
    }
    
    var peek: T? {
        array.last
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}




/*
  ___
 / _ \ _  _ ___ _  _ ___ ___
 | (_) | || / -_) || / -_|_-<
 \__\_\\_,_\___|\_,_\___/__/
 
 */

/*
 First-in first-out (FIFO)
 enqueue O(1) dequeue O(n)
 */

class Queue<T> {
    private var array: [T] = []
    
    func enqueue(_ item: T) {
        array.append(item)
    }
    
    func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func peek() -> T? {
        return array.first
    }
}

struct QueueStruct<T> {
    private var array: [T] = []
    
    mutating func enqueue(_ item: T) {
        array.append(item)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func peek() -> T? {
        return array.first
    }
}

