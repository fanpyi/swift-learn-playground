//: Playground - noun: a place where people can play

import UIKit
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}
class Player {
    var coinInpurse:Int
    init(coins: Int) {
        coinInpurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinInpurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinInpurse)
    }
}
