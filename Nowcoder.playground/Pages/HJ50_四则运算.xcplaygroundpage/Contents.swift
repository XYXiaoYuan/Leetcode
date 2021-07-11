/**
 https://www.nowcoder.com/practice/9999764a61484d819056f807d2a91f1e?tpId=37&&tqId=21273&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一个表达式（用字符串表示），求这个表达式的值。
 保证字符串中的有效字符包括[‘0’-‘9’],‘+’,‘-’, ‘*’,‘/’ ,‘(’， ‘)’,‘[’, ‘]’,‘{’ ,‘}’。且表达式一定合法。



 输入描述：
 输入一个算术表达式

 输出描述：
 得到计算结果

 示例1
 输入：
 3+2*{1+2*[-4/(8-6)+7]}
 复制
 输出：
 25
 复制
 */

import Foundation


func arithmetic(_ input: String) -> Int {
    return 0
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let input = "3+2*{1+2*[-4/(8-6)+7]}"
    let result = arithmetic(input)
    print(result)
} else {
    while let input = readLine() {
        let result = arithmetic(input)
        print(result)
    }
}

/// 全局打印,发布时不触发, isDebug == false时不打印
public func dprint<T>(_ msg: T,
                      line: Int = #line) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}

assert(arithmetic("3+2*{1+2*[-4/(8-6)+7]}") == 25)
