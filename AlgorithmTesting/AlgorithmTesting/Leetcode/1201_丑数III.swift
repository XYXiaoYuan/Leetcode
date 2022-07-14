/**
 https://leetcode-cn.com/problems/ugly-number-iii/
 
 给你四个整数：n 、a 、b 、c ，请你设计一个算法来找出第 n 个丑数。

 丑数是可以被 a 或 b 或 c 整除的 正整数 。

  

 示例 1：

 输入：n = 3, a = 2, b = 3, c = 5
 输出：4
 解释：丑数序列为 2, 3, 4, 5, 6, 8, 9, 10... 其中第 3 个是 4。
 示例 2：

 输入：n = 4, a = 2, b = 3, c = 4
 输出：6
 解释：丑数序列为 2, 3, 4, 6, 8, 9, 10, 12... 其中第 4 个是 6。
 示例 3：

 输入：n = 5, a = 2, b = 11, c = 13
 输出：10
 解释：丑数序列为 2, 4, 6, 8, 10, 11, 12, 13... 其中第 5 个是 10。
 示例 4：

 输入：n = 1000000000, a = 2, b = 217983653, c = 336916467
 输出：1999999984
  

 提示：

 1 <= n, a, b, c <= 10^9
 1 <= a * b * c <= 10^18
 本题结果在 [1, 2 * 10^9] 的范围内


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ugly-number-iii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _1201_丑数III {
//class Solution {
    public init() {}
    
    private var dict = [Int: Int]()
    
    public func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        var i = min(a, min(b, c))
        var j = 2_000_000_000
        
        while i < j {
            let mid = i + (j - i) / 2
            if isEnough(n, a, b, c, mid) {
                j = mid
            } else {
                i = mid + 1
            }
        }
        
        return j
    }
    
    private func isEnough(_ n: Int, _ a: Int, _ b: Int, _ c: Int, _ mid: Int) -> Bool {
        let ab = mid / lcm(a, b)
        let ac = mid / lcm(a, c)
        let bc = mid / lcm(b, c)
        let abc = mid / lcm(a, lcm(b, c))
        let count = mid / a + mid / b + mid / c - ab - ac - bc + abc
        return n <= count
    }
    
    private func lcm(_ a: Int, _ b: Int) -> Int {
        if a == 0 { return b }
        return a * b / gcd(a, b)
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        if a == 0 { return b }
        return gcd(b % a, a)
    }
}

//let s = _1201_丑数III()
//let result = s.nthUglyNumber(3, 2, 3, 5)
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

