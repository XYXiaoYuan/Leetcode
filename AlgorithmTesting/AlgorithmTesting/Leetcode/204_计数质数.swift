/**
 https://leetcode-cn.com/problems/count-primes/
 
 统计所有小于非负整数 n 的质数的数量。

  

 示例 1：

 输入：n = 10
 输出：4
 解释：小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
 示例 2：

 输入：n = 0
 输出：0
 示例 3：

 输入：n = 1
 输出：0
  

 提示：

 0 <= n <= 5 * 106


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/count-primes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _204_计数质数 {
//class Solution {
    public init() {}
    
    public func countPrimes(_ n: Int) -> Int {
        if n < 3 {
        return 0
      }

      var primes = [Int]()
      var isPrime = [Int](repeating: 1, count: n)
    
      for i in 2..<n {
        if isPrime[i] == 1 {
          primes.append(i)
        }
        var j = 0
        while j < primes.count && i * primes[j] < n {
          isPrime[i * primes[j]] = 0
          if i % primes[j] == 0 {
            break
          }
          j += 1
        }
      }
      return primes.count
    }
}
