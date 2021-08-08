/**
 https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof/
 
 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。

  

 示例：

 输入：nums = [1,2,3,4]
 输出：[1,3,2,4]
 注：[3,1,2,4] 也是正确的答案之一。
  

 提示：

 0 <= nums.length <= 50000
 1 <= nums[i] <= 10000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        var res = [Int].init(repeating: 0, count: nums.count)
        
        var index = 0
        for num in nums where num & 1 == 1 {
            res[index] = num
            index += 1
        }
        
        for num in nums where num & 1 == 0 {
            res[index] = num
            index += 1
        }
        
        return res
    }
}

let s = Solution()
let input1 = [1,2,3,4]
let input2 = [2,16,3,5,13,1,16,1,12,18,11,8,11,11,5,1]
let result = s.exchange(input2)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

