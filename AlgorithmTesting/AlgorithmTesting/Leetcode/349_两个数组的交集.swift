/**
 https://leetcode-cn.com/problems/intersection-of-two-arrays/
 
 给定两个数组，编写一个函数来计算它们的交集。

  

 示例 1：

 输入：nums1 = [1,2,2,1], nums2 = [2,2]
 输出：[2]
 示例 2：

 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出：[9,4]
  

 说明：

 输出结果中的每个元素一定是唯一的。
 我们可以不考虑输出结果的顺序。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/intersection-of-two-arrays
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _349_两个数组的交集 {
//class Solution {
    public init() {}
    
    public func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1.filter { nums2.contains($0)} ))
    }
    
     public func intersection1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
         let set1:Set<Int> = Set(nums1)
         let set2:Set<Int> = Set(nums2)
        
         return Array(set1.intersection(set2))
     }
}
