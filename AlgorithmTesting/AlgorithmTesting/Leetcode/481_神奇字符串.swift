/**
 
 https://leetcode.cn/problems/magical-string/
 
 神奇字符串 s 仅由 '1' 和 '2' 组成，并需要遵守下面的规则：

 神奇字符串 s 的神奇之处在于，串联字符串中 '1' 和 '2' 的连续出现次数可以生成该字符串。
 s 的前几个元素是 s = "1221121221221121122……" 。如果将 s 中连续的若干 1 和 2 进行分组，可以得到 "1 22 11 2 1 22 1 22 11 2 11 22 ......" 。每组中 1 或者 2 的出现次数分别是 "1 2 2 1 1 2 1 2 2 1 2 2 ......" 。上面的出现次数正是 s 自身。

 给你一个整数 n ，返回在神奇字符串 s 的前 n 个数字中 1 的数目。

  

 示例 1：

 输入：n = 6
 输出：3
 解释：神奇字符串 s 的前 6 个元素是 “122112”，它包含三个 1，因此返回 3 。
 示例 2：

 输入：n = 1
 输出：1
  

 提示：

 1 <= n <= 105

 */

import Foundation
import Darwin

public class _481_神奇字符串 {
    //class _481_神奇字符串 {
    public init() {}
    
    public func magicalString(_ n: Int) -> Int {
        var f = [Int].init(repeating: 0, count: n + 10)
        
        var sb = "01" // 首位多加一个 0 作为哨兵
        
        var i = 1, j = 1, cnt = 0
        let zeroAsciiValue = "0".ASCIIValue()
        while i <= n {
            let last = sb[sb.count - 1].ASCIIValue() - zeroAsciiValue
            let t = sb[j].ASCIIValue() - zeroAsciiValue
            if (last == 1) {
                if (t == 1) {
                    // 当原串当前字符是 1，而计数串当前字符为 1
                    // 往后构造形成的原串只能是 12，原串指针后移一位
                    sb.append("2")
                    cnt += 1
                    f[i] = cnt
                    i += 1
                } else {
                    // 当原串当前字符是 1，而计数串当前字符为 2
                    // 往后构造形成的原串只能是 112，此时同步更新 f[i + 1]，原串指针后移两位
                    sb.append("12")
                    cnt += 1
                    f[i] = cnt
                    cnt += 1
                    f[i + 1] = cnt
                    i += 2
                }
            } else {
                if (t == 1) {
                    // 当原串当前字符是 2，而计数串当前字符为 1
                    // 往后构造形成的原串只能是 21，原串指针后移一位
                    sb.append("1")
                    f[i] = cnt
                    i += 1
                } else {
                    // 当原串当前字符是 2，而计数串当前字符为 2
                    // 往后构造形成的原串只能是 221，原串指针后移两位
                    sb.append("21")
                    let temp = cnt
                    f[i] = temp
                    f[i + 1] = temp
                    i += 2
                }
            }
            
            j += 1
        }
        
        return f[n]
    }
    
}

extension _481_神奇字符串 {
    public func test() {
        let testTime = 10000
        print("对数器开始工作, 执行 【\(testTime)】 次")
        
        var isSucceed = true
        for i in 0..<testTime {
            let n = Int.random(in: 1...100)

            let result0 = self.magicalString(n)
            let result1 = self.magicalString(n)
            
            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, nums = \(n), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, nums = \(n), result = \(result1)")
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _481_神奇字符串()
//
//    do {
//        let result = s.magicalString(6)
//        assert(result == 3)
//        print(result)
//
//    }
//
//    do {
//        let result = s.magicalString(1)
//        assert(result == 1)
//        print(result)
//
//    }
////    s.test()
//}


//: [Next](@next)
