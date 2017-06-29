
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
// 打印结果为:abcdef
// 从此可以看出Swift中的字符串和C语言/OC语言中的字符串是不一样的



//: [Next](@next)
