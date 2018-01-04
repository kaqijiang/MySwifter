
//: # page8 Char&String
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, Char&String"

/**
 字符：
 OC     char charValueOc = 'a';
 swift  var charValueSwift = "a"
 */

/*
 Swift和OC字符不一样
 1.Swift是用双引号
 2.Swift中的字符类型和OC也不一样, OC中的字符占一个字节, 因为它自包含ASCII表中的字符, 而Swift中的字符除了可以存储ASCII表中的字符还可以存储unicode字符
 例如中文:
 OC:char charValue = '间'
 Swift: var charValue: Character = "间" // 正确
 
 OC的字符是遵守ASCII标准的,Swift的字符是遵守unicode标准的, 所以可以存放实际上所有国家的字符(大部分)
 */

var charValue: Character = "间"
/*
 注意:双引号中只能放一个字符, 如下是错误写法
 var charValue: Character = "abc"
 */



/*
 字符串:
 字符是单个字符的集合, 字符串十多个字符的集合, 想要存放多个字符需要使用字符串
 
 C:
 char *stringValue = "ab"
 char stringStr = "ab"
 
 OC:
 NSString *stringArr = "ab";
 */
var stringValue1 = "ab"

//比OC多了多行字符串
var strings = """
dsafsa
sadfaf
asfda
asfd
"""
print(strings)

/*
 C语言中的字符串是以\0结尾的,例如:
 char *sringValue = "abc\0def"
 printf("%s", stringValue);
 打印结果为: abc
 
 OC语言中的字符串也是以\0结尾的, 例如:
 NSString *StringValue = @"abc\0def";
 printf("%@", stringValue);
 打印结果为: abc
 */
var stringValue2 = "abc\0def"
print(stringValue2)
stringValue2.count
// 打印结果为:abcdef
// 从此可以看出Swift中的字符串和C语言/OC语言中的字符串是不一样的

//通过检查布尔量 isEmpty属性来确认一个 String值是否为空：
var stringValue3 = ""
if stringValue3.isEmpty {
    
    print("空的")
}

//连接字符串和字符

var string1 = "hello"
let string2 = "  word"

var welcome = string1 + string2

string1 += string2

string1 .append(string2)


//字符串插值

//multiplier的值以 \(multiplier)的形式插入到了字符串字面量当中。当字符串插值需要被用来创建真的字符串的时候，这个占位符就会被 multiplier的真实值代替。
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)) \(String (multiplier))"

//字符串索引

let greeting = "Guten Tag!"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]

greeting[greeting.index(after: greeting.startIndex)]
//第一位之后多少位
greeting[greeting.index(greeting.startIndex, offsetBy: 8)]


//你可以在任何遵循了 Indexable 协议的类型中使用 startIndex 和 endIndex 属性以及 index(before:) ， index(after:) 和 index(_:offsetBy:) 方法。这包括这里使用的 String ，还有集合类型比如 Array ， Dictionary 和 Set 。




/*
 字符串比较
 Swift 提供了三种方法来比较文本值：字符串和字符相等性，前缀相等性以及后缀相等性。
 */

//如同比较运算符中所描述的那样，字符串和字符相等使用“等于”运算符 ( ==) 和“不等”运算符 ( !=)进行检查：

//SWift: (== || != || >= || <= )和C语言的strcmp一样是逐个比较的

var str2 = "abc"
var str3 = "abc"

if str2 == str3 {
    print("equal")
}else{
    print("不相等")
}

var str4 = "abc"
var str5 = "acb"

if str4 >= str5 {
    print("大于等于")
}else {
    print("小于")
}

let quotation = "We're a lot alike, you and I."

let sameQuotation = "We're a lot alike, you and I."

if quotation == sameQuotation {
    print("same")
}



//转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。

//字符串便利
var strs = "adc中文"
//for c in strs.characters//3.0用
for c in strs {
    print(c)
}
//计算字符串的长度 中英文
//strs.characters.count 3.0
strs.count


/**
 格式化字符串
 
 C: 相当麻烦，指针，下标等方式
 
 OC：
 NSString *str = [NSString stringWithFormat:@"%d.jgp",1];
 
 */
//swift

var str1 = "https://github.com/\(1)"


//ComparisonResult是一个枚举类型，包含了以下3个成员：
//
//  orderedAscending（-1）：左操作数小于右操作数。
//
//  orderedSame（0）：两个操作数相等。
//
//  orderedDescending（1）：左操作数大于右操作数。

// 区分大小写

str5.compare("acc").rawValue
str5.compare("acb").rawValue
str5.compare("aBb").rawValue

//不区分大小写

str5.caseInsensitiveCompare("aCC").rawValue
str5.caseInsensitiveCompare("ACB").rawValue
str5.caseInsensitiveCompare("aBC").rawValue


/*
 判断前后缀
 
 OC:
 NSString *str = @"http://www.123.com";
 if ([str hasPrefix:@"http"]) {
 NSLog(@"是url");
 }
 
 if ([str hasSuffix:@".com"]) {
 NSLog(@"是天朝顶级域名");
 }
 */

var str6 = "http://www.123.com"

if str6.hasPrefix("http") {
    print("是的")
}
if str6.hasSuffix(".com") {
    print("是的")
}


/**
 公共前缀
 */

var str7 = "http:DAXIE"
var str8 = "http:daxie"

str8.commonPrefix(with: str7)
//高级用法不区分大小写
str8.commonPrefix(with: str7, options: .caseInsensitive)

/*
 大小写转换
 OC:
 NSString *str = @"abc.txt";
 NSLog(@"%@", [str uppercaseString]);
 NSLog(@"%@", [str lowercaseString]);
 */

var str9 = "abc.txt"
str9.uppercased()
str9.lowercased()

//首字母大写
str9.capitalized

/**
 
 分割
 */

//字符串根据指定的字符串参数进行分割，并将分别的内容转换为一个数组

var str10 = String("A,B,-3,C,d,-3e,f,g,h,i,g,k")
str10.components(separatedBy: ",")//返回字符串数组

//字符串根据指定的字符编码参数进行分割，并将分别的内容转换为一个数组

var b:CharacterSet = NSCharacterSet(charactersIn:"*") as CharacterSet
str10.components(separatedBy: b)//输出数组只有一个元素，因为str10没有“*”

var c = NSCharacterSet(charactersIn:"-3") as CharacterSet
str10.components(separatedBy: c)


/**
 截取
 截取字符串的方法OC有3种，分别为：substring(from:)、substring(with:)和substring(to:)方法。
 */
//var a=NSString(string: "Hello,World")
//a.substring(from: 1)
//
//
var str11 = "abcdefg"
let startIndex = str11.index(str11.startIndex, offsetBy: 2)

var ss = str11[startIndex...]//从第二个开始到无限大
//Swift3的接口已经被废弃，代码如下
// let substring1 = template.substring(from: indexStartOfText)

//截取到某个位置
ss = str11[..<startIndex]


//替换字符串
str11.replaceSubrange(...startIndex, with: "hello")

//插入和删除

//要给字符串的特定索引位置插入字符，使用 insert(_:at:)方法，另外要冲入另一个字符串的内容到特定的索引，使用 insert(contentsOf:at:) 方法。
//
var welcomes = "hello"
//
welcomes.insert("s", at: welcomes.endIndex)//插入字符
welcomes.insert("!", at: welcomes.endIndex)//插入字符

var str01 = "sdsd"

welcomes.insert(contentsOf: str01, at: welcomes.index(before: welcomes.endIndex))
welcomes.insert(contentsOf: str01, at: welcomes.endIndex)

//要从字符串的特定索引位置移除字符，使用 remove(at:)方法，另外要移除一小段特定范围的字符串，使用 removeSubrange(_:) 方法：

welcomes.remove(at: welcomes.index(before: welcomes.endIndex))
welcomes
let range: Range = welcomes.index(welcomes.endIndex, offsetBy: -6)..<welcomes.endIndex

welcomes.removeSubrange(range)
welcomes
welcomes.removeAll()
welcomes

//你可以在任何遵循了 RangeReplaceableIndexable 协议的类型中使用 insert(_:at:) ， insert(contentsOf:at:) ， remove(at:) 方法。这包括了这里使用的 String ，同样还有集合类型比如 Array ， Dictionary 和 Set 。


//join 字符串的连接
var arry = ["a","b","c"]
let res = arry.joined(separator: "_") //"a_b_c"

//查找字符串中某个字符穿出现的范围

str11 = "playskkswelcom"
str11.range(of:"play")

str11.range(of: "welcom", options: String.CompareOptions.caseInsensitive)//忽略大小写进行查找


//字符串转int
var str12 = "100"
(str12 as NSString).intValue

var str15 = "250"
// 如果str不能转换为整数, 那么可选类型返回nil
// str = "250sd", 不能转换所以可能为nil
var numerber:Int? = Int(str15)
if numerber != nil
{
    print(numerber!) // 2.0可以自动拆包,3.0以后则不会
}


//字符串包含。也可以用分割来实现，分割结果大于1就是存在
let str13="hello,mandarava."
let str14="mandarava"

//包含
str13.contains(str14)//4.0新增

//字符串包含。也可以用分割来实现，分割结果大于1就是存在
let ranges = str13.range(of: str14)

if ranges != nil{
    print("包含")

}














//: [Next](@next)
