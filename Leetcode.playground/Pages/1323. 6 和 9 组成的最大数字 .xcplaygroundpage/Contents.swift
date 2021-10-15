/**
 https://leetcode-cn.com/problems/maximum-69-number/
 
 给你一个仅由数字 6 和 9 组成的正整数 num。

 你最多只能翻转一位数字，将 6 变成 9，或者把 9 变成 6 。

 请返回你可以得到的最大数字。

  

 示例 1：

 输入：num = 9669
 输出：9969
 解释：
 改变第一位数字可以得到 6669 。
 改变第二位数字可以得到 9969 。
 改变第三位数字可以得到 9699 。
 改变第四位数字可以得到 9666 。
 其中最大的数字是 9969 。
 示例 2：

 输入：num = 9996
 输出：9999
 解释：将最后一位从 6 变到 9，其结果 9999 是最大的数。
 示例 3：

 输入：num = 9999
 输出：9999
 解释：无需改变就已经是最大的数字了。
  

 提示：

 1 <= num <= 10^4
 num 每一位上的数字都是 6 或者 9 。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-69-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var nums = Array(String(num))
        for (index, num) in nums.enumerated() where num == "6" {
            nums[index] = "9"
            break
        }
        return Int(String(nums)) ?? 0
    }
}

let s = Solution()
let result = s.maximum69Number(9669)
print(result)

assert(s.maximum69Number(9669) == 9969)
assert(s.maximum69Number(9996) == 9999)
assert(s.maximum69Number(9999) == 9999)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

