/**
 https://leetcode-cn.com/problems/maximal-square/
 
 在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。

  

 示例 1：


 输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 输出：4
 示例 2：


 输入：matrix = [["0","1"],["1","0"]]
 输出：1
 示例 3：

 输入：matrix = [["0"]]
 输出：0
  

 提示：

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 300
 matrix[i][j] 为 '0' 或 '1'


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximal-square
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        
        var maxrun = 0
        
        // tracking matrix with length and width one larger
        // we sum runs at matrix[x][y] in runs[x+1][y+1]
        var dp = [[Int]](repeating:([Int](repeating: 0, count: matrix[0].count + 1)), count: matrix.count + 1)
        
        // walk the matrix incrementing ahead as we walk
        for x in 0..<matrix.count {
            for y in 0..<matrix[0].count {
                // zero value runs reset the base to zero
                if matrix[x][y] == "1" {
                    // ensure a zero resets the run, looking back to capture the prior run info
                    // we look back 1 row and column to ensure we are still building a square
                    let run = min(dp[x][y], dp[x + 1][y], dp[x][y + 1])
                    // save the current run + 1 for the current '1' value
                    dp[x + 1][y + 1] = run + 1
                    // do we have a new max run
                    maxrun = max(dp[x + 1][y + 1], maxrun)
                }
            }
        }
        
        // area is square of max run
        return maxrun * maxrun
    }
}
