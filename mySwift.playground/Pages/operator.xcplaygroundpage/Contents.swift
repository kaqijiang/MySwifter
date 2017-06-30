
//: # page10 operator
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, operator"

/**
 赋值运算符
 数值运算符
 组合赋值运算符(Compound Assignment Operators)
 比较运算符
 三元条件运算符(Ternary Conditional Operator)
 区间运算符
 逻辑运算符
 */

/*
 算术运算符: 除了取模, 其它和OC一样, 包括优先级
 + - * / % ++ --
 */
//注意算数符号两个数之间要是有空格要都有。保持一致。

var result = 10 + 10

result = 10 - 10
result = 10 * 10
result = 10 / 10
/*
 注意:Swift是安全严格的编程语言, 会在编译时候检查是否溢出, 但是只会检查字面量而不会检查变量, 所以在Swift中一定要注意隐式溢出
 */
// 可以检测

// var num1:UInt8 = 255 + 1
// 无法检测
 var num1:UInt8 = 255
 var num2:UInt8 = 250
// var results = num1 + num2
// 遇到这种问题可以利用溢出运算符解决该问题:http://www.yiibai.com/swift/overflow_operators.html

// 溢出运算符 &+ &- &* &/ &%


/*
 OC: 只对整数取模
 NSLog("%tu", 10 % 3)
 
 Swift:支持小数取模
 注意:2.0支持, 3.0之后就不行了
 */
print(11 % 2)

//使用truncatingRemainder 小数取模

let value1 = 5.5
let value2 = 2.2
let result2 = value1.truncatingRemainder(dividingBy: value2)


//自增自减

var a = 1
a += 1
a -= 1

/*
 赋值运算
 = += -= /= *= %=
 */

var num3 = 10
num3 = 20
num3 += 10
num3 -= 10
num3 *= 10
num3 /= 10
num3 %= 5

/*
 基本用法和OC一样, 唯一要注意的是表达式的值
 OC: 表达式的结合方向是从左至右, 整个表达式的值整体的值等于最后一个变量的值, 简而言之就是连续赋值
 
 Swift: 不允许连续赋值, Swift中的整个表达式是没有值的. 主要是为了避免 if (c == 9) 这种情况误写为 if (c = 9) , c = 9是一个表达式, 表达式是没有值的, 所以在Swift中if (c = 9)不成立
 
 */
//var num4:Int
//var num5:Int
//num4 = num5 = 10 //报错


/*
 关系运算符, 得出的值是Bool值, 基本用法和OC一样
 > < >= <= == != ?:
 */
var resulta:Bool = 250 > 100
var resulta2 = 250 > 100 ? 250 : 100
print(resulta2)

/*
 逻辑运算符,基本用法和OC一样, 唯一要注意的是Swift中的逻辑运算符只能操作Bool类型数据, 而OC可以操作整形(非0即真)
 !  && ||
 */

var open = false
if !open
{
    print("打开")
}

var age = 20
var height = 180
var weight = 60
if (age > 25 && age < 40 && height > 175) || weight>50
{
    print("ok")
}


/*
 区间
 闭区间: 包含区间内所有值  a...b 例如: 1...5
 半闭区间: 包含头不包含尾  a..<b  例如: 1..<5
 注意: 1.Swift刚出来时的写法是 a..b
 2.区间只能用于整数, 写小数会有问题
 应用场景: 遍历, 数组等
 */
for i in 1...5
{
    print(i)
}

for i in 1..<5
{
    print(i)
}

//加法运算符也可用于字符串拼接
"hello, " + "world"

/*
 逻辑运算的操作对象是逻辑布尔值。Swift 支持基于 C 语言的三个标准逻辑运算。
 
 逻辑非(!a)
 逻辑与(a && b)
 逻辑或(a || b)
 */

var w = false

var e = true

var c = true
//使用括号来明确优先级

if (!w || e) && c{
    print("bingo")
}



//: [Next](@next)
