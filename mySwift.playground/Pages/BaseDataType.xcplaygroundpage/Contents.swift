
//: # page5 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang  
//: [previous](@previous)




import Foundation


/*
 基本数据类型
 OC:
 整型  int intValue = 10;
 浮点型 double doubleValue = 10.10; float floatValue = 5.1;
 长 long
 短 short
 有符号 signed
 无符号 unsigned
 各种类型的数据的取值范围在不同位的编译器下取值范围不同
 
 Swift:注意关键字大写
 */

/*整数范围
    Swift 提供了 8，16，32 和 64 位编码的有符号和无符号整数
 
    在32位平台上， Int 的长度和 Int32 相同。
    在64位平台上， Int 的长度和 Int64 相同。
*/
let minValue8 = UInt8.min // 最小值是 0, 值的类型是 UInt8
let maxValue8 = UInt8.max // 最大值是 255, 值得类型是 UInt8

let minValue32 = UInt32.min // 最小值是 0, 值的类型是 UInt32
let maxValue32 = UInt32.max // 最大值是 4294967295, 值得类型是 UInt32

let minValue64 = UInt64.min // 最小值是 0, 值的类型是 UInt64
let maxValue64 = UInt64.max // 最大值是 18446744073709551615, 值得类型是 UInt64

var intValue = 20
var intValues: Int = 1234567890123456789 // 等于Int64


//浮点型

var floatValue = 20.1//默认是double
var floatValues: Float = 20.12345// 表示32位浮点数

var doubleValue = 20.10222222222111122
var intValue1:Double = 10.10 // 表示64位浮点数

//如果按照长度划分,Swift中的长短比OC更加精确

var intValue3:Int8 = 123          //占1个字节
var intValue4:Int16 = 12345       //占2个字节.
var intValue5:Int32 = 1234546789  //占4个字节.
var intValue6:Int64 = 1234567890123456789  //Int 默认就是Int64占8个字节

//有符号无符号，默认是有符号的(UInt8/UInt16/UInt32/UInt64)

var uintValue7:UInt = 10

//注意：无符号的数比有符号的取值范围更大, 因为符号位也用来存值

//类型安全和类型推断
//Swift是类型安全的语言, 如果取值错误会直接报错, 而OC不会
/*
 取值不对
 OC:unsigned int intValue = -10; 不会报错
 Swift:var intValue:UInt = -10 会报错
 溢出:
 OC:int intValue = INT_MAX + 1; 不会报错
 Swift:var intValue:UInt = UInt.max + 1 会报错
 */

/*
 数据类型的相互赋值(隐式类型转换)
 OC可以
 int intValue = 10;
 double doubleValue = intValue;
 
 Swift:不可以
 var intValue8:Int = 10
 var doubleValue:Double = intValue8
 在Swift中“值永远不会被隐式转换为其他类型”(OC中可以隐式类型转换), 以上语句会报错
 */

var intValue8:Int = 10
var doubleValues:Double = Double(intValue8)
type(of: doubleValues)
/*
 数值型字面量
 一个十进制数，没有前缀
 一个二进制数，前缀是 0b
 一个八进制数，前缀是 0o
 一个十六进制数，前缀是 0x
 */
let decimalInteger = 1_700_00 //数值型字面量也可以增加额外的格式使代码更加易读
let binaryInteger = 0b10001 //二进制数
let octalInteger = 0o21 // 八进制数
let hexadecimalInteger = 0x11 //十六进制数


/*
 十进制数与 exp  的指数，结果就等于基数乘以 10exp：

1.25e2 意味着 1.25 x 102, 或者 125.0  .
1.25e-2  意味着 1.25 x 10-2, 或者 0.0125  .
十六进制数与 exp 指数，结果就等于基数乘以2exp：

0xFp2  意味着 15 x 22, 或者 60.0 .
0xFp-2  意味着 15 x 2-2, 或者 3.75 .

*/




//: [Next](@next)
