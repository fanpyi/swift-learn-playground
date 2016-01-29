//: Playground - noun: a place where people can play

import UIKit

var n = Int8.min
n = n &- 1

struct Vector2D {
    var x = 0.0, y = 0.0
}

func +(left:Vector2D,right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let left = Vector2D(x: 2.0, y: 3.0)
let right = Vector2D(x: 4.0, y: 5.0)

left + right





