//: Playground - noun: a place where people can play

import UIKit


extension String {
    func escapeString() -> String {
        return self.stringByReplacingOccurrencesOfString("\\", withString: "\\\\").stringByReplacingOccurrencesOfString("'", withString: "\\x27").stringByReplacingOccurrencesOfString("/", withString: "\\/").stringByReplacingOccurrencesOfString("\n", withString: "\\n").stringByReplacingOccurrencesOfString("\r", withString: "\\r").stringByReplacingOccurrencesOfString("\"", withString: "\\x22")
    }
}
extension Dictionary where Key: StringLiteralConvertible, Value: AnyObject {
//    func valuesForKeys(keys: [Key]) -> [Value?] {
//        var result = [Value?]()
//        result.reserveCapacity(keys.count)
//        for key in keys {
//            result.append(self[key])
//        }
//        return result
//    }
    var JSONString: String {
        if let dict = (self as? AnyObject) as? Dictionary<String, AnyObject> {
            do {
                let data = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
                let string = String(data: data, encoding: NSUTF8StringEncoding)!
                return string.escapeString()
                
            }catch {
                return ""
            }
        }
        return ""
    }
    var URLParamString:String {
        get {
            let t = self.keys.map {
                "\($0)=\(self[$0]!)"
            }
            return t.joinWithSeparator("&")
        }
    }
    func valuesForKeys(keys: [Key]) -> [Value?] {
        return keys.map({
            self[$0]
        })
    }
}

var dic = ["id":20,"name":"Tom","age":25]
dic.URLParamString
dic.valuesForKeys(["id","ok"])
dic.JSONString

