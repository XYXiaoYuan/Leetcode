/**
 https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
 
 找出数组中重复的数字。


 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

 示例 1：

 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [Int: Int]()
        for num in nums {
            if var val = dict[num] {
                val += 1
                dict[num] = val
            } else {
                dict[num] = 1
            }
        }
        
        if let first = dict.filter({ $0.value > 1 }).first {
            return first.key
        }
        return 0
    }
}

let s = Solution()
let result = s.findRepeatNumber([2, 3, 1, 0, 2, 5, 3])
print(result)

assert(s.findRepeatNumber([2, 3, 1, 0, 2, 5, 3]) == 2)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

