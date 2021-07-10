/**
 https://www.nowcoder.com/practice/e2a22f0305eb4f2f9846e7d644dba09b?tpId=37&&tqId=21314&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 请计算n*m的棋盘格子（n为横向的格子数，m为竖向的格子数）沿着各自边缘线从左上角走到右下角，总共有多少种走法，要求不能走回头路，即：只能往右和往下走，不能往左和往上走。

 本题含有多组样例输入。
 输入描述：
 每组样例输入两个正整数n和m，用空格隔开。(1≤n,m≤8)

 输出描述：
 每组样例输出一行结果

 示例1
 输入：
 2 2
 1 2

 输出：
 6
 3

 */

import Foundation

func moveGridWays(_ x: Int, _ y: Int) -> Int {
    var dp: [[Int]] = Array.init(repeating: [Int].init(repeating: 0, count: y + 1), count: x + 1)
    
    dp[0][0] = 1
    /// 初始化 dp[x][0] = 1
    for i in 0...x {
        dp[i][0] = 1
    }
    /// 初始化 dp[0][y] = 1
    for j in 0...y {
        dp[0][j] = 1
    }
        
    for i in 1...x {
        for j in 1...y {
            if i == 0 || j == 0 {
                dp[i][j] = 0
            } else {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
            dprint("i = \(i) --- j = \(j) 👑 dp[\(i)][\(j)] = \(dp[i][j])")
        }
        
    }
            
    return dp[x][y]
}

func moveGridWaysRecursive(_ x: Int, _ y: Int) -> Int {
    if x == 0 || y == 0 {
        return 1
    }
    return moveGridWaysRecursive(x - 1, y) + moveGridWaysRecursive(x, y - 1)
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let x = 8
    let y = 8
    let result = moveGridWays(x, y)
    print(result)
} else {
    while let line = readLine() {
        let parts = line.split(separator: " ")
        if let x = Int(parts[0]), let y = Int(parts[1]) {
            let result = moveGridWays(x, y)
            print(result)
        }
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

//assert(moveGridWays(2, 2) == 6)
//assert(moveGridWays(1, 2) == 3)
