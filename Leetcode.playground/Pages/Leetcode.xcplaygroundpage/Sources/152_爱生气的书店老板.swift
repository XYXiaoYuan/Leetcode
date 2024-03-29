//: [Previous](@previous)

/// https://leetcode-cn.com/problems/grumpy-bookstore-owner/

/**
 今天，书店老板有一家店打算试营业 customers.length 分钟。每分钟都有一些顾客（customers[i]）会进入书店，所有这些顾客都会在那一分钟结束后离开。

 在某些时候，书店老板会生气。 如果书店老板在第 i 分钟生气，那么 grumpy[i] = 1，否则 grumpy[i] = 0。 当书店老板生气时，那一分钟的顾客就会不满意，不生气则他们是满意的。

 书店老板知道一个秘密技巧，能抑制自己的情绪，可以让自己连续 X 分钟不生气，但却只能使用一次。

 请你返回这一天营业下来，最多有多少客户能够感到满意的数量。
  

 示例：

 输入：customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], X = 3
 输出：16
 解释：
 书店老板在最后 3 分钟保持冷静。
 感到满意的最大客户数量 = 1 + 1 + 1 + 1 + 7 + 5 = 16.
  

 提示：

 1 <= X <= customers.length == grumpy.length <= 20000
 0 <= customers[i] <= 1000
 0 <= grumpy[i] <= 1


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/grumpy-bookstore-owner
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _152_爱生气的书店老板 {
//class Solution {
    public init() {}
    
    public func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ X: Int) -> Int {
        let count: Int = customers.count
        /// 所有不生气时间内的顾客总数
        var sum: Int = 0
        for i in 0..<count {
            sum += customers[i] * (1 - grumpy[i])
        }
        
//        print("所有不生气时间内的顾客总数 \(sum)")
        /// 生气的 X 分钟内,会让多少顾客不满意
        var curValue: Int = 0
        for i in 0..<X {
            curValue += customers[i] * grumpy[i]
        }
//        print("生气的 X 分钟内,会让多少顾客不满意 \(curValue)")

        var resValue = curValue
        
        /// 然后利用滑动窗口,每次向右移动一步
        for i in X..<count {
            /// 如果新进入窗口的元素是生气的,累加不满意的顾客到滑动窗口中
            /// 如果离开窗口的元素是生气的，则从滑动窗口中减去该不满意的顾客数
            curValue = curValue + customers[i] * grumpy[i] - customers[i - X] * grumpy[i - X]

            /// 求所有窗口内不满意顾客的最大值
//            print("i = \(i), i - X = \(i - X) 每次 \(i - X + 1)的 resValue = \(resValue) --- curValue = \(curValue)")
            resValue = max(resValue, curValue)
        }
        
        /// 最多有多少客户能够感到满意的数量
        return sum + resValue
    }
}


//let s = _152_爱生气的书店老板()
//s.maxSatisfied([1,0,1,2,1,1,7,5], [0,1,0,1,0,1,0,1], 3)

//: [Next](@next)

