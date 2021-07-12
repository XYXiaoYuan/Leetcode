/**
 https://leetcode-cn.com/problems/volume-of-histogram-lcci/
 
 给定一个直方图(也称柱状图)，假设有人从上面源源不断地倒水，最后直方图能存多少水量?直方图的宽度为 1。



 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的直方图，在这种情况下，可以接 6 个单位的水（蓝色部分表示水）。 感谢 Marcos 贡献此图。

 示例:

 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/volume-of-histogram-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }
        
        let lastIdx = height.count - 2
        
        var dp = [Int].init(repeating: 0, count: height.count)
        for i in stride(from: lastIdx, through: 1, by: -1) {
            dp[i] = max(dp[i + 1], height[i + 1])
        }
        
        // 遍历每一根柱子,看看每一根柱子上能放多少水
        var water = 0
        var leftMax = 0
        for i in 1..<lastIdx {
            leftMax = max(leftMax, height[i - 1])
            
            // 求出左边最大,右边最大中的较小者
            let minValue = min(leftMax, dp[i])
            // 说明这根柱子不能放水
            if minValue <= height[i] {
                continue
            }
            
            // 说明这根柱子能放水
            water += minValue - height[i]
        }
        
        return water
    }
}

let s = Solution()
let result = s.trap([4,2,0,3,2,5])
print(result)

//assert(s.trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6)
//assert(s.trap([4,2,0,3,2,5]) == 9)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

