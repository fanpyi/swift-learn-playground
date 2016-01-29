//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
    final func run() {
        print("running")
    }
}
let someVehicle = Vehicle()
someVehicle.description

class Bicycle: Vehicle {
    var hasBaket = false
    init(currentSpeed speed : Double,hasBaket:Bool) {
        super.init()
        currentSpeed = speed
        self.hasBaket = hasBaket
    }
    override var description: String {
        return super.description + ",hasBaket=\(hasBaket)"
    }
    override func makeNoise() {
        print("Choo Choo")
    }
    
    
}

let bicycle = Bicycle(currentSpeed: 20.0, hasBaket: true)
bicycle.description
bicycle.makeNoise()


class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

class AutomaticCar : Car {
    override var currentSpeed :Double {
        didSet {
            gear = Int(currentSpeed / 10.0)
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 50.0
print("automatic= \(automatic.description)")









