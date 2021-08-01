/**
 https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
 
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

  

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 2：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var visited = [[Bool]].init(repeating: [Bool].init(repeating: false, count: n), count: m)
        return dfs(&visited, m, n, k, 0, 0)
    }
   
    private func dfs(_ visited: inout [[Bool]], _ m: Int, _ n: Int, _ k: Int, _ i: Int, _ j: Int) -> Int {
        if i >= m || j >= n || visited[i][j] || bitSum(i) + bitSum(j) > k {
            return 0
        }
        visited[i][j] = true
        return 1 + dfs(&visited, m, n, k, i + 1, j) + dfs(&visited, m, n, k, i, j + 1)
    }
    
    private func bitSum(_ n: Int) -> Int {
        var n = n
        var sum = 0
        while n > 0 {
            sum += n % 10
            n /= 10
        }
        return sum
    }
}


let s = Solution()
let result = s.movingCount(2, 3, 1)
print(result)

assert(s.movingCount(2, 3, 1) == 3)
assert(s.movingCount(3, 1, 0) == 1)
assert(s.movingCount(3, 2, 17) == 6)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

