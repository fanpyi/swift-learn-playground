//: Playground - noun: a place where people can play

import UIKit

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    init(){}
    init(name: String?, frameRate: Double) {
        self.name = name
        self.frameRate = frameRate
    }
}
let someResolution = Resolution()
let someVideoMode = VideoMode()
someResolution.width
someVideoMode.resolution.width

let hd = Resolution(width: 1920, height: 1080)
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty

alsoTenEighty.frameRate = 30.0

tenEighty.frameRate

if tenEighty === alsoTenEighty {
    print("tenEighty is equal alsoTenEighty")
}

var arr = [VideoMode]()

for i in 0..<10 {
    arr.append(VideoMode(name: "第\(i+1)个", frameRate: Double(100*i)))
}
let another = arr;

var first = another[0]
first.name = "it's changed"
first = arr[0]
first.name
