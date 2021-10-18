/**
 https://leetcode-cn.com/problems/Ju9Xwi/
 
 小扣打算给自己的 VS code 安装使用插件，初始状态下带宽每分钟可以完成 1 个插件的下载。假定每分钟选择以下两种策略之一:

 使用当前带宽下载插件
 将带宽加倍（下载插件数量随之加倍）
 请返回小扣完成下载 n 个插件最少需要多少分钟。

 注意：实际的下载的插件数量可以超过 n 个

 示例 1：

 输入：n = 2

 输出：2

 解释：
 以下两个方案，都能实现 2 分钟内下载 2 个插件

 方案一：第一分钟带宽加倍，带宽可每分钟下载 2 个插件；第二分钟下载 2 个插件
 方案二：第一分钟下载 1 个插件，第二分钟下载 1 个插件
 示例 2：

 输入：n = 4

 输出：3

 解释：
 最少需要 3 分钟可完成 4 个插件的下载，以下是其中一种方案:
 第一分钟带宽加倍，带宽可每分钟下载 2 个插件;
 第二分钟下载 2 个插件;
 第三分钟下载 2 个插件。

 提示：

 1 <= n <= 10^5


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/Ju9Xwi
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _LCS01_下载插件 {
//class Solution {
    public init() {}
    
    // MARK: - 数学/规律
    public func leastMinutes1(_ n: Int) -> Int {
        var speed = 1
        var res = 0
        // 如果不能一分钟下完
        while speed < n {
            // 就说明至少需要2分钟
            speed = speed << 1
            // 前一分钟加速后一分钟也能保证下完，如果还下不完重复这个动作
            res += 1
        }
        return res + 1   //最后一分钟下载
    }
    
    // MARK: - 动态规划
    public func leastMinutes(_ n: Int) -> Int {
        if n <= 3 { return n }
        
        var dp: [Int] = [Int].init(repeating: 0, count: n + 1)
        dp[1] = 1 /// 边界情况
        for i in 2...n {
            dp[i] = 1 + dp[(i + 1) / 2]
        }
        return dp[n]
    }
}

//let s = _LCS01_下载插件()
//let result = s.leastMinutes(1)
//print(result)
//
//assert(s.leastMinutes(1) == 1)
//assert(s.leastMinutes(2) == 2)
//assert(s.leastMinutes(3) == 3)
//assert(s.leastMinutes(4) == 3)
//assert(s.leastMinutes(5) == 4)
//assert(s.leastMinutes(6) == 4)
//assert(s.leastMinutes(7) == 4)
//assert(s.leastMinutes(8) == 4)
//assert(s.leastMinutes(9) == 5)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

