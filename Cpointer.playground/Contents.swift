//: Playground - noun: a place where people can play

import UIKit

let scanner = NSScanner(string: "0x999999")
var value: UInt64 = 0
scanner.scanHexLongLong(&value)

value


let color = 0xf1fcff
((color & 0xff0000) >> 16)/0xff