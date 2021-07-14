/**
 https://www.nowcoder.com/practice/6abde6ffcc354ea1a8333836bd6876b8?tpId=37&&tqId=21320&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 首先输入要输入的整数个数n，然后输入n个整数。输出为n个整数中负数的个数，和所有正整数的平均值，结果保留一位小数。
 本题有多组输入用例。
 输入描述：
 首先输入一个正整数n，
 然后输入n个整数。

 输出描述：
 输出负数的个数，和所有正整数的平均值。

 示例1
 输入：
 5
 1 2 3 4 5
 复制
 输出：
 0 3.0
 复制
 */

import Foundation

while let line = readLine() {
    
    let numerCount: Int = Int(line)!
    let str = readLine()!
    let a: [Substring] = str.split(separator: Character(" "))
    var array: [Int] = [Int]()
    for i in 0..<numerCount {
        array.append(Int(a[i])!)
    }
    
    var negativeCount = 0
    var postiveCount = 0
    var sum = 0
    for element in array {
        if element < 0 {
            negativeCount += 1
        }
        
        if element > 0 {
            sum += element
            postiveCount += 1
        }
    }
        
    let avarage = String(format: "%.1f", Double(sum) / Double(postiveCount))
    print("\(negativeCount) " + avarage)
}
