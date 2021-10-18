//: [Previous](@previous)

/// https://leetcode-cn.com/problems/product-of-array-except-self/

/**
 给你一个长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。

  

 示例:

 输入: [1,2,3,4]
 输出: [24,12,8,6]
  

 提示：题目数据保证数组之中任意元素的全部前缀元素和后缀（甚至是整个数组）的乘积都在 32 位整数范围内。

 说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。

 进阶：
 你可以在常数空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/product-of-array-except-self
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _238_除自身以外数组的乘积 {
//class Solution {
    public init() {}
    
    public func productExceptSelf(_ nums: [Int]) -> [Int] {
        var res: [Int] = Array(repeating: 1, count: nums.count)

        var p = 1
        var q = 1
        for i in 0..<nums.count {
            res[i] = p
            print("第 \(i) 次 --- res = \(res)")
            print("乘之前🦄 第 \(i) 次 --- p = \(p)")
            p *= nums[i]
            print("乘之后🐶 第 \(i) 次 --- p = \(p)")
            
            print("\n")
        }
        
        for i in stride(from: nums.count - 1, to: 0, by: -1) {
            print("乘之前🦄第 \(i) 次 --- q = \(q)")
            q *= nums[i]
            print("乘之后🐶第 \(i) 次 --- q = \(q)")
            res[i - 1] *= q
            print("第 \(i) 次 --- res = \(res)")
            
            print("\n")
        }
                
        return res
    }
}

//let s = _238_除自身以外数组的乘积()
//let result = s.productExceptSelf([1, 2, 3, 4])
//print("结果result = \(result)")


//: [Next](@next)
