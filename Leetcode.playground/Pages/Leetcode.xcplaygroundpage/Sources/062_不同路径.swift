/**
 https://leetcode-cn.com/problems/unique-paths/
 
 
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

 问总共有多少条不同的路径？

  

 示例 1：


 输入：m = 3, n = 7
 输出：28
 示例 2：

 输入：m = 3, n = 2
 输出：3
 解释：
 从左上角开始，总共有 3 条路径可以到达右下角。
 1. 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右
 3. 向下 -> 向右 -> 向下
 示例 3：

 输入：m = 7, n = 3
 输出：28
 示例 4：

 输入：m = 3, n = 3
 输出：6


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-paths
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _062_不同路径 {
//class Solution {
    public init() {}
    
    public func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp: [[Int]] = Array.init(repeating: [Int].init(repeating: 0, count: n), count: m)
        
        dp[0][0] = 1
        /// 初始化 dp[x][0] = 1
        for i in 0..<m {
            dp[i][0] = 1
        }
        /// 初始化 dp[0][y] = 1
        for j in 0..<n {
            dp[0][j] = 1
        }
        
        print(dp)
        
        for i in 1..<m {
            for j in 1..<n {
                if i == 0 || j == 0 {
                    dp[i][j] = 0
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }

        }
        
        return dp[m - 1][n - 1]
    }
}


//let s = _062_不同路径()
//let result = s.uniquePaths(3, 7)
//print(result)
//
//assert(s.uniquePaths(3, 2) == 3)
//assert(s.uniquePaths(7, 3) == 28)
//assert(s.uniquePaths(3, 3) == 6)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

