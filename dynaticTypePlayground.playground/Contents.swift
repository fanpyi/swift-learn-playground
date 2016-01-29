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

