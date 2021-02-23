//: [Previous](@previous)

/// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/

/**
 
 给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的中位数。

 进阶：你能设计一个时间复杂度为 O(log (m+n)) 的算法解决此问题吗？

  

 示例 1：

 输入：nums1 = [1,3], nums2 = [2]
 输出：2.00000
 解释：合并数组 = [1,2,3] ，中位数 2
 示例 2：

 输入：nums1 = [1,2], nums2 = [3,4]
 输出：2.50000
 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
 示例 3：

 输入：nums1 = [0,0], nums2 = [0,0]
 输出：0.00000
 示例 4：

 输入：nums1 = [], nums2 = [1]
 输出：1.00000
 示例 5：

 输入：nums1 = [2], nums2 = []
 输出：2.00000
  

 提示：

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.isEmpty && nums2.count == 1 {
            return Double(nums2.first!)
        }
        if nums2.isEmpty && nums1.count == 1 {
            return Double(nums1.first!)
        }
        
        let count: Int = max(nums1.count, nums2.count)
        var cur1: Int = 0
        var cur2: Int = 0
        
        var middleIndex: (Int, Int) = (0, 0)
        if count & 2 == 1 {
            middleIndex
        }
        
        for i in 0..<count {
            if nums1[cur1] < nums2[cur2] {
                
            }
        }
        
        return 1.0
    }
}

let s = Solution()
let result = s.findMedianSortedArrays([1,3], [2])
print("结果result = \(result)")


//: [Next](@next)
