/**
 https://www.nowcoder.com/practice/e0480b2c6aa24bfba0935ffcca3ccb7b?tpId=37&&tqId=21305&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 分子为1的分数称为埃及分数。现输入一个真分数(分子比分母小的分数，叫做真分数)，请将该分数分解为埃及分数。如：8/11 = 1/2+1/5+1/55+1/110。
 注：真分数指分子小于分母的分数，分子和分母有可能gcd不为1！
 如有多个解，请输出任意一个。
 请注意本题含有多组样例输入！


 输入描述：
 输入一个真分数，String型

 输出描述：
 输出分解后的string

 示例1
 输入：
 8/11
 2/4
 复制
 输出：
 1/2+1/5+1/55+1/110
 1/3+1/6
 复制
 说明：
 第二个样例直接输出1/2也是可以的
 */

import Foundation

func scoresOfEgypt(_ str: String) -> String {
    let nums = str.split(separator: "/")
    guard var a = Int(nums[0]), var b = Int(nums[1]) else { return "" }
        
    var res: String = ""
    while true {
        let c = b / a + 1
        res += "1/\(c)"
        a = a - b % a
        b = b * c
        res += "+"
        
        if a == 1 {
            res += "1/\(b)"
            break
        } else if (a > 1 && b % a == 0) {
            res += "1/\(b / a)"
            break
        }
    }
    
    return res
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str = "8/11"
    let result = scoresOfEgypt(str)
    print(result)
} else {
    while let str = readLine() {
        let result = scoresOfEgypt(str)
        print(result)
    }
}
