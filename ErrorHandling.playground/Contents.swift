//: Playground - noun: a place where people can play

import UIKit

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinNeeded: Int)
    case OutOfStock
}

//throw VendingMachineError.InsufficientFunds(coinNeeded: 5)
//
//func canThrowErrors() throws -> String
//func cannotThrowErrors() -> String

struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        guard item.price <= coinDeposited else {
            throw VendingMachineError.InsufficientFunds(coinNeeded: item.price - coinDeposited)
        }
        coinDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
        
    }
}
//let machine = VendingMachine()
//try machine.vend(itemNamed: "Chips")
//
//let favoriteSnacks = [
//    "Alice": "Chips",
//    "Bob": "Licorice",
//    "Eve": "Pretzels",
//]
var vendingMachine = VendingMachine()
vendingMachine.coinDeposited = 8
do {
    try vendingMachine.vend(itemNamed: "hello")
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

