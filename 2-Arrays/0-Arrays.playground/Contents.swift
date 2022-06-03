import UIKit

/*
   _
  /_\  _ _ _ _ __ _ _  _ ___
 / _ \| '_| '_/ _` | || (_-<
/_/ \_\_| |_| \__,_|\_, /__/
                    |__/
 */

struct Person {}

// MARK: - Arrays can contain anything
let int = [Int]()  // integers
let strings = [String]()  // strings
let people = [Person]()  // objects

// MARK: - Array operations (GET, APPEND, INSERT, DELETE)
var array = ["a", "b", "c", "d"]
var array1 = ["e", "f", "g"]
array[0]                          // get = O(1)
array.append("y")                 // append one element = O(1)
array.append(contentsOf: array1)  // appened many elements = O(n)
array.insert("z", at: 1)          // insert = O(n)
array.remove(at: 4)               // delete = O(n)

// MARK: - Arrays are fixed size
// O(1) to add one element
var array2 = ["a", "b", "c", "d"]
array2.append("e")  // O(1)

// MARK: - Arrays can shrink and grow - O(n)
var array3 = ["f", "g", "h"]
array2.append(contentsOf: array3)  // grow = O(n)
array2.removeSubrange(0..<3)       // shrink = O(n)=

// MARK: - Creating array of a specific size
let tenItemArray = Array(repeating: 1, count: 10)
print(tenItemArray)
