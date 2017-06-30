
//: # page9 String
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, String"


//字符串便利
var strs = "adc中文"
for c in strs.characters
{
    print(c)
}

//计算字符串的长度 中英文
strs.characters.count


/**
 格式化字符串
 
 C: 相当麻烦，指针，下标等方式
 
 OC：
 NSString *str = [NSString stringWithFormat:@"%d.jgp",1];
 
 */
//swift

var str1 = "https://github.com/\(1)"


/**
 
 字符串比较
 
 OC：
 NSString *str2 = @"abc";
 NSString *str3 = @"abc";
 
 if([str2 compare:str3] == NSOrderedSame)
 {
 NSLog(@"相等");
 }else
 {
 NSLog(@"不相等");
 }
 
 if(str2 isEqualToString:str3)
 {
    NSLog(@"相等");
 }else
 {
 NSLog(@"不相等");
 }
 
 */

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

var str10 = String("A,B,C,d,e,f,g,h,i,g,k")
str10?.components(separatedBy: ",")//返回字符串数组

//字符串根据指定的字符编码参数进行分割，并将分别的内容转换为一个数组

var b:CharacterSet = NSCharacterSet(charactersIn:"*") as CharacterSet
str10?.components(separatedBy: b)//输出数组只有一个元素，因为str10没有“*”

/**
 截取
 截取字符串的方法OC有3种，分别为：substring(from:)、substring(with:)和substring(to:)方法。
 */
var a=NSString(string: "Hello,World")
a.substring(from: 1)



//下边的是swift方式，---真麻烦
let startIndex = str9.index(str9.startIndex, offsetBy: 1)
str9.substring(from: startIndex)

str9.substring(to: startIndex)


let endIndex = str9.index(str9.endIndex, offsetBy: -1)
let strRange = startIndex ..< endIndex
str9.substring(with: strRange)


//替换字符串
str9.replaceSubrange(strRange, with: "hello")

//插入字符串
var insertIndex = str9.index(str9.startIndex, offsetBy: 2)
str9.insert("!", at: insertIndex)

//删除字符
str9.remove(at: insertIndex)
print(str9)

str9.removeSubrange(strRange)
print(str9)


//join 字符串的连接
var arry = ["a","b","c"]
let res = arry.joined(separator: "_") //"a_b_c"


//查找字符串中某个字符穿出现的范围

var str11 = "playskkswelcom"
str11.range(of:"play")
str11.range(of: "welcom", options: String.CompareOptions.caseInsensitive)//忽略大小写进行查找

str11.startIndex
str11.endIndex

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

let range = str13.range(of: str14)

if range != nil{
    print("包含")
    
}

//包含
str13.contains(str14)




//: [Next](@next)
