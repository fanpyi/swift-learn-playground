//: Playground - noun: a place where people can play

import UIKit

let aString = "Some\\search&text play\r people"
aString.characters.count
String(aString.characters.map {
    $0 == " " ? "+" : $0
    })

aString.characters.reduce("") { (ret:String, c: Character) -> String in
    if c == "\\" || c == "&" || c == "\r" || c == " "{
       return ret + "+"
    }else {
        return ret + "\(c)"
    }
}
aString.characters.reduce("") {
    "\($1)" + $0
}

