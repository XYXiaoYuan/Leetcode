/**
 https://leetcode-cn.com/problems/super-pow/
 
 你的任务是计算 ab 对 1337 取模，a 是一个正整数，b 是一个非常大的正整数且会以数组形式给出。

  

 示例 1：

 输入：a = 2, b = [3]
 输出：8
 示例 2：

 输入：a = 2, b = [1,0]
 输出：1024
 示例 3：

 输入：a = 1, b = [4,3,3,8,5,2]
 输出：1
 示例 4：

 输入：a = 2147483647, b = [2,0,0]
 输出：1198
  

 提示：

 1 <= a <= 231 - 1
 1 <= b.length <= 2000
 0 <= b[i] <= 9
 b 不含前导 0


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/super-pow
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _372_超级次方 {
//class Solution {
    public init() {}
    
    let base = 1337
    
    public func superPow(_ a: Int, _ b: [Int]) -> Int {
        if b.isEmpty {
            return 1
        }
        var b = b
        guard let last = b.last else { return 1 }
        b.removeLast()
        
        let part1 = mypow(a, last)
        let part2 = mypow(superPow(a, b), 10)
        
        // 每次乘法都要求模
        return (part1 * part2) % base
    }
    
    // 计算 a 的 k 次方然后与 base 求模的结果
    private func mypow(_ a: Int, _ k: Int) -> Int {
        // 对因子求模
        var a = a
        a %= base
        
        var res = 1
        for _ in 0..<k {
            // 这里有乘法，是潜在的溢出点
            res *= a;
            // 对乘法结果求模
            res %= base
        }
        
        return res
    }
}

//do {
//    let s = _372_超级次方()
//    let result = s.superPow(2, [3])
//    print(result)
//    assert(result == 8)
//}
//
//do {
//    let s = _372_超级次方()
//    let result = s.superPow(2, [1, 0])
//    print(result)
//    assert(result == 1024)
//}
//
//do {
//    let s = _372_超级次方()
//    let result = s.superPow(1, [4,3,3,8,5,2])
//    print(result)
//    assert(result == 1)
//}
//
//do {
//    let s = _372_超级次方()
//    let result = s.superPow(2147483647, [2, 0, 0])
//    print(result)
//    assert(result == 1198)
//}


