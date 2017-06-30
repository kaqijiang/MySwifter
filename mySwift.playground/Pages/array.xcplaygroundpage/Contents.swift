
//: # page11 array
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, array"

//声明
//Swift数组中的类型必须一致，这一点与OC不同
//NSArray是一个类，Array是一个结构体

//有值数组
var arr0 = [1,2,3]
var arr1 :Array = [1,2,3,4]
var arr2 :Array<Int> = [1,2,3,4]
var arr3 :[Int] = [1,2,3,4]

// 空数组
var emptyArray1:[Int] = []
var emptyArray2:Array<Int> = []
var emptyArray3 = [Int]()
var emptyArray4 = Array<Int>()
//var emptyArray5 = []//报错 因为他不知道你数组类型

// 创建具有默认值的数组(相同元素的数组)
var allZeros = Array<Int>(repeating: 0, count: 5)
var allZeros2 = [Int](repeating: 0, count: 5)

//不可变数组
let arr8 : [Int] = []
//可变数组
var arr9 : [String] = [String]()


//如果想明确表示数组中存放的是不同类型的数据, 可以使用Any关键字, 表示数组中可以存放不同类型的数据 表示Any类型数据
var arr10 = [1,"ss",1.72]  as [Any]

var arr11: Array<Any> = [1,"hjq",1.75]

var arr12: [Any] = [1,"hjq",1.75]


print(arr10)
print(arr11[2])


//常用方法  //注意: 如果数组是一个不可变数组不能更新/插入和删除

//1.长度
arr10.count

//2.判断是否为空
arr10.isEmpty

// 3.检索
arr10[0]

//4.追加
arr10.append(4)

arr10 += ["多了"]

//追加元素
arr10 += arr11[0...1]

// 5.插入
var arr13 = [1,2,3]
arr13.insert(4, at: 0)

// 6.更新
arr13[0] = 90
arr13

//7.删除
var arr14 = [1,2,3,4,5,6,7]

arr14.remove(at: 0)
print(arr14)

arr14.removeLast()
print(arr14)

arr14.removeFirst()
print(arr14)

arr14.removeAll()
print(arr14)

arr13.removeAll(keepingCapacity: true) // 是否保持容量, 如果为true, 即使删除了容量依然存在, 容量是2的倍数
print(arr13)
print(arr13.capacity)

//8.移除某区间位置的数组元素
var arr15 = [1,2,3,4,5,6,7,7]
arr15.removeSubrange(0...1)

//替换
arr15.replaceSubrange(0..<2, with: [8])

//8.包含
var arr16 = [1,2,3,4,5,6,7,7]
arr16.contains(7)

//便利数组，看有没有符合+1 然后等于8的 有就直接返回true
arr16.contains { (element) -> Bool in
    
    element + 1 == 8
}

arr16.contains { (element) -> Bool in
    
    if element + 1 == 8 {
        return true
    }
    return false
}




// 其实Range就是半闭区间
//var range = 0...5
/// 这个知识点需要再探索一次 range
//var range1:Range<Int> = 0...5
//var range2:Range<String>; // 必须遵守ForwardIndexType协议
// start 起点 end 终点
//var range3:Range<Int> = Range(start: 0, end: 5)
//var range4:Range<Int> = 0..<5

//print(range3)
//print(range4)

//: [Next](@next)
