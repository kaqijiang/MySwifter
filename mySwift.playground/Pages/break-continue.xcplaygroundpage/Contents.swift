
//: # page19 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

/*
 break: 跳出循环, 无论循环保持条件是否还为真都不会再执行循环
 continue: 跳出本次循环, 如果循环保持条件还为真还会继续执行循环
 */
var arr = [1,2,3,4,5,6]
for num in arr {
    if num == 2 {
        print("停止运行")
        break
    }
    print("没有找到")
}

var arr1: Array<Int> = [1,23,4,5,6,7,76]
var count: Int = 0;

for item in arr1 {
    if item % 2 != 0 {
        print("不能被2整除")
        continue
    }
    print("可以整除")
    count += 1
}
print(count)



//: [Next](@next)
