/**
 https://leetcode-cn.com/problems/number-of-digit-one/
 
 给定一个整数 n，计算所有小于等于 n 的非负整数中数字 1 出现的个数。

  

 示例 1：

 输入：n = 13
 输出：6
 示例 2：

 输入：n = 0
 输出：0
  

 提示：

 0 <= n <= 2 * 109


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-digit-one
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func countDigitOne(_ n: Int) -> Int {
        var count: Int = 0
        
        var cur = 1
        while cur <= n {
            let div = cur * 10
            count += (n / div) * cur + min(max(n % div - cur + 1, 0), cur)
            cur *= 10
        }
        
        return count
    }
}


let s = Solution()
let result = s.countDigitOne(13)
print(result)

assert(s.countDigitOne(13) == 6)
assert(s.countDigitOne(0) == 0)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

