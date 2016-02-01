//: Playground - noun: a place where people can play

import UIKit
let arr = [1,2,3,4,5,6]
arr.map { (x: Int) -> Int in
    x * 2
}
arr.map { (x:Int) -> Int in
    x*3+2
}
arr.map({
    $0 * 2
})
arr.map {
    $0 * 3 + 2
}


func doubleArrayByTwo(xs: [Int]) ->([Int],String) {
    let s = "\(__FUNCTION__)"
    var ret = [Int]()
    for x in xs {
        ret.append(x * 2)
    }
    return (ret,s)
}

let (doubleArr,functionName) = doubleArrayByTwo(arr)

doubleArr
functionName

func handleIntArray(xs:[Int],f:Int ->Int) -> [Int] {
    var result = [Int]()
    for x in xs {
        result.append(f(x))
    }
    return result
}
handleIntArray(arr) {
    return 2 * $0
}
handleIntArray(arr) { (x:Int) -> Int in
    return 2 * x + 1
}
func handleClosure(x:Int) -> Int {
    return 2 * x
}
handleIntArray(arr, f: handleClosure)

func handleBoolArray(xs:[Int],f:Int -> Bool) -> [Bool] {
    var result = [Bool]()
    for x in xs {
        result.append(f(x))
    }
    return result
}
handleBoolArray(arr){
    $0 % 2 == 0 ? true : false
}

func genericComputeArray<U>(xs:[Int],f:Int -> U) -> [U] {
    var ret = [U]()
    for x in xs {
        ret.append(f(x))
    }
    return ret
}

genericComputeArray(arr) {
    "\($0)"
}
genericComputeArray(arr) {
    $0 * 2
}

genericComputeArray(arr) {
    $0 * 3 + 2
}

genericComputeArray(arr) {
    $0 % 2 == 0 ? "偶数" : "奇数"
}


let testArray = ["a","time","","is","freedom","one"]
testArray.filter {
    return $0.characters.count > 0
}

testArray.map { (s: String) -> Int? in
    if s.characters.count > 0 {
        return s.characters.count
    }else{
        return nil
    }
}
testArray.flatMap({ (s:String) -> Int? in
    if s.characters.count > 0 {
        return s.characters.count
    }else{
        return nil
    }
})



