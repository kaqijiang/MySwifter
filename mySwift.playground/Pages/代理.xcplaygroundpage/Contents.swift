
//: # page23 BaseDataType
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, playground"

// 一.视图界面中

//制定协议，
protocol DelegateName: NSObjectProtocol{
    //设置协议方法
    func method()
}
//在Swift中,制定协议需要遵守NSObjectProtocol协议, 除了类可以遵守协议, 结构体也可以遵守协议;
//在OC中我们制定协议, 通常继承自NSObject, 可以这样理解,所有继承自NSObject的对象都可以实现协议方法(同样我们也可以指定哪些对象可以实现我们制定的协议方法);

//定义代理
weak var delegate1: DelegateName?

//判断代理是否存在，让代理去执行方法
func clickBtn() {
    delegate1?.method()//用可选链代替responsed
}
// 二.在控制器界面

/*! 由于在main函数里无法运行, 所以暂且注释;
class ViewController: UIViewController, DelegateName {//遵守协议
    //设置代理
    customView?.delegate1 = self
    
    // 3.实现协议方法
    func method(){
        print("实现协议方法")
    }
}
 */

protocol BugTicketDelegate: class {
    func buyTicket()
}

class Person {
    weak var delegate: BugTicketDelegate?
    func goToBeiJing() {
        delegate?.buyTicket()
    }
}

class YellowCattle: BugTicketDelegate {
    func  buyTicket() {
        print("黄牛买票")
    }
}

let yellowCattle = YellowCattle()
let person = Person()
person.delegate = yellowCattle
person.goToBeiJing()




//: [Next](@next)
