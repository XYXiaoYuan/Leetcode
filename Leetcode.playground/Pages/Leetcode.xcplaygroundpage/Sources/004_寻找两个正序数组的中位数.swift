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

public class _004_寻找两个正序数组的中位数 {
//class Solution {
    public init() {}
    
    public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var i = 0, j = 0, numbers = [Int]()
        while i < nums1.count, j < nums2.count {
            if nums1[i] < nums2[j] {
                numbers.append(nums1[i])
                i += 1
            } else {
                numbers.append(nums2[j])
                j += 1
            }
        }
        numbers.append(contentsOf: nums1[i..<nums1.count])
        numbers.append(contentsOf: nums2[j..<nums2.count])
        if numbers.count % 2 == 0 {
            return Double(numbers[numbers.count / 2] + numbers[numbers.count / 2 - 1]) / 2
        } else {
            return Double(numbers[numbers.count / 2])
        }
    }

    public func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count <= nums2.count else {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let m = nums1.count, n = nums2.count
        var start = 0, end = m
        
        while start <= end {
            let cutPos1 = (start + end) / 2
            let cutPos2 = (m + n + 1) / 2 - cutPos1
            
            // If cutPos1 == 0, nothing in array1 is there on the left,
            // use Int.min for maxLeft1
            // If cutPos1 == m, nothing in array1 is there on the right,
            // use Int.max for minRight1
            let maxLeft1 = cutPos1 == 0 ? Int.min : nums1[cutPos1 - 1]
            let minRight1 = cutPos1 == m ? Int.max : nums1[cutPos1]
            
            let maxLeft2 = cutPos2 == 0 ? Int.min : nums2[cutPos2 - 1]
            let minRight2 = cutPos2 == n ? Int.max : nums2[cutPos2]
            
            if maxLeft1 <= minRight2, maxLeft2 <= minRight1 {
                // We have partitioned both array at correct place
                if (m + n) % 2 == 0 {
                    return Double(max(maxLeft1, maxLeft2) + min(minRight1, minRight2)) / 2.0
                } else {
                    return Double(max(maxLeft1, maxLeft2))
                }
            } else if maxLeft1 > minRight2 {
                // We are too far on right side for cutPos1, go left side
                end = cutPos1 - 1
            } else {
                // We are too far on left side for cutPos1, go right side
                start = cutPos1 + 1
            }
        }
        return -1
    }
}

//do {
//    let s = _004_寻找两个正序数组的中位数()
//    let result = s.findMedianSortedArrays([1,3], [2])
//    print("结果result = \(result)")
//}

//: [Next](@next)
