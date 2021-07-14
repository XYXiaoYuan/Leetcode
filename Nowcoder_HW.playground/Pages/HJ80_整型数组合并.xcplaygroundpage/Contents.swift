/**
 https://www.nowcoder.com/practice/c4f11ea2c886429faf91decfaf6a310b?tpId=37&&tqId=21303&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 题目标题：

 将两个整型数组按照升序合并，并且过滤掉重复数组元素。
 输出时相邻两数之间没有空格。
 请注意本题有多组样例。



 输入描述：
 输入说明，按下列顺序输入：
 1 输入第一个数组的个数
 2 输入第一个数组的数值
 3 输入第二个数组的个数
 4 输入第二个数组的数值

 输出描述：
 输出合并之后的数组

 示例1
 输入：
 3
 1 2 5
 4
 -1 0 3 2

 输出：
 -101235


 
 */

import Foundation

func combineTwoArray(_ str1: String, _ str2: String) -> String {
    var numbers1: [Int] = [Int]()
    var numbers2: [Int] = [Int]()
    for s in str1.split(separator: " ") {
        if let val = Int(String(s)) {
            numbers1.append(val)
        }
    }
    for s in str2.split(separator: " ") {
        if let val = Int(String(s)) {
            numbers2.append(val)
        }
    }
    
    let numbers = numbers1 + numbers2
    
    var set: Set<Int> = Set<Int>()
    for num in numbers {
        set.insert(num)
    }
    
    print(set)
    
    let result = set.sorted()
    
    return result.map { "\($0)" }.joined(separator: "")
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let numbers1 = "1 2 5"
    let numbers2 = "-1 0 3 2"
    let result = combineTwoArray(numbers1, numbers2)
    print(result)
} else {
    while let line1 = readLine(), let line2 = readLine(),
          let line3 = readLine(), let line4 = readLine() {
        let result = combineTwoArray(line2, line4)
        print(result)
    }
}
