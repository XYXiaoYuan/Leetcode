/**
 https://leetcode.cn/problems/4xy4Wx/
 
 小力将 N 个零件的报价存于数组 nums。小力预算为 target，假定小力仅购买两个零件，要求购买零件的花费不超过预算，请问他有多少种采购方案。

 注意：答案需要以 1e9 + 7 (1000000007) 为底取模，如：计算初始结果为：1000000008，请返回 1

 示例 1：

 输入：nums = [2,5,3,5], target = 6

 输出：1

 解释：预算内仅能购买 nums[0] 与 nums[2]。

 示例 2：

 输入：nums = [2,2,1,9], target = 10

 输出：4

 解释：符合预算的采购方案如下：
 nums[0] + nums[1] = 4
 nums[0] + nums[2] = 3
 nums[1] + nums[2] = 3
 nums[2] + nums[3] = 10

 提示：

 2 <= nums.length <= 10^5
 1 <= nums[i], target <= 10^5


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/4xy4Wx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class LCP28_采购方案 {
    //class Solution {
    public init() {}
        
    public func purchasePlans(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var ans = 0
        var L = 0
        var R = nums.count - 1
        while L < R {
            print(L, R, nums[L] + nums[R], target)
            if (nums[L] + nums[R] > target) {
                R -= 1
            } else {
                ans += R - L
                L += 1
            }
        }
        return ans % 1000000007
    }
    
    public func purchasePlans0(_ nums: [Int], _ target: Int) -> Int {
        var ans = 0
        for i in 0..<nums.count {
            let n = nums[i]
            for j in (i+1)..<nums.count {
                let u = nums[j]
                if n + u <= target {
                    ans += 1
                }
            }
        }
        return ans % 1000000007
    }
}

extension LCP28_采购方案 {
    public func test() {
        let testTime = 10
        print("对数器开始工作, 执行 【\(testTime)】 次")
        var isSucceed = true
        let minLength = 2
        let maxLength = 10//100000
        
        let minValue = 1
        let maxValue = 10//100000
        
        for i in 0..<testTime {
            let count = Int.random(in: minLength...maxLength)
            var nums = [Int]()
            for _ in 0..<count {
                let t = Int.random(in: minValue...maxValue)
                nums.append(t)
            }
            let target = Int.random(in: minValue...maxValue)
            
            let result0 = self.purchasePlans0(nums, target)
            let result1 = self.purchasePlans(nums, target)

            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, nums = \(nums), target = \(target), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, nums = \(nums), target = \(target), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = LCP28_采购方案()
//
//    let result1 = s.purchasePlans([2,5,3,5], 6)
//    assert(result1 == 1)
//    print(result1)
//
//    let result2 = s.purchasePlans([2,2,1,9], 10)
//    assert(result2 == 4)
//    print(result2)
//
//    s.test()
//}


//: [Next](@next)
