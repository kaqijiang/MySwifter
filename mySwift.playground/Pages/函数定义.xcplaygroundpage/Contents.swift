
//: # page21 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, playground"


/*
 函数: 完成某个特定任务的代码块, 给代码起一个合适的名称, 称为函数名称; 以后需要执行代码块只需要利用函数名称调用即可.
 格式:
 func 函数名称(参数名:参数类型, 参数名:参数类型,...) -> 函数返回值 {函数实现部分}
 
 OC:
 - (void)sayHello//无参无返回值
 {
 NSLog(@"hello");
 }
 - (void)sayWithName:(NSString *)name//有参无返回值
 {
 NSLog(@"hello %@", name);
 }
 - (void)sayWithName:(NSString *)name age:(NSInteger)age//有多参无返回值
 {
 NSLog(@"hello %@ , I'm %tu years old", name, age);
 }
 - (NSString *)info//无参有返回值
 {
 return @"name = lnj, age = 30";
 }
 - (NSString *)infoWithName:(NSString *)name age:(NSInteger)age//有参有返回值
 {
 return [NSString stringWithFormat:@"name = %@, age = %tu", name, age];
 }

 Person *p = [[Person alloc] init];
 [p sayHello];
 [p sayWithName:@"lnj"];
 [p sayWithName:@"lnj" age:30];
 NSLog(@"%@", [p info]);
 NSLog(@"%@", [p infoWithName:@"xiaohange" age:23]);
 
 */

//swift

//无参无返回值
func say()->Void {
    print("hello")
}
func say1() {// 如果没有返回值可以不写
    print("hello word")
}

say()
say1()

//有参无返回值
func sayWithName(name:String) -> Void {
    print(name)
}
func sayWithName1(name: String) {
    print(name)
}

sayWithName(name: "lili")
sayWithName1(name: "liMing")

// 无参有返回值
func sayHi() -> String {
    return "hi"
}
print(sayHi())

// 有参有返回值
func sayWithName2(name: String) -> String {
    
    return "\(name)17"
}

sayWithName2(name: "tiantian")


/********** 嵌套函数 **********/
func showArray(array:[Int])
{
    for number in array {
        print("\(number)")
    }
}
showArray(array: [1,2,3,4,5])

/*********** 冒泡排序,插入排序,选择排序,快速排序 ***********/

//通过将inout关键字放在参数的类型之前，可以编写一个输入参数。一个在出参数具有传递的值中，由函数修改的功能，并将该部分送回出的功能来代替原来的值。有关输入输出参数和相关编译器优化的详细讨论//可以简单理解为地址传递
//冒泡
func bubbleSort(array1:inout [Int]) {
    
//    func swap ( a:inout Int, b:inout Int) {
//        let temp = a
//        a = b
//        b = temp
//    }
    
    for _ in 0 ..< array1.count {
        for j in 0 ..< array1.count - 1 {
            if array1[j] > array1[j + 1] {
//
//                let stmp = array1[j]
//                array1[j] = array1[j + 1]
//                array1[j + 1] = stmp
//                array1.swapAt(0, 1)
                
//                swap(a: &array1[j], b: &array1[j + 1])//报错
                //这个增加的原因是带有两个`inout`参数的`swap`与[SE-0176] [SE-0176]中提出的新的专用存储器访问规则是不兼容的。现有的`swap（_：_ :)`函数将不再用于交换同一个集合中的两个元素。
                array1.swapAt(j, j + 1)//现有的`swap（_：_ :)`函数不同，`swapAt（_：_ :)`将元素的索引交换
            }
        }
    }
}

var arr:Array<Int> = [10, 23, 22, 40, 6]
bubbleSort(array1: &arr)


//插入排序
var arr1: Array<Int> = [40, 34, 23, 9, 12]

for i in (0 ..< arr1.count) {
    var key = arr1[i]
    var j = i - 1
    
    while j >= 0 {
        if arr1[j] > key {
            
            arr1[j + 1] = arr1[j]
            arr1[j] = key
        }
         j -= 1
    }
    print(arr1)
}

// 选择排序
var arr2:Array<Int> = [100, 304, 203, 90, 102]

for i in (0 ..< arr2.count - 1) {
    
    let index = i
    
    for j in (i ..< arr2.count) {
        if arr2[index] > arr2[j] {
            arr2.swapAt(j, i)
        }
    }
}

print(arr2)

/*********** 两种快速排序: ***********/

var array = [66,13,51,76,81,26,57,69,23]

func partition( list:inout [Int], left: Int, right: Int) -> Int {
    
    var pivot_index = left
    let piovt = list[left]
    
    for i in left ... right {
        print(i)
        
        if list[i] < piovt {
            
            pivot_index += 1
            if pivot_index != i {
                
                list.swapAt(list[pivot_index],list[i])
            }
        }
    }
    list.swapAt(list[left],list[pivot_index])
    return pivot_index
}

func quickSortArray( list:inout [Int],left:Int,right:Int) -> Void{
    
    if left < right {
        
        let pivot_index = partition(list: &list, left: left, right: right)
        
        quickSortArray(list: &list, left: left, right: pivot_index - 1)
        quickSortArray(list: &list, left: pivot_index + 1, right: right)
    }
}
quickSortArray(list: &array, left: 0, right: array.count - 1)
showArray(array: array)

// quick sort 2
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    return quicksort(less) + equal + quicksort(greater)
}

let list1 = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
print(quicksort(list1))

//: [Next](@next)
