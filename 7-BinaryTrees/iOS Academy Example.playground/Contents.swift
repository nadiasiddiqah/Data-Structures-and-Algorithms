import UIKit

// Binary search assumes array is in sorted order

let array = [1, 3, 4, 5, 12, 13, 22, 31, 72]

func binarySearch(_ array: [Int], _ value: Int) -> Int? {
    guard !array.isEmpty else { return nil }
    
    var left = 0
    var right = array.count - 1
    
    if array.count == 1 {
        return array[0] == value ? 0 : nil
    }
    
    while left <= right {  // O(log n)
        let midIndex = (left + right) / 2
        let midValue = array[midIndex]
        
        if midValue > value {
            right = midIndex - 1
        } else if midValue < value {
            left = midIndex + 1
        } else if midValue == value {
            return midIndex
        }
    }
    
    return nil
}

let foundIndex = binarySearch(array, 32)
print("\(foundIndex ?? -1)")
