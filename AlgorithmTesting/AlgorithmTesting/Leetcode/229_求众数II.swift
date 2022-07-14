/**
 https://leetcode-cn.com/problems/majority-element-ii/
 
 给定一个大小为 n 的整数数组，找出其中所有出现超过 ⌊ n/3 ⌋ 次的元素。

  

  

 示例 1：

 输入：[3,2,3]
 输出：[3]
 示例 2：

 输入：nums = [1]
 输出：[1]
 示例 3：

 输入：[1,1,1,3,3,2,2,2]
 输出：[1,2]
  

 提示：

 1 <= nums.length <= 5 * 104
 -109 <= nums[i] <= 109
  

 进阶：尝试设计时间复杂度为 O(n)、空间复杂度为 O(1)的算法解决此问题。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/majority-element-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

public class _229_求众数II {
    public init() {}
    
    /// 摩尔投票法
    public func majorityElement(_ nums: [Int]) -> [Int] {
        var element1 = 0
        var element2 = 0
        var vote1 = 0
        var vote2 = 0
        
        for num in nums {
            if vote1 > 0 && num == element1 { //如果该元素为第一个元素，则计数加1
                vote1 += 1
            } else if vote2 > 0 && num == element2 { //如果该元素为第二个元素，则计数加1
                vote2 += 1
            } else if vote1 == 0 { // 选择第一个元素
                element1 = num
                vote1 += 1
            } else if vote2 == 0 { // 选择第二个元素
                element2 = num
                vote2 += 1
            } else { //如果三个元素均不相同，则相互抵消1次
                vote1 -= 1
                vote2 -= 1
            }
        }
        
        var cnt1 = 0
        var cnt2 = 0
        for num in nums {
            if vote1 > 0 && num == element1 {
                cnt1 += 1
            }
            if vote2 > 0 && num == element2 {
                cnt2 += 1
            }
        }
        
        // 检测元素出现的次数是否满足要求
        var ans: [Int] = [Int]()
        if vote1 > 0 && cnt1 > (nums.count / 3) {
            ans.append(element1)
        }
        if vote2 > 0 && cnt2 > (nums.count / 3) {
            ans.append(element2)
        }
        
        return ans.sorted()
    }
    
    /// 哈希统计
    public func majorityElement1(_ nums: [Int]) -> [Int] {
        var dict: [Int: Int] = [Int: Int]()
        
        for num in nums {
            if var count = dict[num] {
                count += 1
                dict[num] = count
            } else {
                dict[num] = 1
            }
        }
        
        let appearCount: Int = nums.count / 3
        var result: [Int] = [Int]()
        for d in dict {
            if d.value > appearCount {
                result.append(d.key)
            }
        }
                
        return result.sorted()
    }
}

//let s = _229_求众数II()
//let result = s.majorityElement([1,1,1,3,3,2,2,2])
//print("\(s) --- \(result)")
//
//assert(s.majorityElement([3,2,3]) == [3])
//assert(s.majorityElement([1]) == [1])
//assert(s.majorityElement([1,1,1,3,3,2,2,2]) == [1,2])
