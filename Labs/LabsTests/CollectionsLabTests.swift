import XCTest

class CollectionsLabTests: XCTestCase {

// Create Test of an empty Array of Strings, showing how to append string values to the Array.
// Then show how to change an array string entry.
    func testArray() {
        var fruits: [String] = []
        fruits.append("Apple")
        fruits.append("Pear")
        print(fruits)
        
        fruits[1] = "Orange"
        print(fruits)
    }

// Establish an array literal.  Creating for loops to print the array values on separate lines.
// Then enumerate the array values and print again usinga for loop on separate lines.
    func testEnumerateArray() {
        let fruits = ["Apples", "Bananas"]
        print(fruits)
        
        for fruit in fruits {
            print(fruit)
        }
        
        for (index, fruit) in fruits.enumerated() {
            print("\(index) \(fruit)")
        }
    }


    func testEnumerateDictionary() {
        let clothes = ["jeans": 49.99,"t-shirt": 29.99]
        print(clothes)
    }
    
    func testEnumerateDictionary2() {
        let clothes = ["jeans": 49.99,"t-shirt": 29.99]
        
        for (keys, value) in clothes {
            print(String(format: "\(keys) %.2f", value))
        }
        
        for (keys, _) in clothes {
            print(keys)
        }
        
        var sum = 0.0
        
        for (_, value) in clothes {
            sum += value
        }
        print(sum)
    }
}
