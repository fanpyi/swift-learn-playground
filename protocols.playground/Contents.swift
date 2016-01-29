//: Playground - noun: a place where people can play

import UIKit

protocol SomeProtocol {
    var mustBeSettable: Int {set get}
    var doesNotNeedToBeSettable: Int {get}
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed {
    var fullName: String { get }
}
struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appledeed")

john.fullName

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String,prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "")+name
    }
}

var star = Starship(name: "Enterprise", prefix: "US")
star.fullName

protocol InitProtocol {
    init(someParameter: Int)
}

class SomeClass: InitProtocol {
    var tag: Int
    required init(someParameter: Int) {
        tag = someParameter
    }
}

let some = SomeClass(someParameter: 100)
some.tag


protocol RandomNumberGenerator {
    func random() ->Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c) % m
        return lastRandom / m
    }
}
class Dice {
    let sides:Int
    let generator: RandomNumberGenerator
    init(sides: Int,generator:RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() ->Int {
        return Int(generator.random() * Double(sides))+1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
var result = [String]()
for _ in 0..<10 {
    result.append("random dice roll is \(d6.roll())")
}
result


protocol DiceGame {
    var dice: Dice { get}
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game: DiceGame)
}

class SnakeAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](count: finalSquare+1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegete: DiceGameDelegate?
    func play() {
        square = 0
        delegete?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegete?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
            
        }
    }
}
