
//: # page4 TypeConversion
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation



/**

 Swift不允许隐式的类型转换，但是可以使用显式的类型转换（强制转换）

 
 OC： 
    int intValue = 10;
    Double doubleValue = intValue

 */

//Swift


var intValue:Int = 10

var doubleValue :Double

doubleValue = Double(intValue)


var doubleValue2 :Double = Double(intValue)

print(doubleValue)
print(doubleValue2)

//: [Next](@next)
