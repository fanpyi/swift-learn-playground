//: Playground - noun: a place where people can play

import UIKit

extension Double {
    var km: Double {
        return self*1000.0
    }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

var m = 1.km + 1000.m
m = 200.cm

extension UIView {
    var x:CGFloat {
        return self.frame.origin.x
    }
    var y:CGFloat {
        return self.frame.origin.y
    }
    var width: CGFloat {
        return self.frame.size.width
    }
    var height: CGFloat {
        return self.frame.size.height
    }
}

let testView = UIView(frame: CGRect(x: 10, y: 20, width: 100, height: 200))
testView.backgroundColor = UIColor.redColor()

testView.x
testView.y
testView.width
testView.height


extension Int {
    func repetitions(task:(list:[String]) ->Void) {
        var l = [String]()
        for i in 0..<self {
            l.append("第\(i+1)个")
        }
        task(list: l)
    }
}
var tet = [String]()
10.repetitions { (list) -> Void in
    tet = list
}
tet
tet.count
extension Int {
    mutating func square() {
        self = self * self;
    }
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex;
        }
        return (self / decimalBase) % 10
    }
}
var someInt = 10
someInt.square()
someInt = 61252527
someInt[0]

class BankCard: Equatable{
    var number: Int64
    init(number: Int64) {
        self.number = number
    }
}
func ==(lhs: BankCard, rhs: BankCard) -> Bool {
    return lhs.number == rhs.number
}




