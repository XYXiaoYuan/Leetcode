/**
 https://leetcode-cn.com/problems/number-of-ways-to-paint-n-3-grid/
 
 你有一个 n x 3 的网格图 grid ，你需要用 红，黄，绿 三种颜色之一给每一个格子上色，且确保相邻格子颜色不同（也就是有相同水平边或者垂直边的格子颜色不同）。

 给你网格图的行数 n 。

 请你返回给 grid 涂色的方案数。由于答案可能会非常大，请你返回答案对 10^9 + 7 取余的结果。

  

 示例 1：

 输入：n = 1
 输出：12
 解释：总共有 12 种可行的方法：

 示例 2：

 输入：n = 2
 输出：54
 示例 3：

 输入：n = 3
 输出：246
 示例 4：

 输入：n = 7
 输出：106494
 示例 5：

 输入：n = 5000
 输出：30228214
  

 提示：

 n == grid.length
 grid[i].length == 3
 1 <= n <= 5000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-ways-to-paint-n-3-grid
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func numOfWays(_ n: Int) -> Int {
        var dp: [[[[Int]]]] = [[[[Int]]]].init(repeating: [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: 4), count: 4), count: 4), count: n + 1)

        var N = n
        var a0 = 0
        var b0 = 0
        var c0 = 0
        
        return dfs(&N, &a0, &b0, &c0, &dp)
    }
    
    private func dfs(_ n: inout Int, _ a0: inout Int, _ b0: inout Int, _ c0: inout Int, _ dp: inout [[[[Int]]]]) -> Int {
        
        if n == 0 {
            return 1
        }
        
        if dp[n][a0][b0][c0] != 0 {
            return dp[n][a0][b0][c0]
        }
        
        var ans = 0
        let colors: [Int] = [1, 2, 3]
        for var a in colors {
            if a == a0 {
                continue
            }
            for var b in colors {
                if b == b0 || b == a {
                    continue
                }
                for var c in colors {
                    if c == c0 || c == b {
                        continue
                    }
                    var tempN = n - 1
                    ans += dfs(&tempN, &a, &b, &c, &dp)
                    ans %= 1000_000_007
                }
            }
        }
        
        dp[n][a0][b0][c0] = ans
                
        return dp[n][a0][b0][c0]
    }
}

let s = Solution()
let result = s.numOfWays(1)
print(result)

assert(s.numOfWays(1) == 12)
assert(s.numOfWays(2) == 54)
assert(s.numOfWays(3) == 246)
assert(s.numOfWays(7) == 106494)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

