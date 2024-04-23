import Cocoa

func binarySearch<T: Comparable>(_ array: [T], _ item: T) -> Int? {
    var low = 0
    var high = array.count - 1

    while low <= high {
        let mid = (low + high) / 2
        let guess = array[mid]
        print("low: \(low), high: \(high), mid: \(mid), guess: \(guess)")

        if guess == item {
            return mid
        }

        if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return nil
}

// Example usage:
let myList = [1, 3, 5, 7, 9]
if let index = binarySearch(myList, 7) {
    print("Item found at index: \(index)")
} else {
    print("Item not found")
}
func findSmallest(_ arr: inout [Int]) -> Int {
    guard !arr.isEmpty else { return -1 } // Handle empty array edge case
    var smallestIndex = 0
    for i in 1..<arr.count {
        if arr[i] < arr[smallestIndex] {
            smallestIndex = i
        }
    }
    return smallestIndex
}

func selectionSort(_ arr: [Int]) -> [Int] {
    var newArr = [Int]()
    var mutableArr = arr

    while !mutableArr.isEmpty {
        let smallestIndex = findSmallest(&mutableArr)
        if smallestIndex == -1 { break } // In case of an empty array, stop processing
        newArr.append(mutableArr.remove(at: smallestIndex))
    }

    return newArr
}

// Example usage:
let sortedArray = selectionSort([5, 3, 6, 2, 10])
print(sortedArray)

// рекурсия
class Box {
    var contents: [Box]
    var hasKey: Bool

    init(contents: [Box], hasKey: Bool = false) {
        self.contents = contents
        self.hasKey = hasKey
    }

    func lookForKey() {
        var pile: [Box] = [self] // Start with this box

        while !pile.isEmpty {
            let box = pile.removeLast() // Grab a box
            for item in box.contents {
                if item.hasKey {
                    print("Found the key!")
                    return
                } else {
                    pile.append(item) // If it's a box, add to the pile
                }
            }
        }
    }
    func lookForKeyRecursion() {
        for item in contents {
            if item.hasKey {
                print("Found the key!")
                return
            } else {
                item.lookForKeyRecursion() // Recursion here
            }
        }
    }
}


// Example usage
let innerBox = Box(contents: [], hasKey: true) // A box with a key
let outerBox = Box(contents: [innerBox]) // Outer box containing innerBox

outerBox.lookForKey()



    // Recursive function to look for a key


// Example usage
let smallBox = Box(contents: [], hasKey: true)
let mediumBox = Box(contents: [smallBox], hasKey: false)
let largeBox = Box(contents: [mediumBox], hasKey: false)

largeBox.lookForKeyRecursion()
