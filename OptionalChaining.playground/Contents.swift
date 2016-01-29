//: Playground - noun: a place where people can play

import UIKit
class Person {
    var residence: Residence?
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(index: Int) ->Room {
        get {
            return rooms[index]
        }
        set{
            rooms[index] = newValue
        }
    }
    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() ->String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber)\(street)"
        } else {
            return nil
        }
    }
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
let john = Person()
john.residence = Residence()
for i in 0...10 {
    var room = Room(name: "room\(100+i)")
    john.residence?.rooms.append(room)
}

john.residence?[0]
john.residence?.address = Address()
john.residence?.address?.buildingNumber


let roomCount = john.residence?.numberOfRooms
if roomCount == nil {
    print("roomCount is nil")
}