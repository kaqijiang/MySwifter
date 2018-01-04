
//: # page9 String
//: 侯伟杰 --: SwiftPlayground--https://github.com/kaqijiang
//: [previous](@previous)


import Foundation

var str = "Hello, Set"

//合集跟数组类似 但是并不是数组 将同一类型且不重复的值无序地储存在一个集合当中。当元素的顺序不那么重要的时候你就可以使用合集来代替数组，或者你需要确保元素不会重复的时候。

/*
 当您需要有效地测试成员身份时，使用集合而不是数组，或者您不关心集合中元素的顺序，或者需要确保每个元素只在集合中出现一次。
 
 您可以使用符合Hashable协议的任何元素类型创建一个集合。默认情况下，标准库中的大多数类型都是可散列的，包括字符串，数字和布尔类型，枚举情况没有关联值，甚至自己设置。
 
 Swift使得创建一个新的集合以创建一个新的数组变得容易。只需将数组文字分配给指定Set类型的变量或常量即可。
 
 */
//唯一 无序

let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]

let ingredientsCopy: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
let ingredientsCopy1: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

if ingredients == ingredientsCopy {
    print("equal")
}

//使用该方法来测试一个集合是否包含另一个集合或序列的所有元素。isSubset(of:)
if ingredientsCopy1.isSubset(of: ingredients) {
    print("equal")
}

//使用该方法来测试集合中的所有元素是否包含在另一个集合或序列中。isSuperset(of:)
if ingredients.isSubset(of: ingredientsCopy1) {
    print("equal")
}



//使用和方法来测试一个集合是否是另一个集合的子集或超集，但不等于另一个集。isStrictSubset(of:)isStrictSuperset(of:)
if ingredients.isStrictSubset(of: ingredientsCopy1) {
    print("equal")
}

//使用该方法来测试一个集合是否与另一个集合有任何共同的元素。isDisjoint(with:)
if ingredients.isDisjoint(with: ingredientsCopy1){
    print("equal")
}

//https://developer.apple.com/documentation/swift/set

//: [Next](@next)
