/**
 https://leetcode-cn.com/problems/number-of-provinces/
 
 有 n 个城市，其中一些彼此相连，另一些没有相连。如果城市 a 与城市 b 直接相连，且城市 b 与城市 c 直接相连，那么城市 a 与城市 c 间接相连。

 省份 是一组直接或间接相连的城市，组内不含其他没有相连的城市。

 给你一个 n x n 的矩阵 isConnected ，其中 isConnected[i][j] = 1 表示第 i 个城市和第 j 个城市直接相连，而 isConnected[i][j] = 0 表示二者不直接相连。

 返回矩阵中 省份 的数量。

  

 示例 1：


 输入：isConnected = [[1,1,0],[1,1,0],[0,0,1]]
 输出：2
 示例 2：


 输入：isConnected = [[1,0,0],[0,1,0],[0,0,1]]
 输出：3
  



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-provinces
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
  */

public class _547_省份数量 {
//class Solution {
    public init() {}
    
    private var visited: [Bool] = []
    
    public func findCircleNum(_ M: [[Int]]) -> Int {
        
        guard M.count > 0, M[0].count > 0 else { return 0 }
        self.visited = Array(repeating: false, count: M.count)
        
        var count = 0
        
        for i in 0..<M.count {
            if !visited[i] {
                dfs(i, M, &visited)
                count += 1
            }
        }
        
        return count
    }
    
    private func dfs(_ i: Int, _ M: [[Int]], _ visited: inout [Bool]) {
        for j in 0..<M.count {
            if M[i][j] == 1, visited[j] == false {
                visited[j] = true
                dfs(j, M, &visited)
            }
        }
    }
}
