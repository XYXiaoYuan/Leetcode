/**
 https://leetcode-cn.com/problems/how-many-apples-can-you-put-into-the-basket/
 
 你有一些苹果和一个可以承载 5000 单位重量的篮子。

 给定一个整数数组 weight ，其中 weight[i] 是第 i 个苹果的重量，返回 你可以放入篮子的最大苹果数量 。

  

 示例 1：

 输入：weight = [100,200,150,1000]
 输出：4
 解释：所有 4 个苹果都可以装进去，因为它们的重量之和为 1450。
 示例 2：

 输入：weight = [900,950,800,1000,700,800]
 输出：5
 解释：6 个苹果的总重量超过了 5000，所以我们只能从中任选 5 个。
  

 提示：

 1 <= weight.length <= 103
 1 <= weight[i] <= 103


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/how-many-apples-can-you-put-into-the-basket
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Darwin

public class _1196_最多可以买到的苹果数量 {
//class Solution {
    public init() {}

    public func maxNumberOfApples(_ weight: [Int]) -> Int {
        let appleWeights = weight.sorted()
        var sum = 0
        var count = 0
        
        for weight in appleWeights {
            sum += weight
            
            if sum > 5000 {
                break
            }
            count += 1
        }
        
        return count
    }
}

//do {
//    let s = _1196_最多可以买到的苹果数量()
//    let result = s.maxNumberOfApples([100,200,150,1000])
//    print(result)
//    assert(result == 4)
//}
//
//do {
//    let s = _1196_最多可以买到的苹果数量()
//    let result = s.maxNumberOfApples([900,950,800,1000,700,800])
//    print(result)
//    assert(result == 5)
//}
