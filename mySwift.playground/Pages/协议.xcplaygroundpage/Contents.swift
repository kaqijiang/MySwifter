
//: # page23 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, playground"
//定义
//格式:协议的定义方式与类, 结构体, 枚举的定义非常相似
protocol someProtocol {
    //func
}
//协议可以继承一个或者多个协议
protocol someProtocol1: someProtocol {
    
}

//结构体协议
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")

//类实现协议和继承父类, 协议一般卸载父类后面
class someSuperClass {
    
}

class SomeClass: someSuperClass,someProtocol {
    
}

//协议属性
//协议中不指定是否是一个存储属性或者计算属性，【所需的名称和读写类型. 属性要求总是声明为变量属性, 用var关键字做前缀.】
protocol ClassProtocol {
    static var present: Bool {get set}//静态，读写
    var subject: String {get}//只读
    var stName: String {get set}//读写
}

//定义类来实现ClassProtocol协议。【如果没有实现协议的属性要求,会直接报错】
class myClass: ClassProtocol {
    static var present: Bool = true
    var subject: String = "ddd"
    var stName: String = "dddd"
    
    func attendance() -> String {
        return "The \(self.stName) has secured 99% attendance"
    }
    
    func markSScured() -> String {
        return "\(self.stName) has \(self.subject)"
    }
}

//创建对象
var myclass = myClass()
print(myclass.attendance())
print(myclass.markSScured())
print(myclass.subject)

/**
 协议普通方法实现
 
 协议可以要求采纳的类型实现指定的实例方法和类方法。这些方法作为协议定义的一部分
 
 书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。
 允许变量拥有参数，与正常的方法使用同样的规则。
 但在协议的定义中，方法参数不能定义默认值。
 
 正如类型属性要求的那样，当协议中定义类型方法时，你总要在其之前添加 static 关键字。
 即使在类实现时，类型方法要求使用 class 或 static 作为关键字前缀，前面的规则仍然适用：
 static在协议中定义关键字时， 始终将关键字的类型属性需求作为前缀。即使类型属性要求可以用类class或者static关键字作为前缀，但是该类仍然适用于类：
 */
//定义协议, 指定方法要求
protocol RandomNumberGenerator {
    func random() -> Double //实现该协议，需要实现该方法，定义时不需要{}
}
class LinerCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        //truncatingRemainder 替代旧方法 %
        return lastRandom / m
    }
}
let generator = LinerCongruentialGenerator()
print("随机数:\(generator.random())")    //随机数:0.545993946585954
print("再来随机数:\(generator.random())") //再来随机数:0.0449539327191029


/**
 协议中实现构造函数
 
 协议SomeProtocol中不仅可以声明方法/属性/下标, 还可以声明构造器,
 但在Swift中, 除了某些特殊情况下, 构造器是不被子类继承的,
 所以SomeClass中虽然能保证定义了协议要求的构造器,
 但不能保证SomeClass的子类中也定义了协议要求的构造器.
 所以我们需要在实现协议要求的构造器时, 使用required关键字确保SomeClass的子类也得实现这个构造器.
 */
protocol TcpProtocol {
    // 初始化构造器要求
    init(aprot:Int)
}
class TcpClass: TcpProtocol {
    var aprot: Int
    required init(aprot: Int) {
        self.aprot = aprot
    }
}

var tcp = TcpClass(aprot: 20)
print(tcp.aprot)

//

protocol Pet {
    func playWith()
    func feed(food:String)
}

class Animal {
    var name: String?
    var brithPlace: String?
    init(name: String, birthPlace: String) {
        self.name = name
        self.brithPlace = birthPlace
    }
}

class Dog: Animal, Pet {
    func playWith() {
        print("🐶在玩耍")
    }
    func feed(food: String) {
        if food == "骨头" {
            print("🐶Happy")
        }else{
            print("🐶Sad")
        }
    }
}

class Cat: Animal, Pet {
    func feed(food: String) {
        if food == "鱼" {
            print("🐱Happy")
        }else{
            print("🐱Sad")
        }
    }
    func playWith() {
        print("🐱在玩耍")
    }
}
let dog = Dog(name: "狗狗", birthPlace: "xx")
dog.playWith()
dog.feed(food: "骨头")

let cat = Cat(name: "猫猫", birthPlace: "北京")
cat.playWith()
cat.feed(food: "鱼")

/**
 typealias与协议结合的使用
 
 
 在定义协议时，将一个或多个关联类型声明为协议定义的一部分有时很有用。
 一个相关联的类型给出了一个占位符名称到被用作协议的一部分的类型。
 在采用该协议之前，不会指定用于该关联类型的实际类型。
 关联的类型由associatedtype关键字指定
 
 */
//定义一个协议, 代表重量, 但是它的类型要根据继承与它的类或结构体定义, 协议代码如下:
protocol WeightCalculble {
    
    associatedtype WeightType//相当于定义一个占位符，后期根据需要修改
    
    var weight:WeightType{get}
}

//这里定义了两个类，一个是iPhone7，一个是Ship，都继承于协议WeightCalculable，但是weight的类型大不相同。iPhone7的weight属性是Double类型的，Ship的weight属性是Int类型的。

class iphone: WeightCalculble {
    
    typealias WeightType = Double //这里weight属性的类型就抛出来了, 便于继承协议的类或结构体来定义
    
    var weight: WeightType {
        return 0.123
    }
}
class ship: WeightCalculble {
    
    typealias WeightType = Int
    
    let weight: WeightType
    
    init(weight: Int) {
        
        self.weight = weight
    }
}
// 最后这段代码，用于扩充Int类型，自定义了t字段来代表吨

extension Int {
    
    typealias Weight = Int
    
    var t:Weight {
        
        return 1_000 * self
    }
}


//: [Next](@next)
