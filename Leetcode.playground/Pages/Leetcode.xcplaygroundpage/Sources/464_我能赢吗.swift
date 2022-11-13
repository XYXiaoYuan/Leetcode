/**
 https://leetcode.cn/problems/can-i-win/
 
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：true
 示例 2：


 输入：root = [1,2,2,3,3,null,null,4,4]
 输出：false
 示例 3：

 输入：root = []
 输出：true
  

 提示：

 树中的节点数在范围 [0, 5000] 内
 -104 <= Node.val <= 104


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/balanced-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _464_我能赢吗 {
    //class Solution {
    public init() {}
    
    public func canIWin(_ choose: Int, _ total: Int) -> Bool {
        if total == 0 {
            return true
        }
        
        if (choose * (choose + 1) >> 1) < total {
            return false
        }
        
        var dp = [Int].init(repeating: 0, count: 1 << (choose + 1))
        // dp[status] == 1  true
        // dp[status] == -1  false
        // dp[status] == 0  process(status) 没算过！去算！
        var total = total
        var status = 0
        return process(&dp, &status, &total, choose)
    }

    private func process(_ dp: inout [Int], _ status: inout Int, _ remain: inout Int, _ choose: Int) -> Bool {
        if dp[status] != 0 {
            return dp[status] == 1 ? true : false
        }
        
        var ans = false
        if remain > 0 {
            for i in 1...choose where ((1 << i) & status) == 0 {
                var curStatus = status | (1 << i)
                var curRemain = remain - i
                let next = process(&dp, &curStatus, &curRemain, choose)
                if !next {
                    ans = true
                    break
                }
            }
        }
        dp[status] = ans ? 1 : -1
        return ans
    }
    
    /// 暴力方法，会超时
    func canIWin0(_ choose: Int, _ total: Int) -> Bool {
        if total == 0 {
            return true
        }
        
        if (choose * (choose + 1) >> 1) < total {
            return false
        }

        var arr = [Int]()
        for i in 0..<choose {
            arr.append(i + 1)
        }

        var total = total
        return process(&arr, &total)
    }

    private func process(_ arr: inout [Int], _ remain: inout Int) -> Bool {
        if remain <= 0 { return false }
        
        for i in 0..<arr.count where arr[i] != -1 {
            let cur = arr[i]
            arr[i] = -1
            var curRemain = remain - cur
            let next = process(&arr, &curRemain)
            arr[i] = cur
            if !next {
                return true
            }
        }
        return false
    }

}

extension _464_我能赢吗 {
    public func test() {
        let testTime = 1
        var isSucceed = true
        for _ in 0..<testTime {
            let choose = Int.random(in: 1...20)
            let total = Int.random(in: 0...300)
            
            /// 方法一
            let result1 = canIWin0(choose, total)

            /// 待验证的：方法二
            let result2 = canIWin(choose, total)
            
            if result1 != result2 {
                isSucceed = false
                print("choose = \(choose) --- total = \(total)")
                break
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }

}


//do {
//    let s = _464_我能赢吗()
//    let result = s.canIWin(10, 11)
//    print("\(s) --- \(result)")
//
//    /// 对数器测试
//    s.test()
////    Solution.Test.defaultTestSuite.run()
//}

//: [Next](@next)
