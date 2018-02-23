
//: # page23 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, playground"
/*
 构造方法:
 
 作用: 对实例对象的内容进行初始化
 Swift要求类或者结构体中的存储属性(非lazy在)在对象构造完毕后要有初始化值
 
 语法:
 init(参数列表){ 初始化代码 }
 
 注意: 1.在Swift中类/结构体/枚举都需要构造方法;
 2.构造方法的作用仅仅是用语初始化属性, 而不是分配内容, 分配内存是系统帮我们做的;
 3.构造方法是隐式调用的, 通过 类名称() 形成创建一个对象就会隐式调用 init() 构造方法;
 4.如果所有的存储属性都有默认值, 可以不提供构造方法, 系统会提供一个隐式的构造方法;init()
 5.如果存储属性可以提供缺省, 那么提倡大家使用设置缺省值的方法, 这样可以简化代码(不用自定义构造方法, 不用写存储属性类型)
 
 先说一下这个两段式，Swift 的类初始化是一个两段式过程。
 
 - 在第一个阶段，每一个存储属性被引入类为分配了一个初始值。一旦每个存储属性的初始状态被确定。
 1. 指定或便利初始化器在类中被调用；
 - 为这个类的新实例分配内存。内存还没有被初始化；
 - 这个类的指定初始化器确保所有由此类引入的存储属性都有一个值。现在这些存储属性的内存被初始化了；
 - 指定初始化器调用父类的初始化器为其存储属性执行相同的任务；
 - 这个调用父类初始化器的过程将沿着初始化器链一直向上进行，直到到达初始化器链的最顶部；
 - 一旦达了初始化器链的最顶部，在链顶部的类确保所有的存储属性都有一个值，此实例的内存被认为完全初始化了，此时第一阶段完成。
 - 从子类向父类调用指定初始化方法，从子类开始先初始化自己的属性，再去调用父类初始化父类的属性，达到最顶类后，默认第一阶段完毕。
 
 - 第二个阶段，每个类都有机会在新的实例准备使用之前来定制它的存储属性。
 1. 从顶部初始化器往下，链中的每一个指定初始化器都有机会进一步定制实例。初始化器现在能够访问 self 并且可以修改它的属性，调用它的实例方法等等；
 - 最终，链中任何便利初始化器都有机会定制实例以及使用 slef 。
 - 从父类向子类，对初始化好的实例进行操作。

 
 */
class Person {
    var name: String = ""
    var age:Int
    func description() -> String {
        return "name = \(name) age = \(age)"
    }
    init() {
        print("init")
        age = 30
    }
}
// 1.分配内存; 2.初始化name和age; 3.构造方法是隐式调用的
var p = Person()
var descripString: String = p.description() //显示调用
print(p.age)

print("================================")

/** 重载构造方法
    Swift新增了一个OC没有的概念，重载。你可以用相同的函数名，不同的参数类型或个数，来重载构造方法
 **/
class Person2 {
    var name:String
    var age:Int
    func description() -> String {
        return "name = \(name) age = \(age)"
    }
    
    init() {
        self.name = "12"
        self.age = 12
    }
    //1.函数名相同;
    //2.参数不同;
    init(age:Int, name:String)
    {
        self.name = name
        self.age = age
        //可以理解为后边有个super()
    }
    
}

var p2 = Person2(age: 23, name: "sdd")
print(p2.description())

var per2 = Person2()
print(per2.description())

print("================================")

/*
 常量存储属性与构造方法
 常量存储属性只能通过缺省值或在构造方法中被修改, 其它任何地方都不能修改
 */
class Person3 {
    let name:String = "liming"//如果这里没有设置，则可在构造方法的时候初始化，后续不可修改
    var age:Int
    let title: String?
    
    init(age: Int, title: title)
    {
        self.age = age
        self.title = title
    }
    
    func description() -> String {
        return "name = \(name) age = \(age)"
    }
}
var p3 = Person3(age: 22, title: "tits")
//p3.name = "sd"
print("================================")



/** 可选属性与构造方法 **/
class Car {
    let name:String
    init(name:String)
    {
        self.name = name
    }
}
class Person4 {
    let name:String
    var age:Int
    var car:Car?
    
    //1.可选值存储属性可以不再构造方法中初始化;
    //2.也就是说可选值在对象构造完毕后不用初始化;
    //3.其实如果不对可选存储属性进行初始化, 默认就是nil
    init(age:Int, name:String)
    {
        self.age = age
        self.name = name
    }
    func description() -> String {
        return "name = \(name) age = \(age)"
    }
}

var p4 = Person4(age: 22, name: "lili")
print(p4.car as Any)

/** 结构体与构造方法 **/
struct Rect {
    //此时既没有提供缺省值, 也没有提供构造方法, 但是编译通过
    //因为默认情况下, 结构体会给结构体提供一个默认的成员逐一构造器
    var width:Double = 0.0
    var height:Double = 0.0
    /*
     // 系统默认会提供一个类似的方法
     init(width:Double, height:Double)
     {
     self.width = width
     self.height = height
     }
     */
    /*
     init() {
     self.width = 0.0
     self.height = 0.0
     }
     */
}
// 注意: 1.在类中默认是没有逐一构造器的
// 2.如果在结构体中自定义了构造方法, 那么系统不会生成默认的逐一构造器
// 3.如果给存储属性提供了缺省值, 系统还是会提供默认的逐一构造器
//var r = Rect(width: 1.0, heigth: 1.0)
// 4.如果给存储属性提供了缺省值, 可以使用不带参数的方法初始化结构体
var r = Rect()

/*
 "值类型"的构造器代理
 构造器代理: 构造方法之间的相互调用
 构造方法可以调用其他构造方法来完成实例的构造, 称之为构造器代理
 好处: 减少构造方法之间的重复代码
 */

struct Rect2 {
    var width:Double, height:Double
    init(width:Double, height:Double)
    {
        self.width = width
        self.height = height
    }
    init()
    {
        //        self.width = 0.0
        //        self.height = 0.0
        //构造器代理
        self.init(width: 0, height: 0)
    }
    func show()
    {
        print("width = \(width) height = \(height)")
    }
}
var r2 = Rect2()
r2.show()
var r3 = Rect2(width: 100, height: 100)
r3.show()


print("================================")

/*
 通过闭包或者全局函数/类方法 设置存储属性的缺省值
 如果需要经过计算, 或者需要进行一些额外的操作才能确定初始值时就可以通过闭包或全局函数设置存储属性的缺省值
 */
func getValue() ->Int
{
    print("getValue")
    return 55
}
class Person5 {
    var name:String
    
    //系统在初始化的时候会隐式执行闭包, 将闭包的执行结果赋值给存储属性
    //注意: 闭包后面一定要有(), 代表执行闭包
    var age:Int = {
        () -> Int in  // 这一行可以省略, 返回值是可以省略的,默认返回值的类型就是存储属性的类型
        print("age 闭包")
        return 30
    }()
    
    lazy var height:Double = {
        print("lzay 闭包")
        return 180.0
    }()
    
    var age2:Int = getValue()
    var age3:Int = Person5.getValue2()
    
    //1.不能这么写, 因为调用方法时对象还没有初始化完毕;
    //2.self只有当所有的存储属性都初始化完毕之后才可以用.
    //    var age3:Int = Person5.getValue3()
    
    init(name:String) {
        self.name = name
    }
    class func getValue2() ->Int {
        print("class getValue2")
        return 100
    }
    func getValue3() -> Int {
        return 99
    }
}
var p5 = Person5(name: "we")
//懒加载是用到才执行, 而闭包赋值是初始化时就会执行
print(p5.height)

//var str = "Hello, playground"
///*
// 继承与构造方法:
// 指定构造与便利构造器方法
// */
//
//class Person {
//    var name:String
//    var age:Int
//    //指定构造方法都是以init开头
//    init(name:String, age:Int)
//    {
//        self.name = name
//        self.age = age
//    }
//    //1.如果是值类型没问题, 称之为构造器代理;
//    //2.但是如果是引用类型报错, 需要在前面加上 convenience关键字;
//    //3.被convenience关键字修饰的构造方法称之为便利构造器, 通过调用其他构造方法来初始化;
//    //4.反而言之, 便利构造器中一定是调用其他构造方法初始化的, 一定要出现self.init
//    convenience init()
//    {
//        self.init(name: "hjq", age: 26)
//    }
//    //类可以拥有多个构造方法
//    init(name:String)
//    {
//        self.name = name
//        self.age = 0
//        //不能再指定构造方法中调用便利构造器方法
//        //换言之,指定构造方法中不能出现self.init
//        //        self.init()
//    }
//
//    convenience init(age:Int)
//    {
//        //可以在便利构造器中调用指定构造器
//        //        self.init(name: "hjq", age: 24)
//        self.init()
//    }
//    // 便利构造器不能和指定构造器同名
//    //    convenience init(name:String)
//    //    {
//    //    }
//}
//
///** 派生类的构造方法 **/
//
//class Man {
//    var name:String
//    //指定构造方法
//    init(name:String)
//    {
//        self.name = name
//    }
//    convenience init(){
//        self.init(name: "weewe")
//    }
//}
//class SuperMan: Man {
//    var age:Int
//
//    // 注意:
//    // 1.默认情况下构造方法不会被继承
//    // 2.基类的存储属性只能通过基类的构造方法初始化
//    // 3.初始化存储属性时必须先初始化当前类再初始化父类
//    // 4.不能通过便利构造方法初始化父类, 只能通过调用指定构造方法初始化父类
//    //指定构造器
//    init(age:Int) {
//        self.age = age
//        super.init(name: "han")
//        //        super.init()
//    }
//}
//
///*
// 构造器间的调用规则:
// 1.指定构造器必须调用其直接父类的"指定构造器"
// 2.便利构造器必须调用同类中的其他便利构造器(指定或者便利)
// 3.便利构造器必须最终调用一个指定构造器结束(无论指定还是便利, 最终肯定调用一个指定构造器)
// 4.指定构造器总是横向代理(父类)
// 5.便利构造器总是横向代理(子类)
// */
//
//class Man2 {
//    var name:String
//    //指定构造器
//    init(name:String) {
//        self.name = name
//    }
//    convenience init(){
//        self.init(name: "HaRi")
//    }
//}
//class SuperMan2: Man2 {
//    var age:Int
//    //指定构造器
//    init(age:Int) {
//        self.age = age
//        super.init(name: "xiaohange")
//    }
//    convenience init()
//    {
//        self.init(age: 25)
//    }
//    convenience  init(name: String, age: Int) {
//        //调用子类构造器一定能够初始化所有属性
//        //        self.init(age: 30)
//        //便利构造器中只能通过self.init来初始化, 不能使用 super.init
//        //因为调用父类构造器不一定完全初始化所有属性(子类持有)
//        //        super.init(name: "han")
//        self.init()
//    }
//}
//
///*
// 两段式构造----构造过程可以划分为两个阶段:
// 1.确保当前类和父类所有存储属性都被初始化;
// 2.做一些其他初始化操作.
// 好处:
// 1.可以防止属性在被初始化前访问;
// 2.可以防止属性被其他另外一个构造器意外赋值.
// 注意:
// 构造器的初始化永远是在所有类的第一阶段初始化完毕后才会开始第二阶段.
//
// 编译器安全检查:
// 1.必须先初始化子类特有属性, 再向上代理父类指定构造方法初始化父类属性;
// 2.只能在调用完父类指定构造器后才能访问父类属性;
// 3.在便利构造器中, 必须先调用通类其他构造方法后才能访问属性;
// 4.第一阶段完成前不能访问父类属性, 也不能引用 self 和调用任何实例方法
// */
//
//class Man3 {
//    var name:String
//    //指定构造方法
//    init(name:String) {
//        self.name = name
//    }
//    //便利构造方法
//    convenience init(){
//        self.init(name: "hello world")
//    }
//}
//
//class SuperMan3: Man3 {
//    var age:Int
//    init(age:Int) {
//        print("SuperMan第一阶段开始")
//        //对子类引入的属性初始化
//        self.age = age
//
//        //代码会报错, 因为调用self.name之前还没有对父类的name进行初始化
//        //即便在这个地方修改, 也会被后面的初始化语句覆盖
//        //        if age > 30 {
//        //            self.name = "hjq"
//        //        }
//        //对父类引入的属性进行初始化
//        super.init(name: "han")
//
//        print("SuperMan第二阶段开始")
//        if age > 30 {
//            self.name = "hello xiaohange"
//        }
//    }
//}
//class MonkeyMan: SuperMan3 {
//    var height:Double
//    init(height:Double) {
//        print("MokeyMan第一阶段开始")
//        //对子类引入的属性初始化
//        self.height = 100.0
//        //对父类引入的属性进行初始化
//        super.init(age: 40)
//
//        print("MokeyMan第二阶段开始")
//        if height < 110.0 {
//            self.age = 40
//        }
//    }
//}
//var m = MonkeyMan(height: 31)
//
//
///** 重写指定构造方法:子类的构造方法和父类的一模一样 **/
//class Man4 {
//    var name:String
//    init(name:String) {
//        self.name = name
//    }
//}
//class SuperMan4: Man4 {
//    var age:Int
//    init() {
//        self.age = 25
//        super.init(name: "we")
//    }
//
//    //将父类的指定构造器重写成一个便利构造器, 必须加上override关键字, 表示重写父类方法
//    convenience override init(name: String) {
//        self.init(name: name)
//        self.age = 50
//    }
//}
//
//
///** 便利构造方法不存在重写 **/
//class Man5 {
//    var name:String
//    init(name:String) {
//        self.name = name
//    }
//    convenience init(){
//        self.init(name:"hello")
//    }
//}
//
//class SuperMan5: Man5 {
//    var age:Int
//    init(age:Int) {
//        self.age = age
//        super.init(name: "hi")
//    }
//    //1.Swift中便利构造方法不存在重写, 如果加上override关键字, 系统会去查找父类中有没有和便利构造方法一样的指定构造方法, 有旧不报错, 没有就报错
//    //2.为什么便利构造器不能重写呢? 因为便利构造器只能横向代理, 只能调用当前类的其它构造方法或指定方法, 不可能调用super. 所以不存在重写
//    //3.也就是说子类的便利构造方法不能直接访问父类的便利构造方法, 所以不存在重写的概念
//    convenience init(){
//        self.init(age: 30)
//    }
//}
////早期版本中如果字符类中有同名便利构造器会报错, 现在则不会.
//var sm = SuperMan5()
//print("name = \(sm.name)  age = \(sm.age)")
//
//
//
///*
// 构造方法的自动继承:
// 1.如果子类中没有定义构造器, 且子类所有的存储属性都有缺省值, 会继承父类中所有的构造方法(包括便利构造器);
// 2.如果子类中只是重写所有的指定构造器, 不管子类中的存储属性是否有缺省值, 都不会继承父类的其他构造方法;
// 3.如果子类重写了父类中的指定构造器, 不管子类中的存储属性是否有缺省值, 都会同时继承父类中的所有便利方法.
// */
//class Person6 {
//    var name:String
//    var age:Int
//    init(name:String, age:Int) {
//        self.name = name
//        self.age = age
//    }
//    init(name:String) {
//        self.name = name
//        self.age = 0
//    }
//    convenience init()
//    {
//        self.init(name: "we")
//    }
//}
//class SuperMan6: Person6 {
//    var height:Double
//    init(height:Double) {
//        self.height = height
//        super.init(name: "we", age: 25)
//    }
//    override init(name: String, age: Int) {
//        self.height = 178.0
//        super.init(name: name, age: age)
//    }
//    override init(name: String) {
//        self.height = 178.0
//        super.init(name: name)
//    }
//}
//// 如果子类中没有定义任何构造器, 且子类中所有的存储属性都有缺省值, 会继承父类中所有的构造方法(包括便利构造器)
//// 父类的存储属性是由父类的构造器初始化, 子类的存储属性是由缺省值初始化的
////var sm = SuperMan6(name: "we", age: 30)
////var sm = SuperMan6(name: "we")
////var sm = SuperMan6()
////print(sm.height)
//
//// 如果子类中只是重写了父类中的某些指定构造器, 不管子类中的存储属性是否有缺省值, 都不会继承父类中的其它构造方法
////var sm = SuperMan(height: 198.0)
//
//// 如果子类重写了父类中所有的指定构造器, 不管子类中的存储属性是否有缺省值, 都会同时继承父类中的所有便利方法
//var sm6 = SuperMan6()
//
//
//
///*
// 必须构造器:
// 只要在构造方法的前面加上一个 required 关键字, 那么所有的子类(后续子类)只要定义了构造方法都必须实现该构造方法
// */
//class Person7 {
//    var name:String
//    required init(name:String){
//        self.name = name
//    }
//}
//class SuperMan7: Person7 {
//    var age:Int
//    init() {
//        self.age = 24
//        super.init(name: "we")
//    }
//    required init(name: String) {
//        self.age = 24
//        super.init(name: name)
//    }
//}
//var sm7 = SuperMan7(name: "we")
//
//
//
//
//
//
//




//: [Next](@next)
