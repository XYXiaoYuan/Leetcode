/**
 https://leetcode-cn.com/problems/number-of-good-pairs/
 
 给你一个整数数组 nums 。

 如果一组数字 (i,j) 满足 nums[i] == nums[j] 且 i < j ，就可以认为这是一组 好数对 。

 返回好数对的数目。

  

 示例 1：

 输入：nums = [1,2,3,1,1,3]
 输出：4
 解释：有 4 组好数对，分别是 (0,3), (0,4), (3,4), (2,5) ，下标从 0 开始
 示例 2：

 输入：nums = [1,1,1,1]
 输出：6
 解释：数组中的每组数字都是好数对
 示例 3：

 输入：nums = [1,2,3]
 输出：0
  

 提示：

 1 <= nums.length <= 100
 1 <= nums[i] <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-good-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count: Int = 0
        for i in 0..<nums.count {
            for j in i..<nums.count where nums[i] == nums[j] && i < j {
                count += 1
            }
        }

        return count
    }
}

let s = Solution()
let result = s.numIdenticalPairs([1,2,3,1,1,3])
print(result)

assert(s.numIdenticalPairs([1,2,3,1,1,3]) == 4)
assert(s.numIdenticalPairs([1,1,1,1]) == 6)
assert(s.numIdenticalPairs([1,2,3]) == 0)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

