/**
 https://www.nowcoder.com/practice/a30bbc1a0aca4c27b86dd88868de4a4a?tpId=37&&tqId=21269&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一个字符串和一个整数k，截取字符串的前k个字符并输出
 本题输入含有多组数据
 输入描述：
 1.输入待截取的字符串

 2.输入一个正整数k，代表截取的长度

 输出描述：
 截取后的字符串

 示例1
 输入：
 abABCcDEF
 6
 复制
 输出：
 abABCc
 复制
 示例2
 输入：
 ffIKEHauv
 1
 bdxPKBhih
 6
 复制
 输出：
 f
 bdxPKB
 复制

 */

import Foundation
 
while let str = readLine() {
    let num = Int(readLine() ?? "")
    cutStr(str, num ?? 0)
}
 
func cutStr(_ input: String, _ leng: Int) {
    let array = input.map{$0}
    var target: [String] = []
    for i in 0..<leng {
        target.append(String(array[i]))
    }
     
    print(target.joined(separator: ""))
}
