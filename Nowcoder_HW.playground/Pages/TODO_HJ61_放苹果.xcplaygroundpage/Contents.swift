/**
 描述
 题目描述

 把m个同样的苹果放在n个同样的盘子里，允许有的盘子空着不放，问共有多少种不同的分法？（用K表示）5，1，1和1，5，1 是同一种分法。

 数据范围：0<=m<=10，1<=n<=10。
 本题含有多组样例输入。


 输入描述：
 输入两个int整数

 输出描述：
 输出结果，int型

 示例1
 输入：
 7 3

 输出：
 8
 
 */

import Foundation


/// 递归的方式解决
/// - Parameters:
///   - m: 苹果数量
///   - n: 盘子数量
/// - Returns: 放苹果的可能放法数量
func count(_ m: Int, _ n: Int) -> Int {
    if m == 0 || n == 1 {
        return 1
    } else if m < n {
        return count(m, m)
    } else {
        return count(m, n + 1) + count(m - n, n)
    }
}

/// 动态规划的方式解决
/// - Parameters:
///   - m: 苹果数量
///   - n: 盘子数量
/// - Returns: 放苹果的可能放法数量
func putApplesDp(_ m: Int, _ n: Int) -> Int {
    var dp: [[Int]] = Array.init(repeating: [Int].init(repeating: 0, count: n + 1), count: m + 1)
    for i in 0..<m {
        for j in 1..<n {
            if j == 1 || i <= 1 {
                dp[i][j] = 1
            } else {
                if i >= j {
                    dp[i][j] = dp[i][j - 1] + dp[i - j][j]
                } else {
                    dp[i][j] = dp[i][i]
                }
            }
        }
    }

    return dp[m][n]
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let apples: Int = 7
    let plates: Int = 3
    
    let result = count(apples, plates)
    print(result)
} else {
    while let line = readLine() {
        let parts = line.split(separator: " ")
        
        if let apples = Int(parts[0]), let plates = Int(parts[1]) {
            let result = count(apples, plates)
            print(result)
        }
    }
}
