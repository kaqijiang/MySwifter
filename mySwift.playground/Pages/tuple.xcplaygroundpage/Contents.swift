
//: # page6 tuple
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, tuple"


/**
 
 元祖:
 在其他语言中很早就有元组的概念，但是对于OC程序员来说这是个新的概念。
 将多个相同或者不同类型的值，用一个小括号括起来就是元组
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


//: [Next](@next)
