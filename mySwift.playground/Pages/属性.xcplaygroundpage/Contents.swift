
//: # page23 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, playground"
/*
 存储属性
 其实Swift中的存储属性就是以前学习OC中的普通属性, 在结构体或者类中定义的属性, 默认就是存储属性
 */

struct Person {
    var name: String
    var age: Int
}
var p = Person(name: "liMing", age: 16)
print("name=\(p.name)的年龄是\(p.age)")

p.name = "tiantian"
p.age = 11
print("name=\(p.name)的年龄是\(p.age)")

/*
 常量存储属性
 常量存储属性只能在定义时或构造时修改, 构造好一个对象之后不能对常量存储属性进行修改
 */
struct Person2 {
    var name: String
    var age: Int
    let card: String //常量let
}
var p2 = Person2(name: "张山", age: 22, card: "dssd")
p2.name = "lishan"
p2.age = 23
//p2.card = "dddd"  不能修改 // 构造好对象以后不能修改常量存储属性

/*
 结构体和类常量与存储属性的关系
 结构体和枚举是值类型
 类是引用类型
 */

struct Person3 {
    var name: String
    var age: Int
}

let p3 = Person3(name: "lll", age: 12)
// 1.因为结构体是值类型, 所以不能修改结构体常量中的属性;
// 2.不能修改结构体 / 枚举常量对象中的值, 因为他指向的对象是一个常量;
//p3.name = "hiName"  Error!
//p3 = Person3(name: "hiName", age: 27)   Error!


class Person4 {
    var name: String?
    var age: Int = 20
}

let p4: Person4 = Person4()
// 可以修改类中常量中的值, 因为他们指向的对象不是一个常量
p4.name = "sss"
print(p4.name ?? "")
p4.age = 23
// 不可以修改类常量的指向
//p4 = Person3()  //Error!

/*
 延迟存储属性
 Swift语言中所有的存储属性必须有初始值, 也就是当构造完一个对象后, 对象中所有的存储属性必须有初始值, 但是也有例外, 其中延迟存储属性可以将属性的初始化推迟到该属性第一次被调用的时候
 懒加载应用场景:
 1.有可能不会用到
 2.依赖于其它值
 */

class Line {
    var start:Double = 0.0
    var end:Double = 0.0
    
    // 1.如果不是 lazy属性, 定义的时候对象还没有初始化, 所以不能访问self;
    // 2.如果加上 lazy, 代表使用时才会加载, 也就是使用到length属性时才会调用self;
    // 3.而访问一个类的属性必须通过对象方法, 所以访问时对象已经初始化完成了, 可以使用self
    lazy var length: Double = self.getLength()
    
    // 通过闭包懒加载
    lazy var container: Array<AnyObject> = {
        print("懒加载")
        
        var arrrM:Array<Int> = []
        //        return self.end - self.start   Error!
        return arrrM as [AnyObject]
    }()
    
    func getLength() -> Double
    {
        print("懒加载")
        return end - start
    }
}












//: [Next](@next)
