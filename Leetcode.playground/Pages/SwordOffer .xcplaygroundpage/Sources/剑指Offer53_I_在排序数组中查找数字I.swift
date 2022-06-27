/**
 https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/
 
 统计一个数字在排序数组中出现的次数。

  

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer53_I_在排序数组中查找数字I {
//class Solution {
    public init() {}
    
    public func search(_ nums: [Int], _ target: Int) -> Int {
        var res: [Int] = [-1, -1]
        let count = nums.count
        
        for i in 0..<count {
            if nums[i] == target {
                res[1] = i
                if res[0] == -1 {
                    res[0] = i
                }
            }
        }
        
        if res[0] == -1, res[1] == -1 {
            return 0
        }
        return res[1] - res[0] + 1
    }
}
