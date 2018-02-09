
//: # page23 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation


//class person: NSObject {
//
//    var name = "sss"
//
//    override init() {
//        name = "s"
//    }
//
//    init(name:String) {
//        self.name = name
//    }
//}


//class srudent: person {
//    var age :Int
//    var sex :String!
//
//    init(age: Int, sex: String, name:String) {
//
//
//        print(self.sex)
//
//        self.sex = "sd"
//        self.age = age
//        print(self.age)
//        super.init(name: name)
//
//    }
//}

//let s = srudent(age: 12, sex: "sd", name: "dsds")
//
//
//print(s.age, s.sex, s.name)
//
class person: NSObject {
    
    var name: String?
    private var title: String? //私有的
    
    
    convenience init(d dict: [String: String]){
        self.init(dict: dict)
    }
    
    init(dict: [String: String]){
        
        super.init()
        //KVC是OC的方法，所以先调用super
        setValuesForKeys(dict)
    }
    
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String){
        //没有调用super  覆盖父类方法
    }
}

//var dicts :[String: String]
//
//dicts["name"] = "23"
//dicts["title"] = "2s3"

person(d: <#T##[String : String]#>)
//let per = person(dict:["name" : "ss"])
//print(per.name)
//print(per.title)

//: [Next](@next)
