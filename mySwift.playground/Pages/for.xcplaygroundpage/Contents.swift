
//: # page18 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

/*
 Swift:
 0.for后的圆括号可以省略
 1.只能以bool作为条件语句
 2.如果只有条指令for后面的大括号不可以省略
 3.for后面的三个参数都可以省略, 如果省略循环保持语句, 那么默认为真
 */


// Swift:
//for in 一般用于遍历区间或者集合

var sum1: Int = 0

for i in 0..<10 {
    sum1 += i
}
//数组
for dict in ["name":"xiaoMing","age":23] as [String:Any] {
    print(dict)
}

for (key, value) in ["name":"xiaoMing","age":23] as [String:Any] {
    print(key,value)
}

//数组索引
let numberList = [1,2,3,4,5]

for num in numberList.enumerated() {
    print(num)
    print(num.offset)//index
    print(num.element)//value
}

//倒序
for (index, item) in numberList.enumerated().reversed() {
    print("sdsds\(index)")
    print(item)
}


//跨步遍历
/* 0 ~ 50 的遍历 跨步 10
 此种方法相当于遍历开区间 0..<50, [0,50) 不会遍历最后一个数
 用法常见对数组的遍历，可防止数组取值越界
 */
for i in stride(from: 0, to: 50, by: 10) {
    print(i)
}
/* 0 ~ 20  的遍历 跨步 5
 此种方法相当于遍历 0..<50 [0,50] 闭区间 会遍历最后一个数
 */
for i in stride(from: 0, through: 50, by: 10) {
    print(i)
}
//元组遍历

let tupleArr = [("zhangShang",60,170.0),
                ("liSi",77,175.0),
                ("wangWu",80,180.0)]
for item in tupleArr {
    print(item.0,item.1,item.2)
}




//: [Next](@next)
