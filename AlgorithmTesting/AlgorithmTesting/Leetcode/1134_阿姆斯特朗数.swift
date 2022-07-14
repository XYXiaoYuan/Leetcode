/**
 https://leetcode-cn.com/problems/armstrong-number/
 
 假设存在一个 k 位数 N，其每一位上的数字的 k 次幂的总和也是 N，那么这个数是阿姆斯特朗数。

 给你一个正整数 N，让你来判定他是否是阿姆斯特朗数，是则返回 true，不是则返回 false。

  

 示例 1：

 输入：153
 输出：true
 示例：
 153 是一个 3 位数，且 153 = 1^3 + 5^3 + 3^3。
 示例 2：

 输入：123
 输出：false
 解释：
 123 是一个 3 位数，且 123 != 1^3 + 2^3 + 3^3 = 36。
  

 提示：

 1 <= N <= 10^8


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/armstrong-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _1134_阿姆斯特朗数 {
//class Solution {
    public init() {}
    
    public func isArmstrong(_ n: Int) -> Bool {
        let nums = "\(n)"
        
        var sum: Int = 0
        for c in nums {
            if let val = Int(String(c)) {
                sum += pow(val, nums.count)
            }
        }
                
        return sum == n
    }
    
    
    /// n的幂次方
    /// - Parameters:
    ///   - val: n
    ///   - count: 次方
    /// - Returns: 结果
    private func pow(_ val: Int, _ count:Int) -> Int {
        var temp = 1
        for _ in 0..<count {
            temp *= val
        }
        return temp
    }
    
    public func isArmstrong1(_ n: Int) -> Bool {
        let nums = itoa(n)
        let count = nums.count
        
        var sum: Int = 0
        for num in nums {
            var temp = 1
            for _ in 0..<count {
                temp *= num
            }
            sum += temp
        }
        
        return sum == n
    }
    
    /// 分解一个数的每位数
    /// - Parameter number: 传进来的数字
    /// - Returns: 一个数的 每位数 逆序数字数组
    func itoa(_ number: Int) -> [Int] {
        var n = number
        
        var result: [Int] = [Int]()
        while n >= 10 {
            result.append(n % 10)
            n /= 10
        }
        result.append(n)
        
        return result
    }
}

//let s = _1134_阿姆斯特朗数()
//let result = s.isArmstrong(153)
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

