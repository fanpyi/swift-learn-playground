//: Playground - noun: a place where people can play

import UIKit


func swapNumber(inout n1:Int,inout _ n2:Int) {
    let tmp = n1
    n1 = n2
    n2 = tmp
}
var a = 10, b = 20
swapNumber(&a, &b)
print("a=\(a),b=\(b)")

func swapTwoValues<T>(inout a: T , inout _ b: T) {
    let tmp = a
    a = b
    b = tmp
}

var c = 100, d = 200
var e = 12.50, f = 12.508
var s1 = "hello", s2="world"

swapTwoValues(&c, &d)
swapTwoValues(&e, &f)
swapTwoValues(&s1, &s2)
c
d
e
f
s1
s2


struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStr = Stack<String>()
stackOfStr.push("Home")
stackOfStr.push("ShopCart")
stackOfStr.push("OrderInfo")
stackOfStr.items

let last = stackOfStr.pop();
stackOfStr.items


extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count-1]
    }
}

if let top = stackOfStr.topItem {
    print("top=\(top)")
}

var dict = Dictionary<String,String>()

dict["id"] = "24"
dict["name"] = "Jobs"
dict["attribute"] = "微辣"
dict

var array = Array<String>()

for i in 0...10 {
    array.append("第\(i)个")
}
func findStringIndex(array:[String],valueToFind:String) -> Int? {
    for (index ,value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let index = findStringIndex(array, valueToFind: "第2个")


func findIndex<T: Equatable>(array:[T],valueToFind:T) -> Int? {
    for (index,value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex([1.23,23.4,10.0], valueToFind: 10.0)
let stringIndex = findIndex(["abs","floor","ceil"], valueToFind: "sin")

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i:Int) ->ItemType {get}
}
struct ProtocolStack<Element> :Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() ->Element {
        return items.removeLast()
    }
    mutating func append(item: Element) {
       self.push(item)
    }
    var count : Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

var stack = ProtocolStack<String>()
for i in 0...10 {
    stack.append("第\(i*10)行")
}
stack.items
stack.count
stack[0]
stack[1]


extension Array:Container {}

let testArray = Array<String>()
testArray.isEmpty
testArray.count

func allItemsMatch<c1: Container,c2: Container where c1.ItemType == c2.ItemType, c1.ItemType :Equatable >(someContainer: c1,otherContainer: c2) -> Bool {
    if someContainer.count != otherContainer.count {
        return false
    }
    for i in 0..<someContainer.count {
        if someContainer[i] != otherContainer[i] {
            return false
        }
    }
    return true
}


var stack1 = ProtocolStack<String>()
stack1.push("uno")
stack1.push("dos")
stack1.push("tres")

var arrayOfStrings = ["uno","dos","tres"]

if allItemsMatch(stack1, otherContainer: arrayOfStrings) {
    print("all items match")
} else {
    print("not all items match")
}





