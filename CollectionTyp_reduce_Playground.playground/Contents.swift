//: Playground - noun: a place where people can play

import UIKit

let persons = [["name": "Carl Saxon", "city": "New York, NY", "age": 44],
    ["name": "Travis Downing", "city": "El Segundo, CA", "age": 34],
    ["name": "Liz Parker", "city": "San Francisco, CA", "age": 32],
    ["name": "John Newden", "city": "New Jersey, NY", "age": 21],
    ["name": "Hector Simons", "age": 37],
    ["name": "Brian Neo", "age": 27]] //注意后面两家伙没有city 键值

//找出city不为空的人
persons.reduce([]) { (xs: [AnyObject], x:[String : NSObject]) ->[AnyObject] in
    if let v = x["city"] {
        return xs + [x]
    }else{
        return xs
    }
}
persons.reduce([]) {
    $1["city"] != nil ? $0 + [$1] : $0
}
//找出city为nil的人
persons.reduce([]) { (xs: [AnyObject], x:[String : NSObject]) ->[AnyObject] in
    if let v = x["city"] {
        return xs
    }else{
        return xs + [x]
    }
}
persons.reduce([]) {
    $1["city"] == nil ? $0 + [$1] : $0
}

func combinator(accumulator:Int,current: Int) ->Int {
    return accumulator + current
}
[1,2,3].reduce(0, combine: combinator)


func rmap(elements:[Int],transform:Int->Int) -> [Int] {
    return elements.reduce([Int](), combine: { (var acc:[Int], obj:Int) -> [Int] in
        print("acc=\(acc),obj=\(obj))")
        acc.append(transform(obj))
        return acc
    })
}
rmap([1,2,3,4]) {
    $0*2
}
[1,2,3,4] + [5,6]
[1,2,3,4].reduce(0, combine: +)
[1,2,3,4].reduce(1, combine: *)
[1,2,3,4].reduce([]) { (a:[Int], b:Int) -> [Int] in
    return [b] + a
}
[1,2,3,4].reduce([], combine: { [$1] + $0 })

[1,2,3,4].reduce(Int.min, combine: max)
[1,2,3,4,3,6,4,2].reduce([]) { (a:[Int], b:Int) -> [Int] in
    if b % 2 == 0 {
        return a + [b]
    }else{
        return a
    }
}
[1,2,3,4,3,6,4,2].reduce([]) { (var a:[Int], b:Int) -> [Int] in
    if !a.contains(b) {
        return a + [b]
    }else{
        return a
    }
}
