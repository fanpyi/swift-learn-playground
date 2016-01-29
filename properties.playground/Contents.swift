//: Playground - noun: a place where people can play

import UIKit

class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("some data")

class StepCounter {
    var totalSteps: Int = 0 {
        //例子中的willSet观察器将表示新值的参数自定义为newTotalSteps，这个观察器只是简单的将新的值输出。
        willSet(newTotal){
            print("about to set totalSteps to \(newTotal)")
        }
        didSet {
            if totalSteps > oldValue {
                 print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 100
stepCounter.totalSteps = 200

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    //使用关键字static来定义类型属性。在为类定义计算型类型属性时，可以改用关键字class来支持子类对父类的实现进行重写
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
SomeStructure.computedTypeProperty
SomeStructure.storedTypeProperty = "Another value"
SomeStructure.storedTypeProperty
SomeEnumeration.storedTypeProperty
SomeClass.overrideableComputedTypeProperty

class Person: SomeClass {
    override class var overrideableComputedTypeProperty:Int {
        return 100
    }
}
Person.overrideableComputedTypeProperty


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
leftChannel.currentLevel
AudioChannel.maxInputLevelForAllChannels
rightChannel.currentLevel = 11
rightChannel.currentLevel
AudioChannel.maxInputLevelForAllChannels
