/**
 https://www.nowcoder.com/practice/2c81f88ecd5a4cc395b5308a99afbbec?tpId=37&&tqId=21315&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一个字符串，返回其最长的数字子串，以及其长度。若有多个最长的数字子串，则将它们全部输出（按原字符串的相对位置）
 本题含有多组样例输入。

 输入描述：
 输入一个字符串。

 输出描述：
 输出字符串中最长的数字字符串和它的长度，中间用逗号间隔。如果有相同长度的串，则要一块儿输出（中间不要输出空格）。

 示例1
 输入：
 abcd12345ed125ss123058789
 a8a72a6a5yy98y65ee1r2

 输出：
 123058789,9
 729865,2

 */

import Foundation

func lcsDigital(_ str: String) -> String {
    let n = str.count
    var dp: [Int] = [Int].init(repeating: 0, count: n + 1)
    var res: [String] = [String]()
    
    var isDigital: Bool = false
    var tempDigitalCount: Int = 0
    
    var temp: String = ""
    for (i, char) in str.enumerated() {
        switch char {
        case "0"..."9":
            tempDigitalCount += 1
            dprint("下标 i = \(i) 当前char = \(char) temp = \(temp) --- tempDigitalCount = \(tempDigitalCount) dp[\(i)] = \(dp[i])")
            if isDigital {
                isDigital = false
            } else {
                temp.append(char)
                if tempDigitalCount > dp[i] {
                    dp[i] = max(dp[i] + 1, dp[i])
                }
            }
            
            if i == str.count - 1, !temp.isEmpty {
                res.append(temp)
            }
        default:
            tempDigitalCount = 0
            isDigital = false
            if !temp.isEmpty {
                res.append(temp)
            }
            temp = ""
        }
        
        
        
        dp[i + 1] = dp[i]
    }
    
    let fitRes = res.filter { $0.count == dp[n] }.joined(separator: "")
        
    return fitRes + "," + "\(dp[n])"
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str = "a8a72a6a5yy98y65ee1r2"
    let result = lcsDigital(str)
    print(result)
} else {
    while let line = readLine() {
        let result = lcsDigital(line)
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

//assert(lcsDigital("abcd12345ed125ss123058789") == "123058789,9")
//assert(lcsDigital("a8a72a6a5yy98y65ee1r2") == "729865,2")
