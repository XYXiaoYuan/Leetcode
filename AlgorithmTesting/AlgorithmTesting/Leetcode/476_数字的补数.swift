/**
 https://leetcode.cn/problems/number-complement/
 
 对整数的二进制表示取反（0 变 1 ，1 变 0）后，再转换为十进制表示，可以得到这个整数的补数。

 例如，整数 5 的二进制表示是 "101" ，取反后得到 "010" ，再转回十进制表示得到补数 2 。
 给你一个整数 num ，输出它的补数。

  

 示例 1：

 输入：num = 5
 输出：2
 解释：5 的二进制表示为 101（没有前导零位），其补数为 010。所以你需要输出 2 。
 示例 2：

 输入：num = 1
 输出：0
 解释：1 的二进制表示为 1（没有前导零位），其补数为 0。所以你需要输出 0 。
  

 提示：

 1 <= num < 231
  

 注意：本题与 1009 https://leetcode-cn.com/problems/complement-of-base-10-integer/ 相同



 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/number-complement
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _476_数字的补数 {
    //class Solution {
    public init() {}

    public func findComplement(_ num: Int) -> Int {
        var num = num, s = 0, i = 0
        
        repeat {
            if num & 1 != 1 {
                s += Int(pow(Float(2), Float(i)))
            }
            i += 1
            num = num >> 1
            
        } while num != 0
        
        return s
    }
}

extension _476_数字的补数 {
    public func test() {
        
        let testTime = 10
        print("对数器开始工作, 执行 【\(testTime)】 次")
        var isSucceed = true
        let maxVlaue = 100;
        for i in 0..<testTime {
            let num = Int.random(in: 0..<maxVlaue)

            /// 方法一
            let result1 = findComplement(num)

            let result2 = findComplement(num)

            if result1 != result2 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, num = \(num)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, num = \(num), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _476_数字的补数()
//
//    let result1 = s.findComplement(5)
//    assert(result1 == 2)
//    print(result1)
//
//    let result2 = s.findComplement(1)
//    assert(result2 == 0)
//    print(result2)
//
//    let result3 = s.findComplement(0)
//    assert(result3 == 1)
//    print(result3)
//
//
//    s.test()
//}


//: [Next](@next)
