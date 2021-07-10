/**
 https://www.nowcoder.com/practice/8c949ea5f36f422594b306a2300315da?tpId=37&&tqId=21224&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 计算字符串最后一个单词的长度，单词以空格隔开，字符串长度小于5000。

 输入描述：
 输入一行，代表要计算的字符串，非空，长度小于5000。

 输出描述：
 输出一个整数，表示输入字符串最后一个单词的长度。

 示例1
 输入：
 hello nowcoder
 复制
 输出：
 8
 复制
 说明：
 最后一个单词为nowcoder，长度为8

 */

import Foundation
 
while let line = readLine() {
    let string = line
    
    var rearchSpaceIndex: Int = 0
    var hasSpace: Bool = false
    for i in stride(from: string.count - 1, to: 0, by: -1) {
        let tmp: Character = string[string.index(string.startIndex, offsetBy: i)]
        if tmp == " " {
            rearchSpaceIndex = i
            hasSpace = true
            break;
        }
    }
        
    let count: Int = string.count - rearchSpaceIndex
    let finalCount = hasSpace == true ? (count - 1) : count
    
    print(finalCount)
}
