/**
 https://leetcode-cn.com/problems/wiggle-sort/
 
 给你一个无序的数组 nums, 将该数字 原地 重排后使得 nums[0] <= nums[1] >= nums[2] <= nums[3]...。

 示例:

 输入: nums = [3,5,2,1,6,4]
 输出: 一个可能的解答是 [3,5,1,6,2,4]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/wiggle-sort
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _280_摆动排序 {
//class Solution {
    public init() {}
    
    public func wiggleSort(_ nums: inout [Int]) {
        for i in 0..<(nums.count - 1) {
            let val = nums[i], next = nums[i + 1]
            if (i % 2 == 0) == (val > next) {
                swapValues(&nums, i, i + 1)
            }
        }
    }
    
    private func swapValues(_ nums: inout [Int], _ left: Int, _ right: Int) {
        let temp = nums[left]
        nums[left] = nums[right]
        nums[right] = temp
    }
}
