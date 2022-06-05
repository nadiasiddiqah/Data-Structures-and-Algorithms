import UIKit

let numbers = [1, 4, 6, 7, 10, 12, 18, 19, 23, 24, 34, 44, 58, 65]

func binarySearch(array: [Int], key: Int) -> Bool {
    
    // Edge case if array doesn't have values
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex/2
    let midValue = array[midIndex]    // value at the middle index
    
    // Check if key is within min/max bounds of the array
    if key < array[minIndex] || key > array[maxIndex] {
        print("\(key) is not in the array")
        return false
    }
    
    // Check if key is greater than midValue
    if key > midValue {
        // create an array slice for upper half of array
        let slice = Array(array[midIndex + 1...maxIndex])
        // recursively try to find key in this slice
        return binarySearch(array: slice, key: key)
    }
    
    // Check if key is less than midValue
    if key < midValue {
        // create an array slice for lower half of array
        let slice = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }
    
    if key == midValue {
        print("\(key) found in the array")
        return true
    }
    
    return key == midValue
}

binarySearch(array: numbers, key: 10)
