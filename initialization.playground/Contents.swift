//: Playground - noun: a place where people can play

import UIKit

struct Fahrenhheit {
    var temperature :Double = 45 {
        didSet {
            print("trigger property observer")
        }
    }
    init() {
        temperature = 36.0
    }
    
    
}
//当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会触发任何属性观察者（property observers）。
var f = Fahrenhheit()
f.temperature
f.temperature = 40.0



struct Celsius {
    var temperatureInCelsius: Double
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
    init(fromFahrenheit fahrenheit:Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let c1 = Celsius(fromFahrenheit: 100.0)
c1.temperatureInCelsius
let c2 = Celsius(fromKelvin: 300.0)
c2.temperatureInCelsius
let c3 = Celsius(200)
c3.temperatureInCelsius



struct Color {
    let red, green,blue: Double
    init(red: Double,green: Double,blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let green = Color(red: 0.0, green: 1.0, blue: 0.0)


class SurveyQuestion {
    var text: String
    var response: String?
    init(text :String,response: String?){
        self.text = text
        self.response = response
    }
}



let question = SurveyQuestion(text: "Do you known?", response: nil)
let l = question.response?.characters.count

print("response_len=\(l)")


class ShoppingListItem  {
    var name: String?
    var number = 1
    var purchased = false
    var description: String {
        return "name is \(name),number is \(number),purchased is \(purchased)"
    }
}
var item = ShoppingListItem().description

struct Size {
    var width = 0.0, height = 0.0
    var description:String {
        return "width is \(width),height is \(height)"
    }
}
struct Point {
    var x = 0.0, y = 0.0
    var description:String {
        return "x is \(x),y is \(y)"
    }
}
var size = Size().description
size = Size(width: 20.10, height: 30.24).description
struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin: Point,size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point,size: Size) {
        let x = center.x - (size.width / 2.0)
        let y = center.y - (size.height / 2.0)
        self.init(origin:Point(x: x, y: y),size: size)
    }
    var description: String {
        return origin.description + " " + size.description
    }
}

var rect = Rect().description
rect = Rect(origin: Point(x: 10, y: 100), size: Size(width: 50, height: 50)).description


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[unnamed]")
    }
    var description: String {
        return "food name is \(name)"
    }
}
var food = Food(name: "Bacon").description
food = Food().description
class RecipeIngredient: Food {
    var quantity: Int
    init(_ name: String,quantity: Int ) {
        self.quantity = quantity
        super.init(name: name)
       
    }
    override convenience init(name: String) {
        self.init(name,quantity: 1)
    }
}

class ShoppingList: RecipeIngredient {
    var purchased = false
    override  var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var list = [
    ShoppingList(),
    ShoppingList(name: "Bacon"),
    ShoppingList("Eggs", quantity: 6)
]
for it in list {
    print(it.description)
}



struct Animal {
    let species: String?
    init?(species: String?) {
        self.species = species
        if species == nil || species!.isEmpty {return nil}
    }
}

let animal = Animal(species: "")

enum TemperatureUnit {
    case Kelvin,Celsius,Fahrenheit
    init?(symbol: Character) {
        switch symbol {
            case "K":
            self = .Kelvin
            case "C":
            self = .Celsius
            case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let frahrenheit = TemperatureUnit(symbol: "C")
let any = TemperatureUnit(symbol: "1" )


class Product {
    var name: String!
    var description: String {
        return "name is \(name)"
    }
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

var product = Product(name: "")?.name
product = Product(name: "Apple")?.description

class CartItem: Product {
    var quantity: Int!
    init?(name: String, quantity: Int) {
        super.init(name: name)
        if quantity < 1 { return nil }
        self.quantity = quantity
    }
}

class SomeClass {
    let someProperty: String = {
        return "Hello"
    }()
}
var some = SomeClass().someProperty






struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int,columu: Int) ->Bool {
        return boardColors[(row * 10) + columu]
    }
    
}

let board = Checkerboard()
board.squareIsBlackAtRow(0, columu: 1)
board.squareIsBlackAtRow(9, columu: 9)


