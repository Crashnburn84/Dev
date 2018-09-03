import XCTest
@testable import Labs

let person = Person(firstName: "Jimmy", lastName: "Dean")
let person2 = Person(firstName: "John", lastName: "Smith")


class PersonLabTests: XCTestCase
{
    func testCreatePerson() {
        let person = Person(firstName: "John", lastName: "Smith")
        print("\(person.lastName), \(person.firstName)")
    }
    
    func testLikeable() {
        let john = Person(firstName: "John", lastName: "Smith")
        john.like()
        print(john)
    }
    // MARK: - Need to work on text for Friendable protocol swift programming (pg. 55)
    func testFriendable() {
        print(person)
    }
    
    func testMap() {
    let fruits = ["apple", "pear", "banana"]
    let capitalizedFruits = fruits.map { $0.capitalized }
    print(capitalizedFruits) // "[Apple, Pear, Banana]"
    }
    
    func testReduce() {
        let ints = 1...5
        let sum3 = ints.reduce(0, +)
        print(sum3)
    }
}
