/**
 https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/
 
 统计一个数字在排序数组中出现的次数。

  

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0
  

 限制：

 0 <= 数组长度 <= 50000

  



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res: [Int] = [-1, -1]
        let count = nums.count
        
        for i in 0..<count {
            if nums[i] == target {
                res[1] = i
                if res[0] == -1 {
                    res[0] = i
                }
            }
        }
        
        return res
    }
}

let s = Solution()
let input1: [Int] = [5,7,7,8,8,10]
let input2: [Int] = []
let result = s.searchRange(input1, 8)
print(result)

assert(s.searchRange(input1, 8) == [3, 4])
assert(s.searchRange(input2, 0) == [-1, -1])

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

