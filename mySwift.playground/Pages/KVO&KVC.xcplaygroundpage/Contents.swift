
//: # page23 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, playground"

/*
 KVO
 依然只有 NSObject 才能支持 KVO。 KVO 又是一个纯 OC 的特性
 //注意:被观察的属性需要用dynamic修饰，否则也无法观察到。
 //一个好消息是不需要在对象被回收时手动 remove observer。但是这也带来了另外一个容易被忽略的事情：观察的闭包没有被强引用，需要我们自己添加引用，否则当前函数离开后这个观察闭包就会被回收了。
 */



/*
 struct 也支持 KVC 了。但是并不是使用原有的setValue：forKeypath的api。而是利用了swfit 4增加的一个语法特性：自定义索引可以有参数名。
 */
struct ValueType {
    var name:String
}
var object = ValueType(name: "小明")
let name = \ValueType.name

//set
object[keyPath: name] = "Swift4"
//get
let valueOfName = object[keyPath:name]

//: [Next](@next)
