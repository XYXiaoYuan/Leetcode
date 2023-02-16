/**
 https://leetcode.cn/problems/largest-3-same-digit-number-in-string/
 
 给你一个字符串 num ，表示一个大整数。如果一个整数满足下述所有条件，则认为该整数是一个 优质整数 ：

 该整数是 num 的一个长度为 3 的 子字符串 。
 该整数由唯一一个数字重复 3 次组成。
 以字符串形式返回 最大的优质整数 。如果不存在满足要求的整数，则返回一个空字符串 "" 。

 注意：

 子字符串 是字符串中的一个连续字符序列。
 num 或优质整数中可能存在 前导零 。
  

 示例 1：

 输入：num = "6777133339"
 输出："777"
 解释：num 中存在两个优质整数："777" 和 "333" 。
 "777" 是最大的那个，所以返回 "777" 。
 示例 2：

 输入：num = "2300019"
 输出："000"
 解释："000" 是唯一一个优质整数。
 示例 3：

 输入：num = "42352338"
 输出：""
 解释：不存在长度为 3 且仅由一个唯一数字组成的整数。因此，不存在优质整数。
  

 提示：

 3 <= num.length <= 1000
 num 仅由数字（0 - 9）组成


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/largest-3-same-digit-number-in-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _2264_字符串中最大的3位相同数字 {
    //class Solution {
    public init() {}
    
    public func largestGoodInteger(_ num: String) -> String {
        var lastNum = String(num.first!)
        var dict = [lastNum: 1]
        let nums = (num.map { String($0) })
        for i in 1..<nums.count {
            let n = nums[i]
            if lastNum == n {
                if let value = dict[n] {
                    dict[n] = value + 1
                } else {
                    dict[n] = 1
                }
            } else {
                dict.updateValue(dict[n] ?? 1, forKey: n)
            }
            
            lastNum = n
        }
       
        dict = dict.filter({ $0.value >= 3 })
        
        print(dict)
                
        let result = dict.sorted(by: { (k1, k2) -> Bool in
            return k1.key > k2.key
        }).first?.key
        
        guard let result = result else { return "" }
        return String.init(repeating: result, count: 3)
    }
}

extension _2264_字符串中最大的3位相同数字 {
    public func test() {
        
        let testTime = 1
        print("对数器开始工作, 执行 【\(testTime)】 次")
        var isSucceed = true
        let minLength = 3
        let maxLength = 20//1000
        for i in 0..<testTime {
            var num = ""
            let length = Int.random(in: minLength...maxLength)
            for _ in 0..<length {
                let t = Int.random(in: 0...9)
                num += "\(t)"
            }
            
            let result1 = largestGoodInteger(num)

            let result2 = largestGoodInteger(num)

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

do {
    let s = _2264_字符串中最大的3位相同数字()

    let result1 = s.largestGoodInteger("6777133339")
    assert(result1 == "777")
    print(result1)

    let result2 = s.largestGoodInteger("2300019")
    assert(result2 == "000")
    print(result2)

    let result3 = s.largestGoodInteger("711133310755088231390684011112227777007142226669892017313336662051880002555771116")
//    assert(result3 == "")
    print(result3)

    s.test()
}


//: [Next](@next)
