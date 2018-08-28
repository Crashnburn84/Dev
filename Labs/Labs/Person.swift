import Foundation

protocol Likeable {
    var numberOfLikes: Int {get}
    func like()
    func unlike()
}

protocol Friendable {
    var friendID: Int {get}
    var friends: [Friendable] {get}
    
    func friend(addFriend: Friendable)
    func unfriend(subFriend: Friendable)
}

class Person: CustomDebugStringConvertible
{
    private static var sequence = 0
    class var sequenceNumber: Int { sequence += 1; return sequence}
    
    var firstName: String
    var lastName: String
    
    var numberOfLikes = 0
    var friendID = 0
    var friends = [Friendable]()
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.friendID = Person.sequenceNumber
    }
    
    var debugDescription: String {
        return "\(firstName) \(lastName) +\(numberOfLikes)"
    }
}

extension Person: Likeable {
    func unlike() {
        if (numberOfLikes > 0) {
            numberOfLikes -= 1
        }
    }
    
    func like() {
        numberOfLikes += 1
    }
}

extension Person: Friendable {
    func friend(addFriend: Friendable) {
        friends.append(addFriend)
    }
    
    func unfriend(subFriend: Friendable) {
        if let i = friends.index(where: { $0.friendID == subFriend.friendID }) {
            friends.remove(at: i)
        }
    }
}
