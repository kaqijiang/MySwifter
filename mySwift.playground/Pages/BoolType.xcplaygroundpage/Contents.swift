
//: # page5 BoolType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "BOOL"

/*
 C和OC没有真正的布尔类型
 C语言的Bool类型非0即真
 OC语言的Bool类型是typedef signed char BOOL;
 Swift引入了真正的Bool类型
 Bool true false
 */


let isOpen:Bool = true

//自动推导
let isOpen1 = false

//let isOpen2:Bool = 1

//swift中的if的条件只能是一个Bool的值或者返回bool类型的表达式（== != >= <= > <）
//OC中的if可以是任何整数。（非0几真） 但是存在的问题是可能将判断写错, 写成赋值 if(isOpen = 2), 在开发中为了避免这个问题有经验的程序员会这样写 if(2 == isOpen) 来避免这个问题. 在Swift中很好的解决了这个问题


if isOpen {
    print("open")
}else{
    print("close")
}

//下边这个会提示 不是bool类型。编译不通过 Swift 的类型安全机制会阻止你用一个非布尔量的值替换掉 Bool
//let i = 1
//if i {
//    // this example will not compile, and will report an error
//}

let i = 1
if i == 1 {
    // 这个就可以。因为i==1 这个表达式返回的是bool类型
}

//: [Next](@next)
