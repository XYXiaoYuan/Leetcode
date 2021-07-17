/**
 https://leetcode-cn.com/problems/jump-game/
 
 给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。

 数组中的每个元素代表你在该位置可以跳跃的最大长度。

 判断你是否能够到达最后一个下标。

  

 示例 1：

 输入：nums = [2,3,1,1,4]
 输出：true
 解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
 示例 2：

 输入：nums = [3,2,1,0,4]
 输出：false
 解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/jump-game
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/// 如果一个位置能够到达，那么这个位置左侧所有位置都能到达。
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var k = 0
        for i in 0..<nums.count {
            if i > k {
                return false
            }
            
            k = max(k, i + nums[i])
        }
        
        return true
    }
}

let s = Solution()
let input1 = [2,3,1,1,4]
let input2 = [3,2,1,0,4]
let result = s.canJump(input1)
print(result)

assert(s.canJump(input1) == true)
assert(s.canJump(input2) == false)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

