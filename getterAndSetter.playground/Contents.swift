//: Playground - noun: a place where people can play

import UIKit
class Food {
    var name: String {
        set {
            print("set name")
            self.name = newValue
        }
        get {
            if attribute.characters.count > 0 {
                return self.name + attribute
            }else{
                return self.name;
            }
        }
        
    }
    var attribute: String = ""
    init(name: String, attribute: String) {
        self.name = name
        self.attribute = attribute
    }
}

let food = Food(name: "哈哈镜", attribute: "微辣")
food.name
