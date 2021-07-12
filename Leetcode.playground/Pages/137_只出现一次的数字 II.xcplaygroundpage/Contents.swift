/**
 https://leetcode-cn.com/problems/single-number-ii/
 
 给你一个整数数组 nums ，除某个元素仅出现 一次 外，其余每个元素都恰出现 三次 。请你找出并返回那个只出现了一次的元素。

  

 示例 1：

 输入：nums = [2,2,3,2]
 输出：3
 示例 2：

 输入：nums = [0,1,0,1,0,1,99]
 输出：99
  

 提示：

 1 <= nums.length <= 3 * 104
 -231 <= nums[i] <= 231 - 1
 nums 中，除某个元素仅出现 一次 外，其余每个元素都恰出现 三次
  



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/single-number-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int : Int]()
        for i in nums{
            dict.updateValue((dict[i] ?? 0) + 1, forKey: i)
        }

        for (a, b) in dict where b == 1 {
            return a
        }
        return 0
    }
}

let s = Solution()
let result = s.singleNumber([2,2,3,2])
print(result)

assert(s.singleNumber([2,2,3,2]) == 3)
assert(s.singleNumber([0,1,0,1,0,1,99]) == 99)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

