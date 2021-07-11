/**
 https://leetcode-cn.com/problems/minimum-path-sum/
 
 给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

 说明：每次只能向下或者向右移动一步。

  

 示例 1：


 输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
 输出：7
 解释：因为路径 1→3→1→1→1 的总和最小。
 示例 2：

 输入：grid = [[1,2,3],[4,5,6]]
 输出：12


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
                
        var dp = Array.init(repeating: [Int].init(repeating: 0, count: cols + 1), count: rows + 1)
        dp[0][0] = grid[0][0]

        // 第0行
        for col in 1..<cols {
            dp[0][col] = dp[0][col - 1] + grid[0][col]
        }

        // 第0列
        for row in 1..<rows {
            dp[row][0] = dp[row - 1][0] + grid[row][0]
        }
        
        for row in 1..<rows {
            for col in 1..<cols {
                dp[row][col] = min(dp[row - 1][col], dp[row][col - 1]) + grid[row][col]
            }
        }

        return dp[rows - 1][cols - 1]
    }
}

let s = Solution()
let input1 = [
    [1,3,1],
    [1,5,1],
    [4,2,1]
]
let input2 = [
    [1,2,3],
    [4,5,6]
]
let result = s.minPathSum(input1)
print(result)

assert(s.minPathSum(input1) == 7)
assert(s.minPathSum(input2) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

