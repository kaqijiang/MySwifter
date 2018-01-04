
//: # page11 array
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, array"

//声明
//Swift数组中的类型必须一致，这一点与OC不同
//数组以有序的方式来储存相同类型的值。相同类型的值可以在数组的不同地方多次出现。
//NSArray是一个类，Array是一个结构体

//有值数组
var arr0 = [1,2,3]
var arr3: [Int] = [1,2,3]

var arr1: Array = [1,2,3]
var arr2: Array<Int> = [1,2,3]

var threeDoubles = Array(repeating: 0.0, count: 3)

// var arr4: Int[] = [1,2,3] // 早期写法 已废弃

//空数组
//var arr5 = [] // 已废弃
var arr6 = [Int]()
var arr7 = Array<Int>()
print(arr7)

//不可变数组
let arr8 : [Int] = []
//可变数组
var arr9 : [String] = [String]()

/*
 元素类型
 OC:
 NSArray *arr = @[@1, @"lnj", @1.75];
 NSLog(@"%@", arr);
 */
var arr10 = [1,"hjq",1.65] as [Any]
print(arr10)
print(arr10[2])
// 打印结果:  [1, "hjq", 1.6499999999999999]
// 1.65

//如果想明确表示数组中存放的是不同类型的数据, 可以使用Any关键字, 表示数组中可以存放不同类型的数据
var arr11:Array<Any> = [1,"hjq",1.75]
print(arr11)
print(arr11[2])
// 打印结果:  [1, "hjq", 1.75]
// 1.75

/*
 数组操作
 1.获取长度
 OC:
 NSArray *arr = @[@1, @2, @3];
 NSLog(@"%tu", arr.count);
 */
var arr12 = [1,2,3]
print(arr12.count)

/*
 2.判断是否为空
 OC:
 NSArray *arr = @[];
 NSLog(@"%d", arr.count != 0);
 */
var arr13 = [1,2,3]
print(arr13.isEmpty)

/*
 3.检索
 OC:
 NSArray *arr = @[@1, @2, @3];
 NSLog(@"%@", arr[0]);
 */
var arr14 = [1,2,3,4]
print(arr14[0])

/*
 4.追加
 OC:
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 [arr addObject:@4];
 NSLog(@"%@", arr);
 */
var arr15 = [1,2,3]
arr15.append(4)
print(arr15)

var arr16 = [1,2,3]
arr16 += [4]
print(arr16)
arr16 += arr16[0...1] // 也可以借助自己数组元素追加
print(arr16)

/*
 5.插入
 OC:
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 [arr insertObject:@4 atIndex:0];
 NSLog(@"%@", arr);
 */
var arr17 = [1,2,3]
arr17.insert(4, at: 0)
print(arr17)

/*
 6.更新
 OC:
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 arr[0] = @8;
 NSLog(@"%@", arr);
 */
var arr18 = [1,2,3]
arr18[0] = 0
arr18[0...2] = [4,5,6]
print(arr18)

/*
 7.删除
 OC:
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 [arr removeObject:@1];
 NSLog(@"%@", arr);
 
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 [arr removeLastObject];
 NSLog(@"%@", arr);
 
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 [arr removeAllObjects];
 NSLog(@"%@", arr);
 */
var arr19 = [1,2,3]
arr19.remove(at: 0)
print(arr19)

var arr20 = [1,2,3,4]
arr20.removeLast()
print(arr20)

var arr21 = [1,2,3,4]
arr21.removeFirst()
print(arr21)

var arr22 = [1,2,3,4]
arr22.removeAll(keepingCapacity: true) // 是否保持容量, 如果为true, 即使删除了容量依然存在, 容量是2的倍数
print(arr22)
print(arr22.capacity)
//注意: 如果数组是一个不可变数组不能更新/插入和删除
//第一个版本的不可变数组是可以修改的

/*
 Range
 OC:
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 [arr removeObjectsInRange:NSMakeRange(0, 2)];
 NSLog(@"%@", arr);
 */

//移除某区间位置的数组元素
var arr23 = [1,2,3]
//arr22.removeRange(Range(start: 0, end: 1)) 2.0写法 已废弃
arr23.removeSubrange(0...1)
print(arr23)

var arr24 = [1,2,3]
arr24.replaceSubrange(0..<1, with: [8])
print(arr24)

// 其实Range就是半闭区间
var range = 0...5
//range = 99 // 通过报错可以推断出类型
print(range) // 通过答应也可以推断出类型

/// 这个知识点需要再探索一次 range
//var range1:Range<Int> = 0...5
//var range2:Range<String>; // 必须遵守ForwardIndexType协议
// start 起点 end 终点
//var range3:Range<Int> = Range(start: 0, end: 5)
//var range4:Range<Int> = 0..<5

//print(range3)
//print(range4)




/*
 数组的批量操作
 OC:
 NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
 NSRange range = NSMakeRange(0, 2);
 // [arr replaceObjectsInRange:range withObjectsFromArray:@[@99, @88]];
 [arr replaceObjectsInRange:range withObjectsFromArray:@[@99, @88, @77, @66]];
 NSLog(@"%@", arr);
 */
var arr = [1,2,3]
//arr[0...1] = [99,98]
//arr[0...1] = [99,88,77]
//等价于上一行代码
arr.replaceSubrange(0...1, with: [99,88,77])
print(arr)

/*
 4.遍历
 OC:
 NSArray *arr = @[@1, @2, @3];
 for (int i = 0; i < arr.count; i++) {
 NSLog(@"%@", arr[i]);
 }
 
 for (NSNumber *number in arr) {
 NSLog(@"%@", number);
 }
 */
var arr111 = [1,2,3]
// 2.0
//for var i = 0 ; i < arr1.count ; i++
//{
//    print(arr1[i])
//}
// 3.0
for i in 0..<arr111.count
{
    print(arr111[i])
}
for number in arr111
{
    print(number)
}

//取出数组中某个区间范围的值
var arr1112 = [1,2,3]
for number in arr1112[0..<3]
{
    print(number)
}


for (index, value) in arr1112.enumerated() {
    print("Item \(index + 1): \(value)")
}






