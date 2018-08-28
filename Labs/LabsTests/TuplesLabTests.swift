import XCTest

let polos = (name: "polos", price: 29.99, quantity: 2)
typealias Clothes = (name: String, price: Double, quantity: Int)

func calculatedAmount(item: Clothes) -> (Double) {
    return(item.price * Double(item.quantity))
}

func formatted(item: Clothes) -> (text: String,amount: Double) {
    let amount = calculatedAmount(item: item)
    let text = "\(item.quantity) \(item.name) @ $\(item.price) = $\(amount)"
    return (text, amount)
}

let shirts = [(name: "Buttondown", price: 29.99, quantity: 2),
              (name: "Sweater", price: 39.99, quantity: 4),
              (name: "T-Shirt", price: 19.99, quantity: 1)]

// ********************************** TEST CASES **********************************

class TuplesLabTests: XCTestCase {
    func testTuplesPositions() {
        let item = ("polos",29.99,2)
        let amount = item.1 * Double(item.2)
        print("\(item.2) \(item.0) @ \(item.1) = \(amount)")
    }
    
    func testTuplesLabels() {
        let amount = polos.price * Double(polos.quantity)
        print("\(polos.name): $\(polos.price) * \(polos.quantity) = $\(amount)")
    }
    
    func testTupleParameter() {
        let amount = calculatedAmount(item: polos)
        print("\(polos.name): $\(polos.price) * \(polos.quantity) Units = $\(amount)")
    }

    func testTupleReturnValue() {
        let shirtA = formatted(item: shirts[0])
        print(shirtA.0)
        let shirtB = formatted(item: shirts[1])
        print(shirtB.0)
        let shirtC = formatted(item: shirts[2])
        print(shirtC.0)
        print("Total: $\(shirtA.1 + shirtB.1 + shirtC.1)")
    }
}
