
//: # page22 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, playground"

/*
 内部函数: 默认情况下的参数都是内部参数
 外部函数: 如果有多个参数的情况, 调用者并不知道每个参数的含义, 只能通过查看头文件的形式理解参数的含义
 那么能不能和OC一样让调用者直观的知道参数的含义呢? 使用外部参数
 外部参数只能外部用, 函数内部不能使用, 函数内部只能使用内部参数
 */

func divisionOperation1(a: Double, b: Double) -> Double {
    return a/b
}

func divisionOperation2(dividend: Double, divisor: Double) -> Double {
    return dividend / divisor
}
func divisionOperation3(dividend a: Double, divisor b: Double) -> Double {
    return a / b
}
//函数内部不能使用外部参数 3的dividend divisor就是外部参数。 a b 是内部参数
print(divisionOperation1(a: 10, b: 3.5))
print(divisionOperation2(dividend: 10, divisor: 3.5))
print(divisionOperation3(dividend: 10, divisor: 3.5))


func divisionOperation4(a: Double, divisor b: Double) -> Double {
    return a/b
}
print(divisionOperation4(a: 10, divisor: 3.5))

//dividend divisor即是内部参数也是外部参数
func divisionOperation5(dividend: Double, divisor: Double) -> Double{
    return dividend / divisor
}
print(divisionOperation5(dividend: 10, divisor: 3.8))

/*
 默认参数:
 可以在定义函数的时候给某个参数赋值, 当外部调用没有传递该参数时会自动使用默认值
 */
func joinString(s1:String ,toString s2:String, jioner s3:String) -> String
{
    return s1 + s3 + s2
}

func joinString2(s1:String ,toString s2:String, jioner s3:String = "默认值") -> String
{
    return s1 + s3 + s2
}

print(joinString2(s1: "hello", toString: "name"))

//如果指定了默认参数, 但是却没有声明外部参数时, 系统会自动把内部参数名称既作为内部参数也作为外部参数名称, 并且在调用时如果需要修改默认参数的值必须写上外部参数名称
func joinString3(s1:String ,toString s2:String, jioner:String = "默认值") -> String
{
    return s1 + jioner + s2
}
print(joinString3(s1: "hi", toString: "names" ,jioner: "❤️"))



//: [Next](@next)
