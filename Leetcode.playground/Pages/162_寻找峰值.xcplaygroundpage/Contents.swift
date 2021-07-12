/**
 https://leetcode-cn.com/problems/find-peak-element/
 
 峰值元素是指其值大于左右相邻值的元素。

 给你一个输入数组 nums，找到峰值元素并返回其索引。数组可能包含多个峰值，在这种情况下，返回 任何一个峰值 所在位置即可。

 你可以假设 nums[-1] = nums[n] = -∞ 。

  

 示例 1：

 输入：nums = [1,2,3,1]
 输出：2
 解释：3 是峰值元素，你的函数应该返回其索引 2。
 示例 2：

 输入：nums = [1,2,1,3,5,6,4]
 输出：1 或 5
 解释：你的函数可以返回索引 1，其峰值元素为 2；
      或者返回索引 5， 其峰值元素为 6。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-peak-element
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let newNums = [Int.min] + nums + [Int.min]
        var left = 0, right = newNums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if newNums[mid] > newNums[mid - 1] && newNums[mid] > newNums[mid + 1] {
                return mid - 1
            } else if newNums[mid] < newNums[mid - 1] {
                right = mid
            } else if newNums[mid] < newNums[mid + 1] {
                left = mid
            }
        }
        
        return -1
    }
}
