//: Playground - noun: a place where people can play

import UIKit

extension Array{
    var decompose:(head:Element,tail:[Element])? {
        return (count > 0) ? (self[0],Array(self[1..<count])) : nil
    }
}
let xs = [1,2,3,4,5,6,7,8,9,10]

func sum2(xs:[Int]) ->Int {
    if let (head,tail) = xs.decompose {
        return head + sum2(tail)
    }else{
        return 0
    }
}

sum2(xs)

xs.reduce(10) {
    return $0 + $1
}