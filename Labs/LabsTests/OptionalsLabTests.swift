import XCTest
@testable import Labs

let address1 = Address(street: "Main Street", city: "Mahwah", state: "New Jersey")
let address2 = Address(street: "Main Street", city: "Mahwah", state: "New Jersey", street2: "Hopper Court")

var customers = [Customer(name: "Bobby Koprowski", address: "18 Hopper Court"),
                Customer(name: "Will Boelte", address: nil),
                Customer(name: "John Smith", address: "address1")]

class OptionalsLabTests: XCTestCase {

    func testFullStreet() {
        print(address1.fullStreet)
        print(address2.fullStreet)
    }
    
    func testCustomer() {
        print(customers.description)
    }
    
    func testCustomerNamed() {
        let customer = customers.customer(named: "John Smith")
        print(customer ?? "not found")
    }
}
