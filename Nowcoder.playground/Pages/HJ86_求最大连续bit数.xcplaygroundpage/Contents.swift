/**
 https://www.nowcoder.com/practice/4b1658fd8ffb4217bc3b7e85a38cfaf2?tpId=37&&tqId=21309&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 求一个byte数字对应的二进制数字中1的最大连续数，例如3的二进制为00000011，最大连续2个1

 本题含有多组样例输入。

 输入描述：
 输入一个byte数字

 输出描述：
 输出转成二进制之后连续1的个数

 示例1
 输入：
 3
 5

 输出：
 2
 1

 说明：
 3的二进制表示是11，最多有2个连续的1。
 5的二进制表示是101，最多只有1个连续的1。
 
 */

import Foundation


/// 在转换二进制的时候,直接给1计数
/// - Parameter num: 数字
/// - Returns: 数字的2进制连续为1的最大个数
func continuousMaxBitCountRadix(_ num: Int) -> Int {
    var max: Int = 0
    var count: Int = 0
    var flag: Bool = false
    var inte = num
    var r: Int = 0
    while true {
        r = inte % 2
        if r == 1 {
            flag = true
            count += 1
        } else if (r == 0 && flag == true) {
            if count > max {
                max = count
            }
            flag = false
            count = 0
        }
        
        if inte == 0 {
            break
        }
        
        inte = inte / 2
    }
    
    return max
}


/// 用0分解的解法
/// - Parameter num: 数字
/// - Returns: 数字的2进制连续为1的最大个数
func continuousMaxBitCountParseZero(_ num: Int) -> Int {
    let bitStr = String(num, radix: 2)
    let inputList = bitStr.split(separator: "0")
    let num =  inputList.max()
    let count = num?.count ?? 0
    return count
}


/// 动态规划解法
/// - Parameter num: 数字
/// - Returns: 数字的2进制连续为1的最大个数
func continuousMaxBitCount(_ num: Int) -> Int {
    let bitStr = String(num, radix: 2)
        
    dprint("🐣num \(num) 转化为二进制的bit数组为 \(bitStr)")
    
    let bitArr: [String] = bitStr.map { "\($0)" }
    
    let n = bitArr.count
    var dp: [Int] = [Int].init(repeating: 0, count: n + 1)
    var isZero: Bool = false
    
    var tempOneCount: Int = 0
    for (i, bit) in bitArr.enumerated() {
        if bit == "1" {
            tempOneCount += 1
            dprint("👛👝前下标为\(i), dp[\(i)] = \(dp[i])")
            if isZero {
                isZero = false
            } else {
                if tempOneCount > dp[i] {
                    dp[i] = max(dp[i] + 1, dp[i])
                }
            }
        } else {
            tempOneCount = 0
            isZero = true
        }
        
        dp[i + 1] = dp[i]
        dprint("👛🎒后下标为\(i), dp[\(i)] = \(dp[i]), dp[\(i + 1)] = \(dp[i + 1]), dp\(dp)🙊")
    }
    
    dprint("👑dp数组=\(dp), dp[n]=\(dp[n]) \n")
    
    return dp[n]
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let num = 134
    let result = continuousMaxBitCount(num)
    print(result)
} else {
    while let line = readLine(), let num = Int(line) {
        let result = continuousMaxBitCount(num)
        print(result)
    }
}

/// 全局打印,发布时不触发
///
/// - Parameters:
///   - msg: 需要打印的信息
///   - file: 所在的 "swift文件"
///   - line: 打印操作发生在哪一行
///   - fn: 所在文件的"方法名"
public func dprint<T>(_ msg: T,
              file: NSString = #file,
              line: Int = #line,
              fn: String = #function) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}

assert(continuousMaxBitCount(3) == 2)
assert(continuousMaxBitCount(5) == 1)
assert(continuousMaxBitCount(200) == 2)
assert(continuousMaxBitCount(122) == 4)
assert(continuousMaxBitCount(134) == 2)
assert(continuousMaxBitCount(137) == 1)
assert(continuousMaxBitCount(176) == 2)
assert(continuousMaxBitCount(218) == 2)

