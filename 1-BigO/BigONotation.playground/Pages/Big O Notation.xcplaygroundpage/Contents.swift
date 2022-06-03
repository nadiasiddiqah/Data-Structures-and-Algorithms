/*
 ___ _         ___    _  _     _        _   _
| _ |_)__ _   / _ \  | \| |___| |_ __ _| |_(_)___ _ _
| _ \ / _` | | (_) | | .` / _ \  _/ _` |  _| / _ \ ' \
|___/_\__, |  \___/  |_|\_\___/\__\__,_|\__|_\___/_||_|
      |___/
 */

import Foundation

// MARK: - Constant time O(1)
func constantTime(_ n: Int) -> Int {
    let result = n * n
    return result
}

var arr = [1, 2, 3]
arr.append(4)  // complexity: O(1)
// sometimes O(n) when array needs to resize itself

var set1 = Set<Int>()
set.count // complexity: O(1)









// MARK: - Linear time O(n)
func findNemo(_ arr: [String]) {
    let before = Date()
    
    for i in 0..<arr.count {
        if arr[i] == "nemo" {
            print("Found him!")
        }
    }
    
    let after = Date()
    let component = Calendar.current.dateComponents([.nanosecond], from: before, to: after)
    let milliSeconds: Double = Double(component.nanosecond! / 1000000)
//    print("Finding nemo took: \(milliSeconds))")
}

//let nemo = ["nemo"]
let nemo = Array<String>(repeating: "", count: 100000)
findNemo(nemo)








func linearTime(_ A: [Int]) -> Int {
    for i in 0..<A.count {
        if A[i] == 0 {
            return 0
        }
//        print(i)
    }
    return 1
}

linearTime([1, 2, 3])








// MARK: - Logarithmic time O(log n)
func logarithmicTime(_ N: Int) -> Int {
    var n = N
    var result = 0
    while n > 1 {
        n /= 2
//        print(n)
        result += 1
    }
    return result
}

logarithmicTime(128)








// Quadratic time O(n^2)
func quadratic(_ n: Int) -> Int {
    var result = 0
    for i in 0..<n {
        for j in i..<n {
            result += 1
//            print("\(i) \(j)")
        }
    }
    return result
}
quadratic(16)



















