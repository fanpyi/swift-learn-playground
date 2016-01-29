//: Playground - noun: a place where people can play

import UIKit

extension UIView {
    var className: String {
        get {
            return NSStringFromClass(self.dynamicType)
        }
    }
    var reuseIdentifier: String {
        get {
            return className + "identifier"
        }
    }
}

let view = UIView()
view.className
view.reuseIdentifier

 let param = [1,4,6,7,8,9]
param.description

