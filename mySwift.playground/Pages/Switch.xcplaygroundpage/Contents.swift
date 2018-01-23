
//: # page20 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

/** Swift:可以判断对象类型, OC必须是整数 **/

//不可以穿透
//可以不写break

var rank = "A"

switch rank {
    case "A":
        print("A")
    case "B":
        print("B")
    case "C":
        print("C")
    default:
        print("其他")
}

/*
 因为不能穿透所以不能这么写
 var rank1 = "A"
 switch rank1{
 case "A":
 case "B":
 print("B")
 case "C":
 print("C")
 default:
 print("其他")
 }
 */
//只能这么写

var rank1 = 1

switch rank1 {
case 1, 2 :
    print("走着里了")
case 3 :
    print("3")
default:
    print("其他")
}

//在case中定义变量不用加大括号
var rank4 = "A"
switch rank4{
case "A":
    var num = 10
    print("A")
case "B":
    print("B")
case "C":
    print("C")
default:
    print("其他")
}


//区间和元组匹配
var num = 10
switch num{
case 1...9:
    print("个位数")
case 10...99:
    print("十位数")
default:
    print("其他数")
}

var point = (10, 15)
switch point{
case (0, 0):
    print("坐标原点")
case (1...10, 10...20):
    print("坐标的X和Y在1~10之间") // 可以在元组中再加上区间
default:
    print("Other")
}


//值绑定
var point1 = (1, 10)
switch point1{
case (var x, 10):   // 会将point中的x赋值给
    print("x = \(x)")
case (1, var y): // 会将point中xy的值赋值给xy
    print("x =  y = \(y)")
default:
    print("Other")
}


//根据条件绑定
var point2 = (101, 100)
switch point2{
// 只有where后面的条件表达式为真才赋值并执行case后的语句
case var(x, y) where x > y:
    print("x = \(x) y = \(y)")
default:
    print("Other")
}
//: [Next](@next)
