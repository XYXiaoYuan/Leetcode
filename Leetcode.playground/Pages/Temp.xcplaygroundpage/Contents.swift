/**
 https://leetcode-cn.com/problems/missing-ranges/
 
 给定一个排序的整数数组 nums ，其中元素的范围在 闭区间 [lower, upper] 当中，返回不包含在数组中的缺失区间。

 示例：

 输入: nums = [0, 1, 3, 50, 75], lower = 0 和 upper = 99,
 输出: ["2", "4->49", "51->74", "76->99"]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/missing-ranges
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

public class _660_移除9 {
    public init() {}
    
    public func newInteger1(_ n: Int) -> Int {
        var ans = ""
        
        var n = n
        while n != 0 {
            ans = String(n % 9) + ans
            n /= 9
        }

        return Int(ans) ?? 0
    }
    
    public func newInteger(_ n: Int) -> Int {
        return n != 0 ? newInteger(n / 9) * 10 + n % 9 : 0
    }
}

let s = _660_移除9()
let result = s.newInteger(9)
print("\(s) --- \(result)")

assert(s.newInteger(9) == 10)
