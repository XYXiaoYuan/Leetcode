/**
 https://leetcode-cn.com/problems/ccw6C7
 
 小扣注意到秋日市集上有一个创作黑白方格画的摊位。摊主给每个顾客提供一个固定在墙上的白色画板，画板不能转动。画板上有 n * n 的网格。绘画规则为，小扣可以选择任意多行以及任意多列的格子涂成黑色（选择的整行、整列均需涂成黑色），所选行数、列数均可为 0。

 小扣希望最终的成品上需要有 k 个黑色格子，请返回小扣共有多少种涂色方案。

 注意：两个方案中任意一个相同位置的格子颜色不同，就视为不同的方案。

 示例 1：

 输入：n = 2, k = 2

 输出：4

 解释：一共有四种不同的方案：
 第一种方案：涂第一列；
 第二种方案：涂第二列；
 第三种方案：涂第一行；
 第四种方案：涂第二行。

 示例 2：

 输入：n = 2, k = 1

 输出：0

 解释：不可行，因为第一次涂色至少会涂两个黑格。

 示例 3：

 输入：n = 2, k = 4

 输出：1

 解释：共有 2*2=4 个格子，仅有一种涂色方案。

 限制：

 1 <= n <= 6
 0 <= k <= n * n


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ccw6C7
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    // MARK: - 计算组合公式递归版
    func paintingPlan(_ n: Int, _ k: Int) -> Int {
        for key in [0, n * n] where key == k {
            return 1
        }

        func getFitWays(_ n: Int, _ a: Int) -> Int {
            // 计算组合公式递归版
            func helper(_ n: Int) -> Int {
                if n <= 1 { return 1 }
                return n * helper(n - 1)
            }
            return helper(n) / (helper(a) * helper(n - a))
        }

        var ways: Int = 0
        for i in 0..<n {
            for j in 0..<n where n * (i + j) - (i * j) == k {
                ways += getFitWays(n, i) * getFitWays(n, j)
            }
        }

        return ways
    }
    
    // MARK: - 计算组合公式迭代版
    func paintingPlan1(_ n: Int, _ k: Int) -> Int {
        for key in [0, n * n] where key == k {
            return 1
        }

        func getFitWays(_ n: Int, _ a: Int) -> Int {
            // 计算组合公式迭代版
            var res = 1
            let delta = n - (n - a) > 1 ? -1 : 1
            for i in stride(from: n, through: n - a, by: delta) {
                res *= i
            }
            for j in 1..<(a + 1) {
                res /= j
            }
            return res
        }

        var ways: Int = 0
        for i in 0..<n {
            for j in 0..<n {
                if n * (i + j) - (i * j) == k {
                    ways += getFitWays(n, i) * getFitWays(n, j)
                }
            }
        }

        return ways
    }

}


let s = Solution()
//let result = s.paintingPlan(3, 8)
//print("🎉 result = \(result)")

let result1 = s.paintingPlan1(2, 2)
print("🎉 result = \(result1)")

assert(s.paintingPlan(2, 2) == 4)
assert(s.paintingPlan(2, 1) == 0)
assert(s.paintingPlan(2, 4) == 1)
assert(s.paintingPlan(3, 8) == 9)
assert(s.paintingPlan1(2, 2) == 4)
assert(s.paintingPlan1(2, 1) == 0)
assert(s.paintingPlan1(2, 4) == 1)
assert(s.paintingPlan1(3, 8) == 9)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

