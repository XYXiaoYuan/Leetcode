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
    if x == 0 || y == 0 {
        return 1
    }
    return moveGridWays(x - 1, y) + moveGridWays(x, y - 1)
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let x = 2
    let y = 2
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

//: [Next](@next)
