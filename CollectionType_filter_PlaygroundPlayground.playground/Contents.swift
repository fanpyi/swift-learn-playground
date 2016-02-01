//: Playground - noun: a place where people can play

import UIKit

let array = [1,5,1,2,3,5,8,6]
array.filter { (x:Int) -> Bool in
    return x > 5
}
array.filter {
    $0 > 5
}
array.filter { (x:Int) -> Bool in
    return x % 2 == 0
}
array.filter {
    $0 % 2 == 0
}
array.filter { (x:Int) -> Bool in
    return x % 2 != 0
}
array.filter {
    $0 % 2 != 0
}

array.minElement {
    $0 < $1
}
array.minElement(<)
array.maxElement {
    $0 < $1
}
array.sort(>)
array.reverse()
