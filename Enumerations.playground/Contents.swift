//: Playground - noun: a place where people can play

import UIKit
enum CompassPoint:String{
    case North
    case South
    case East
    case West
}
var direction = CompassPoint.East

if let dr = CompassPoint(rawValue: "East") {
    switch dr {
    case .East:
    print("it is east")
    default:
        print("it is not east")
    }
} else{
    print("there isn't a direction is Hello")
}

enum Planet: Int {
    case Mercury = 0, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
let planet = Planet.Neptune.rawValue

var directTohead:CompassPoint

directTohead = .East

switch directTohead {
    case .North:
        print("it is north")
    case .South:
        print("Watch out for penguins")
    case .East:
        print("Where the sun rises")
    case .West:
        print("Where the skies are blue")
}
let somePlanet = Planet.Earth
switch somePlanet {
    case .Earth:
    print("mostly harmless")
default:
    print("not is safe place for bumans")
}

enum BarCode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = BarCode.UPCA(8, 100, 101, 5)
//productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case let .UPCA(number, facturer, product,check):
    print("number is \(number),facturer is \(facturer),product is \(product),check is \(check)")
case let .QRCode(qrcode):
    print("QRCode is \(qrcode)")
}


enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

