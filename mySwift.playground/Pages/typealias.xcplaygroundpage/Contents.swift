
//: # page13 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

//类型别名 类型别名可以为已经存在的类型定义了一个新的可选名字。用 typealias 关键字定义类型别名。


typealias AudioSample = UInt16


var maxAmplitudeFound = AudioSample.min

//AudioSample 就是 UInt16 的别名，因为这个别名的存在，我们调用 AudioSample.min 其实就是在调用 Int16.min ，在这里变量 maxAmplitudeFound 被提供了一个初始值  0

//: [Next](@next)
