/**
 https://leetcode-cn.com/problems/find-greatest-common-divisor-of-array/
 
 给你一个整数数组 nums ，返回数组中最大数和最小数的 最大公约数 。

 两个数的 最大公约数 是能够被两个数整除的最大正整数。

  

 示例 1：

 输入：nums = [2,5,6,9,10]
 输出：2
 解释：
 nums 中最小的数是 2
 nums 中最大的数是 10
 2 和 10 的最大公约数是 2
 示例 2：

 输入：nums = [7,5,6,8,3]
 输出：1
 解释：
 nums 中最小的数是 3
 nums 中最大的数是 8
 3 和 8 的最大公约数是 1
 示例 3：

 输入：nums = [3,3]
 输出：3
 解释：
 nums 中最小的数是 3
 nums 中最大的数是 3
 3 和 3 的最大公约数是 3
  

 提示：

 2 <= nums.length <= 1000
 1 <= nums[i] <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-greatest-common-divisor-of-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Darwin

public class _1979_找出数组的最大公约数 {
//class Solution {
    public init() {}

    public func findGCD(_ nums: [Int]) -> Int {
        var min = Int.max
        var max = Int.min
        
        for num in nums {
            if num > max {
                max = num
            }
            
            if num < min {
                min = num
            }
        }
        
        return gcd(min, max)
    }
    
    private func gcd(_ x: Int, _ y: Int) -> Int {
        return y == 0 ? x : gcd(y, x % y)
    }
}

//do {
//    let s = _1979_找出数组的最大公约数()
//    let result = s.findGCD([2,5,6,9,10])
//    print(result)
//    assert(result == 2)
//}
//
//do {
//    let s = _1979_找出数组的最大公约数()
//    let result = s.findGCD([7,5,6,8,3])
//    print(result)
//    assert(result == 1)
//}
//
//do {
//    let s = _1979_找出数组的最大公约数()
//    let result = s.findGCD([3,3])
//    print(result)
//    assert(result == 3)
//}

