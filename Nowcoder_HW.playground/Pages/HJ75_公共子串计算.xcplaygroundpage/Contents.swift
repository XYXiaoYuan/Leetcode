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

/// 动态规划一维数组优化 + leftTop优化
/// - Parameters:
///   - line1: line1
///   - line2: line2
/// - Returns: 最大公共子串的长度
func longestCommonLCSCount2(_ line1: String, _ line2: String) -> Int {
    if line1.isEmpty || line2.isEmpty {
        return 0
    }
    let chars1: [String] = line1.map { "\($0)" }
    let chars2: [String] = line2.map { "\($0)" }
    
    var rowsStr = chars1
    var colsStr = chars2
    if chars1.count < chars2.count {
        colsStr = chars1
        rowsStr = chars2
    }

    var dp: [Int] = [Int].init(repeating: 0, count: colsStr.count + 1)
    var maxValue: Int = 0;
    
    for i in 1...rowsStr.count {
        for j in stride(from: colsStr.count, through: 1, by: -1) {
            if rowsStr[i - 1] == colsStr[j - 1] {
                dp[j] = dp[j - 1] + 1
                maxValue = max(maxValue, dp[j])
            } else {
                dp[j] = 0
            }
        }
    }
        
    return maxValue
}

/// 动态规划一维数组优化
/// - Parameters:
///   - line1: line1
///   - line2: line2
/// - Returns: 最大公共子串的长度
func longestCommonLCSCount(_ line1: String, _ line2: String) -> Int {
    if line1.isEmpty || line2.isEmpty {
        return 0
    }
    let chars1: [String] = line1.map { "\($0)" }
    let chars2: [String] = line2.map { "\($0)" }
    
    var rowsStr = chars1
    var colsStr = chars2
    if chars1.count < chars2.count {
        colsStr = chars1
        rowsStr = chars2
    }

    var dp: [Int] = [Int].init(repeating: 0, count: colsStr.count + 1)
    var maxValue: Int = 0;
    
    for i in 1...rowsStr.count {
        var cur = 0
        for j in 1...colsStr.count {
            let leftTop = cur
            cur = dp[j]
            if rowsStr[i - 1] == colsStr[j - 1] {
                dp[j] = leftTop + 1
            } else {
                dp[j] = 0
            }
            maxValue = max(maxValue, dp[j])
        }
    }
        
    return maxValue
}
 
/// 动态规划二维数组实现
/// - Parameters:
///   - line1: line1
///   - line2: line2
/// - Returns: 最大公共子串的长度
func longestCommonLCSCount1(_ line1: String, _ line2: String) -> Int {
    if line1.isEmpty || line2.isEmpty {
        return 0
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
    
    return maxValue
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str1 = "asdfas"
    let str2 = "werasdfaswer"
    let result = longestCommonLCSCount(str1, str2)
    print(result)
} else {
    while let line1 = readLine(), let line2 = readLine() {
        let result = longestCommonLCSCount(line1, line2)
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

public extension Array {
    subscript(safe index: Int) -> Element? {
        if indices ~= index { return self[index] }
        print("当前index = \(index),而数组的个数 = \(self.count)")
        return .none
    }
}

assert(longestCommonLCSCount("asdfas", "werasdfaswer") == 6)
