//: [Previous](@previous)

/// https://leetcode-cn.com/problems/maximum-gap/

/**
 给定一个无序的数组，找出数组在排序之后，相邻元素之间最大的差值。

 如果数组元素个数小于 2，则返回 0。

 示例 1:

 输入: [3,6,9,1]
 输出: 3
 解释: 排序后的数组是 [1,3,6,9], 其中相邻元素 (3,6) 和 (6,9) 之间都存在最大差值 3。
 示例 2:

 输入: [10]
 输出: 0
 解释: 数组元素个数小于 2，因此返回 0。
 说明:

 你可以假设数组中所有元素都是非负整数，且数值在 32 位有符号整数范围内。
 请尝试在线性时间复杂度和空间复杂度的条件下解决此问题。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-gap
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _164_最大间距 {
//class Solution {
    public init() {}
    
    public func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        
        let _ = nums.sorted()
                
        return 0
    }
}

//let s = _164_最大间距()
//let result = s.maximumGap([3,6,9,1])
//print("结果result = \(result)")


//: [Next](@next)
