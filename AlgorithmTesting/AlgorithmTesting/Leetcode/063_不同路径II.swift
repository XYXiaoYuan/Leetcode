/**
 https://leetcode-cn.com/problems/unique-paths-ii/
 
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？



 网格中的障碍物和空位置分别用 1 和 0 来表示。

  

 示例 1：


 输入：obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
 输出：2
 解释：
 3x3 网格的正中间有一个障碍物。
 从左上角到右下角一共有 2 条不同的路径：
 1. 向右 -> 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右 -> 向右
 示例 2：


 输入：obstacleGrid = [[0,1],[0,0]]
 输出：1
  

 提示：

 m == obstacleGrid.length
 n == obstacleGrid[i].length
 1 <= m, n <= 100
 obstacleGrid[i][j] 为 0 或 1


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-paths-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _063_不同路径II {
//class Solution {
    public init() {}

    public func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp: [[Int]] = Array.init(repeating: [Int].init(repeating: 0, count: n), count: m)
        
        /// 初始化 dp[x][0] = 1
        for i in 0..<m {
            if obstacleGrid[i][0] != 1 {
                dp[i][0] = 1
            } else {
                break
            }
        }
        /// 初始化 dp[0][y] = 1
        for j in 0..<n {
            if obstacleGrid[0][j] != 1 {
                dp[0][j] = 1
            } else {
                break
            }
        }
                        
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] != 1 {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
                
        return dp[m - 1][n - 1]
    }
}


//let s = _063_不同路径II()
//let input1 = [
//    [0,0,0],
//    [0,1,0],
//    [0,0,0]
//]
//let input2 = [
//    [1]
//]
//let input3 = [
//    [1,0]
//]
//let input4 = [
//    [0,1],
//    [0,0]
//]
//let input5 = [
//    [0,0],
//    [1,1],
//    [0,0]
//]
//let input6 = [
//    [0,1,0,0,0],
//    [1,0,0,0,0],
//    [0,0,0,0,0],
//    [0,0,0,0,0]
//]
//let input7 = [
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [1,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [1,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,1],
//    [0,0],
//    [0,0],
//    [1,0],
//    [0,0],
//    [0,0],
//    [0,1],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,1],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [1,0],
//    [0,0],
//    [0,0],
//    [0,0],
//    [0,0]
//]
//let result = s.uniquePathsWithObstacles(input5)
//print(result)
//
//assert(s.uniquePathsWithObstacles(input1) == 2)
//assert(s.uniquePathsWithObstacles(input2) == 0)
//assert(s.uniquePathsWithObstacles(input3) == 0)
//assert(s.uniquePathsWithObstacles(input4) == 1)
//assert(s.uniquePathsWithObstacles(input5) == 0)
//assert(s.uniquePathsWithObstacles(input6) == 0)
//assert(s.uniquePathsWithObstacles(input7) == 0)
