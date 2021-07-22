/**
 https://leetcode-cn.com/problems/perfect-number/
 
 对于一个 正整数，如果它和除了它自身以外的所有 正因子 之和相等，我们称它为 「完美数」。

 给定一个 整数 n， 如果是完美数，返回 true，否则返回 false

  

 示例 1：

 输入：28
 输出：True
 解释：28 = 1 + 2 + 4 + 7 + 14
 1, 2, 4, 7, 和 14 是 28 的所有正因子。
 示例 2：

 输入：num = 6
 输出：true
 示例 3：

 输入：num = 496
 输出：true
 示例 4：

 输入：num = 8128
 输出：true
 示例 5：

 输入：num = 2
 输出：false
  

 提示：

 1 <= num <= 108


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/perfect-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func checkPerfectNumber1(_ num: Int) -> Bool {
        if num == 1 {
            return false
        }
        
        var sum = 1
        var i = 2
        while i * i <= num {
            if num % i == 0 {
                sum += i
                if i * i != num {
                    sum += num / i
                }
            }
            
            i += 1
        }
                
        return num == sum
    }
    
    func checkPerfectNumber(_ num: Int) -> Bool {
        let primes = [2, 3, 5, 7, 13, 17, 19, 31]
        for prime in primes {
            if pn(prime) == num {
                return true
            }
        }
                
        return false
    }
    
    private func pn(_  p: Int) -> Int {
        return (1 << (p - 1)) * ((1 << p) - 1)
    }
}


let s = Solution()
let result = s.checkPerfectNumber(28)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

