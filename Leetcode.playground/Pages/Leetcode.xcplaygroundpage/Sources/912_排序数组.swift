/**
 https://leetcode-cn.com/problems/sort-an-array/
 
 给你一个整数数组 nums，请你将该数组升序排列。

  

 示例 1：

 输入：nums = [5,2,3,1]
 输出：[1,2,3,5]
 示例 2：

 输入：nums = [5,1,1,2,0,0]
 输出：[0,0,1,1,2,5]
  

 提示：

 1 <= nums.length <= 50000
 -50000 <= nums[i] <= 50000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

public class _912_排序数组 {
//class Solution {
    public init() {}
    
    public func sortArray(_ nums: [Int]) -> [Int] {
        
        let sortedArray = quickSort(array: nums)
        return sortedArray
    }
    
    public func quickSort(array: [Int]) -> [Int] {
        
        if array.count < 1 {
            return array
        }
        
        let pivot = array[array.count / 2]
        let less  = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let more  = array.filter { $0 > pivot }
        
        return quickSort(array: less) + equal + quickSort(array: more)
        
    }
}
