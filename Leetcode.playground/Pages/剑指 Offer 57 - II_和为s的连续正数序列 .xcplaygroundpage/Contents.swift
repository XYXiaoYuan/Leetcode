/**
 https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof/
 
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

  

 示例 1：

 输入：target = 9
 输出：[[2,3,4],[4,5]]
 示例 2：

 输入：target = 15
 输出：[[1,2,3,4,5],[4,5,6],[7,8]]
  

 限制：

 1 <= target <= 10^5


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        var result = [[Int]]()
        
        var target = target
        target *= 2
        
        for i in stride(from: target / 2 - 1, through: 2, by: -1) {
            let s = target / i
            
            // 1.两两之和 s = target*2/i 为整数，也就是说 i 能被 target*2整除
            // 2.通过 i 计算出的 start 和 end 也都是整数 ，根据上面的计算公式 start = (s-i+1)/2，end = (s+i-1)/2，等价于 i 和 s 的奇偶性不同。
            // 3.start 必须是大于 0 的数
            // 三个判断分别对应了上面的三个条件
            if target % i == 0, (i + s) % 2 == 1, s - i > 0 {
                var temp = [Int]()
                let start = (s - i + 1) / 2
                let end = (s + i - 1) / 2
                for j in start...end {
                    temp.append(j)
                }
                result.append(temp)
            }
        }

        return result
    }
}


let s = Solution()
let result = s.findContinuousSequence(10)
print(result)

assert(s.findContinuousSequence(9) == [[2,3,4],[4,5]])
assert(s.findContinuousSequence(15) == [[1,2,3,4,5],[4,5,6],[7,8]])

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}
