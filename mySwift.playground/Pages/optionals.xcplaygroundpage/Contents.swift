
//: # page7 optionals
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, optionals"


/**
 可选项：optionals 有两种状态
 1.有值 2、没有值，没有值就是nil
 
 */

//有值
var optionValue :Int? = 9

//没有值
var optionValue1 :Int?
var optionValue2 :Int? = nil

//可选项的只可以用if来判断

var optionValue3 :Int?

if optionValue3 != nil{
    print(optionValue3 ?? "")
}else{
print("optionValue3","是nil")
}

/*
 提取可选类型的值(强制解析)
 会将optValue中的整型值强制拿出来赋值给result, 换言之就是告诉编译器optValue一定有值, 因为可选类型有两种状态 有值和没有值, 所以告诉编译器到底有没有值
 需要注意的是如果强制解析optValue, 但是optValue中没有值时会引发一个运行时错误
 */

var optionValue4: Int? = 10

var result1: Int = optionValue4!//强制解包

//报错:
//var optValue6: Int?
//var result2: Int = optValue6!


/*
 If 语句以及强制展开
 你可以利用 if 语句通过比较 nil 来判断一个可选中是否包含值。利用相等运算符 （ == ）和不等运算符（ != ）。如果一个可选有值，他就“不等于” nil ：
 */

var convertedNumber: Int? = nil

if convertedNumber != nil {
    print(convertedNumber!)
}


/*
 可选绑定:
 为了安全的解析可选类型的值, 一般情况下使用可选绑定
 如果optValue没有值就不会做任何操作, 如果opValue有值会返回并将optValue的值赋值给result执行大括号中的内容
 */
var optionValue6: Int?

if let result3 = optionValue6 {
    print(result3)
}

var optionValue7: Int? = 11

if let result4 = optionValue7 {
    print(result4)
}

//他不能包含其他的值，例如 Bool 值或者 String 值。它要么是 Int 要么什么都没有。）
let possibleNumber = "123s"
let convertedNumbers = Int(possibleNumber)
type(of: convertedNumbers)//这是个可选的Int 要么有值是Int要么nil

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}


//: [Next](@next)
