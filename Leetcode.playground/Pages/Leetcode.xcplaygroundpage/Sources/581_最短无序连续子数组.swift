/**
 https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray/
 
 给你一个整数数组 nums ，你需要找出一个 连续子数组 ，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。

 请你找出符合题意的 最短 子数组，并输出它的长度。

  

 示例 1：

 输入：nums = [2,6,4,8,10,9,15]
 输出：5
 解释：你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
 示例 2：

 输入：nums = [1,2,3,4]
 输出：0
 示例 3：

 输入：nums = [1]
 输出：0


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _581_最短无序连续子数组 {
//class Solution {
    public init() {}
    
    public func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        var i = 0, j = nums.count - 1
        
        // narrow down
        while i < nums.count-1 && nums[i] <= nums[i+1] {
            i += 1
        }
        while j > 0 && nums[j-1] <= nums[j] {
            j -= 1
        }
        
        if i < j {
            var subMax = nums[i...j].max()!
            var subMin = nums[i...j].min()!
            
            // expand area
            while j+1 < nums.count && subMax > nums[j+1] {
                j += 1
            }
            while i-1 >= 0 && subMin < nums[i-1] {
                i -= 1
            }
            return j - i + 1
        } else {
            return 0
        }
    }
    
    
    public func findUnsortedSubarray1(_ nums: [Int]) -> Int {
        var sortedNums = nums.sorted(by: < )
        var start = 0
        var end = 0
        for i in 0 ..< nums.count {
            if nums[i] != sortedNums[i]  {
                start = i
                break
            }
        }
        for j in stride(from: nums.count-1, to: 0, by: -1) {
            if nums[j] != sortedNums[j] {
                end = j
                break
            }
        }
        if start == end {
            return 0
        } else {
            return end - start + 1
        }
    }
}
