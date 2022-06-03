import Foundation

/*
 _  _         _      _____     _    _
| || |__ _ __| |_   |_   _|_ _| |__| |___ ___
| __ / _` (_-< ' \    | |/ _` | '_ \ / -_|_-<
|_||_\__,_/__/_||_|   |_|\__,_|_.__/_\___/__/

 */

// MARK: - Strings, Integers, Floating point numbers and Booleans
// are all hashable by default.
// Hash values are not equal everytime bc it changes based on runtime
let stringsAreHashable = "abc".hashValue


// MARK: - Old version of creating hashValues for custom types
// now you can just add Hashable protocol
struct GridPoint {
    var x: Int
    var y: Int
    
    var hashValue: Int {
        // XOR properties together seeded with a prime number
        return x.hashValue ^ y.hashValue &* 16777619
    }
}

let mainBase = GridPoint(x: 131, y: 541)
let hashCode = mainBase.hashValue

// MARK: - Modulus operator
// used to convert hash code into index (using hasCode % initialsSizeOfArray)
let even = 2 % 2
let odd = 3 % 2 // remainder 1

let initialSize = 16
let index = hashCode % initialSize // guaranteed fit

let indexPositive = abs(index)



// MARK: - Build HashTable / Dictionary from scratch

// Link List
// Doesn't need all functions
// Can be a simple class with key, value, and next
class HashEntry {
    var key: String
    var value: String
    var next: HashEntry?
    
    init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
}


// Never need to build HashTable from scratch
// ..this is to build the BTS for how they work
class HashTable {
    private static let initialSize = 256  // initial size of array
    
    // entries = store collisions in a link list
    private var entries = Array<HashEntry?>(repeating: nil, count: initialSize)
    
    // Put data into a key-value pair
    func put(_ key: String, _ value: String) {
        // Generate the index for the data
        let index = generateIndex(key)
        
        // Create entry
        let entry = HashEntry(key, value)
        
        // If entry is not already there - store it in array
        if entries[index] == nil {
            entries[index] = entry
        } else {
            // else handle collision by appending to link list
            var collisions = entries[index]
            
            // Walk to the end
            while collisions?.next != nil {
                collisions = collisions?.next
            }
            
            // Add entry causing collision to end of link list
            collisions?.next = entry
        }
    }
    
    // Get index of data (hash function)
    private func generateIndex(_ key: String) -> Int {
         // Get the key's hash code (using abs)
        let hashCode = abs(key.hashValue)
        
        // Convert hash code into index of the array
        let index = hashCode % HashTable.initialSize
        print("\(key) \(hashCode) \(index)")
        
        // EX: Forced collision for demo
        if key == "John Smith" || key == "Sandra Dee" {
            return 252
        }
        
        return index
    }
    
    
    // Get data using key
    func get(_ key: String) -> String? {
        // Generate the index for the data
        let index = generateIndex(key)
        
        // Get current list of entries for this index
        // ..if two objects have same index == collision
        let possibleCollisions = entries[index]
        
        // Walk our linked list looking for a possible match
        // ...on the key (that will be unique)
        var currentEntry = possibleCollisions
        while currentEntry != nil {
            if currentEntry?.key == key {
                return currentEntry?.value
            }
            currentEntry = currentEntry?.next
        }
        
        return nil
    }
    
    // Use subscript to set new objects or get existing objects
    subscript(key: String) -> String? {
        get {
            get(key)
        }
        set(newValue) {
            guard let value = newValue else { return }
            put(key, value)
        }
    }
    
    // Pretty print to show collision
    func prettyPrint() {
        for entry in entries {
            if entry == nil {
                continue
            }
            if entry?.next == nil {
                // nothing else there
                print("key: \(String(describing: entry?.key)) value: \(String(describing: entry?.value))")
            } else {
                // collisions
                var currentEntry = entry
                while currentEntry?.next != nil {
                    print("💥 key: \(String(describing: currentEntry?.key)) value: \(String(describing: currentEntry?.value))")
                    currentEntry = currentEntry?.next
                }
                print("💥 key: \(String(describing: currentEntry?.key)) value: \(String(describing: currentEntry?.value))")
            }
        }
    }
}



// MARK: - TEST CASES

let hashTable = HashTable()

// Put all entries into the hashTable
hashTable.put("John Smith", "521-1234")
hashTable.put("Lisa Smith", "521-8976")
hashTable.put("Sam Doe", "521-5030")
hashTable.put("Sandra Dee", "521-9655")
hashTable.put("Ted Baker", "418-4165")

// Prints forced collision btwn John Smith + Sandra Dee over index 252
hashTable.prettyPrint()

// Get object data using key
hashTable.get("John Smith")
hashTable.get("Lisa Smith")
hashTable.get("Sam Doe")
hashTable.get("Sandra Dee")
hashTable.get("Ted Baker")
hashTable.get("Tim Lee")       // nil (for someone not on the list)

// Use subscript to set new objects or get existing objects
hashTable["Kevin Flynn"] = "The grid"
hashTable["Kevin Flynn"]
