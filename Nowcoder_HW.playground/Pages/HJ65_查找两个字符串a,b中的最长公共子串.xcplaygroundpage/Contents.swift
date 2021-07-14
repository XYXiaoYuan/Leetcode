/**
 https://www.nowcoder.com/practice/181a1a71c7574266ad07f9739f791506?tpId=37&&tqId=21288&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 查找两个字符串a,b中的最长公共子串。若有多个，输出在较短串中最先出现的那个。
 注：子串的定义：将一个字符串删去前缀和后缀（也可以不删）形成的字符串。请和“子序列”的概念分开！

 本题含有多组输入数据！
 输入描述：
 输入两个字符串

 输出描述：
 返回重复出现的字符
 示例1
 输入：
 abcdefghijklmnop
 abcsafjklmnopqrstuvw

 输出：
 jklmnop
 
 */

import Foundation

/// 动态规划一维数组优化
/// - Parameters:
///   - A: line1
///   - B: line2
/// - Returns: 最大公共子串的字符串
func longestCommonLCS(_ str1: String, _ str2: String) -> String {
    var A = str1.map { "\($0)" }
    var B = str2.map { "\($0)" }
    
    if A.isEmpty || B.isEmpty {
        return ""
    }
    var m = A.count
    var n = B.count
    // A换成较短的
    if m > n {
        swap(&A, &B)
        swap(&m, &n)
    }
    var f = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
    var maxLength = 0
    var start = 0
    for i in 1...m {
        for j in 1...n {
            if A[i - 1] == B[j - 1] {
                f[i][j] = f[i - 1][j - 1] + 1
                if f[i][j] > maxLength {
                    maxLength = f[i][j]
                    start = i - maxLength
                }
            }
        }
    }
    
    var res: String = ""
    for i in start..<(start + maxLength) {
        res.append(A[i])
    }
    return res
}

/// 动态规划二维数组实现
/// - Parameters:
///   - line1: line1
///   - line2: line2
/// - Returns: 最大公共子串的字符串
func longestCommonLCS1(_ line1: String, _ line2: String) -> String {
    if line1.isEmpty || line2.isEmpty {
        return ""
    }
    let str1: [String] = line1.map { "\($0)" }
    let str2: [String] = line2.map { "\($0)" }
    
    var dp: [[Int]] = Array.init(repeating: [Int].init(repeating: 0, count: str2.count + 1), count: str1.count + 1)
    
    var maxValue: Int = 0;
    for i in 1...str1.count {
        for j in 1...str2.count {
            if str1[i - 1] == str2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
                maxValue = max(maxValue, dp[i][j])
            }
        }
    }
    
    return ""
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str1 = "abcdefghijklmnop"
    let str2 = "abcsafjklmnopqrstuvw"
    let result = longestCommonLCS(str1,  str2)
    print(result)
} else {
    while let line1 = readLine(), let line2 = readLine() {
        let result = longestCommonLCS(line1, line2)
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

//assert(maxCommonLCS("abcdefghijklmnop", "abcsafjklmnopqrstuvw") == "jklmnop")
