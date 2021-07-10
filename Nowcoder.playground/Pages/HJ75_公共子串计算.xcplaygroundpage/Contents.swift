/**
 https://www.nowcoder.com/practice/98dc82c094e043ccb7e0570e5342dd1b?tpId=37&&tqId=21298&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 给定两个只包含小写字母的字符串，计算两个字符串的最大公共子串的长度。

 注：子串的定义指一个字符串删掉其部分前缀和后缀（也可以不删）后形成的字符串。

 输入描述：
 输入两个只包含小写字母的字符串

 输出描述：
 输出一个整数，代表最大公共子串的长度

 示例1
 输入：
 asdfas
 werasdfaswer
 
 输出：
 6
 
 */

import Foundation

func lcsMaxSequences(_ str1: String, _ str2: String) -> Int {
    return 0
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str1 = "asdfas"
    let str2 = "werasdfaswer"
    let result = lcsMaxSequences(str1, str2)
    print(result)
} else {
    while let line1 = readLine(), let line2 = readLine() {
        let result = lcsMaxSequences(line1, line2)
        print(result)
    }
}

/// 全局打印,发布时不触发
///
/// - Parameters:
///   - msg: 需要打印的信息
///   - file: 所在的 "swift文件"
///   - line: 打印操作发生在哪一行
///   - fn: 所在文件的"方法名"
public func dprint<T>(_ msg: T,
                      file: NSString = #file,
                      line: Int = #line,
                      fn: String = #function) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}

assert(lcsMaxSequences("asdfas", "werasdfaswer") == 6)
