
//: # page6 tuple
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, tuple"


/**
 
 元祖:
 在其他语言中很早就有元组的概念，但是对于OC程序员来说这是个新的概念。
 
 元组把多个值合并成单一的复合型的值。用一个小括号括起来，元组内的值可以是任何类型，而且可以不必是同一类型。
 */

//先定义 后赋值
let game:(Int,String)
game = (11,"游戏")

//直接赋值。类型推导
let student = ("xiaoMing",19,"打游戏")
//option + click  let student: (String, Int, String)
print(student)
print(student.0)
print(student.1)
print(student.2)

let student1:(String, Int, Double) = ("小丽",18,19.2)

/**
 元组其实和结构体很像，只是不需要提前定义，那么没有定义的元组是什么类型呢？
 元组其实是符合类型，小括号里可以写任何类型
 
 */

/*
 元祖的其他定义方式:
 指明应用元祖元素的名称
 */


let student2 = (name:"小米",age:19)

print(student2.name)
print(student2.age)

/*
 元祖的其他定义方式:
 通过指定的名称提取元祖对应的值, 会将对应位置的值赋值给对应位置的名称
 */

let (name,age) = ("姓名",19)

print(name)
print(age)


/*
 如果不关心元祖中的某个值可以利用_通配符来忽略提取
 */

let (name1,age1,_) = ("xxx",19,23)

print(name1)
print(age1)


let stundent3 = (names:"yaTou",_:12)
print(stundent3.names)
print(stundent3)
print(stundent3.1)


/** 元组的定义 **/
// 一元元组, 会将编译器优化为其实际元素的类型.举例:
var t1 : (String) = ("我是字符串") // 等同于下面一行
//var t1 : String = "我是字符串"
//可以缺省类型 var t1 = "我是字符串"
//注意!!!: 由于t1实际为String类型, 因此t1.0的访问会报错


// 元组支持嵌套
var t_t : (String, (String, Int)) = ("基本信息",("name", 25))

//利用typealias 给元祖起别名
typealias namedFinshesType = (first:String,second:String, third:String)

let namedFinshes : namedFinshesType = ("111","222","333")

/** 元组的数据访问 **/
// 当元素未命名时, 采用自然顺序访问, 序号从0开始
var t2 = ("xxx", 25)
var names = t2.0
var ages = t2.1
print("name: \(names),age: \(ages)")

// 当元素命名时, 可以用命名访问数据, 当然仍可以使用序号进行访问
var t3 = (name:"xxx1", age: 26)
names = t3.0 // 或者 names = t3.name
ages = t3.1 //  或者 ages = t3.age
print("name: \(names),age: \(ages)")


// 可以用多个变量同时进行访问
var t4 = (name:"xxx2", 22)
var (name3, age3) = t4 // 即可同时获取name, age
var (name4, _) = t4 // 不需要时参数可以缺省

// 另外注意, 元组为数值类型, 因此元组的拷贝是值拷贝
var t5 = (name:"xxx3", 23)
var t5_copy = t5
t5.name = "李白"
print("\(t5_copy.name)")


// 关于元组的访问级别
/*
 * 元组的访问级别取决于它包含的元素，比如元组里的元素都是private级别的，那么该元组也是private级别的。
 * 遵循最小的原则，也就是说如果一个元组中有两个元素，一个为private级别，另一个为public级别，那么该元组遵循最小原则，它的访问级别为private。
 */
// 元素的数据修改
// 虽然元组的数据不能增删, 但是修改还是可以的
var t6 = (name:"xxx4", 26)
t6.name = "李白"
print(t6.name)
t6 = ("李大", 25)
print("\(t6.name)")

// 但是数据类型不能改变
//t6.name = 30 // 报错!

// 如果是常量定义, 元组的数据不能改变
let t7 = (name:"嘻嘻嘻", 23)
//t7.name = "李白" // 报错!

// 当然,如果指定数据类型为Any, 这种情况下数据可以改变类型
var t_any : (String, Any) = ("小韩哥", 25)
t_any.1 = "可以改变为String" // Any不限定数据类型

/** 元组与Array, Dictionary的组合定义**/
// 数组嵌套元素
var moneyArray:[(Int,String)] = [(20,"Cidy"), (18,"Nickle"), (14, "Quarter")]

// 字典嵌套元组
var userInfoDic:[String:(Int,String)] = ["cidy":(20,"girl"), "nickl":(15,"boy")]
print(userInfoDic) // 打印:["cidy": (20, "girl"), "nickl": (15, "boy")]



/** 元组的常见使用场景 **/

// 非常适用于Dictionary遍历
// 官方文档例子:
var airports: [String:String] = ["YYZ": "toronto", "DUB": "Dublin"]

// 遍历airports
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// 非常适合用于Array的enumerated()
// 官方文档例子:
var shoppingList = ["Eggs", "Milk"]
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// 适合函数返回多元数据
func userInfoOne() ->(String, Int) {
    return ("小韩哥", 26)
}

// 函数也可以返回可选元组, 即可以返回nil
func userInfoTwo() ->(String, Int)? {
    return nil
}

// 当然也可以部分元素为可选
func userInfoThree() -> (String?,Int) {
    return (nil, 26)
}

// 甚至可以用来给函数传递多元参数
// 定义一个函数, 有number和text两个参数
func doSomething(number: Int, text: String) {
    print("\(number) : \(text)")
}

// 正常调用方式
doSomething(number: 1, text: "one")

// 元组调用方式
let tupleVar = (1, "one")
//doSomething(tupleVar) 已废弃



/** 高级实例 **/
// 模拟情绪数据
var emoyions : [(type: String, strength: Int)] = [("happy",0),("scared",0),("tender",0)]

// 我想遍历数组, 然后对 happy进行+1, 我应该怎么做
for (index, emo) in emoyions.enumerated() {
    if emo.type == "happy" {
        emoyions[index] = (type: emo.type, strength: emo.strength+1)
    }
}
print(emoyions) // 打印:[(type: "happy", strength: 1), (type: "scared", strength: 0), (type: "tender", strength: 0)]

// 高级用法 - 解决同一个问题
// 这里用到了map, 具体方法可以看后面RxSwift中关于map的讲解, 这里不做解释
emoyions = emoyions.map {
    emo in
    if emo.type == "happy" {
        return (type:emo.type, strength:emo.strength+1)
    } else {
        return emo
    }
}




//: [Next](@next)
