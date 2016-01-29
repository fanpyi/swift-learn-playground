//: Playground - noun: a place where people can play

import UIKit
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1:String,s2:String) -> Bool{
    return s1 > s2
}
var reversed = names.sort(backwards)

reversed = names.sort({(s1:String,s2:String) -> Bool in return s1 > s2})
reversed = names.sort({s1,s2 in s1 > s2})
reversed = names.sort({$0 > $1})

var r = names.sort(>)

func someFunctionThatTakesAclosure(closure:() ->Void) {
    closure()
}

someFunctionThatTakesAclosure { () -> Void in
    print("closure")
}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 519]

let strings = numbers.map { (var number) -> String in
    print("number=\(number)")
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}


func makeInCrement(forIncrement amount: Int) ->() -> Int {
    var total = 0
    func incrementor() ->Int {
        total += amount
        return total
    }
    return incrementor
}

let incrementByTen = makeInCrement(forIncrement: 10)

incrementByTen()

incrementByTen()

incrementByTen()


let incrementBySeven = makeInCrement(forIncrement: 7)

incrementBySeven()

func someFunctionWithNoescapeClosure(@noescape closure :(tag : Int) ->Void ){
    closure(tag: 100)
    print("someFunctionWithNoescapeClosure");
}
someFunctionWithNoescapeClosure { (tag) -> Void in
    print("tag=\(tag)")
}


func doSomething(@noescape some:() ->Void) {
    some()
    print("函数体")
}
doSomething({
    print("hello")
})



let view = UIView(frame: CGRect(x: 20, y: 100, width: 100, height: 100))
view.backgroundColor = UIColor.orangeColor()
