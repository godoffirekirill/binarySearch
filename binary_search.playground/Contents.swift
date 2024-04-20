import Cocoa

func binarySearch<T: Comparable>(_ array: [T], _ item: T) -> Int? {
    var low = 0
    var high = array.count - 1

    while low <= high {
        let mid = (low + high) / 2
        let guess = array[mid]

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
