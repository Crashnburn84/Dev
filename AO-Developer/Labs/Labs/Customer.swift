import Foundation

struct Address: CustomStringConvertible {
    let street: String
    let city: String
    let state: String
    var street2: String?
    
    var description: String {
        return("street: \(street), city: \(city), state: \(state)")
    }
    
    init(street: String, city: String, state: String, street2: String? = nil) {
        self.street = street
        self.city = city
        self.state = state
        self.street2 = street2
    }

    var fullStreet: String {
        //return street2 == nil ? street : "\(street), \(street2 ?? "")"
        guard let street2 = street2 else { return street }
        return "\(street), \(street2)"
    }
}

class Customer: CustomStringConvertible {
    var name: String
    var address: String?
    
    var description: String {
        guard let addr = address else { return "N/A" }
        return "\(name), \(addr)"
    }
    
    init(name: String, address: String?) {
        self.name = name
        self.address = address
    }
}

extension Array where Element: Customer {
    func customer(named name:String) -> Customer? {
        for customer in self {
            if customer.name == name { return customer }
        }
        return nil
    }
}
