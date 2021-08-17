/**
 https://leetcode-cn.com/problems/student-attendance-record-ii/
 
 可以用字符串表示一个学生的出勤记录，其中的每个字符用来标记当天的出勤情况（缺勤、迟到、到场）。记录中只含下面三种字符：
 'A'：Absent，缺勤
 'L'：Late，迟到
 'P'：Present，到场
 如果学生能够 同时 满足下面两个条件，则可以获得出勤奖励：

 按 总出勤 计，学生缺勤（'A'）严格 少于两天。
 学生 不会 存在 连续 3 天或 3 天以上的迟到（'L'）记录。
 给你一个整数 n ，表示出勤记录的长度（次数）。请你返回记录长度为 n 时，可能获得出勤奖励的记录情况 数量 。答案可能很大，所以返回对 109 + 7 取余 的结果。

  

 示例 1：

 输入：n = 2
 输出：8
 解释：
 有 8 种长度为 2 的记录将被视为可奖励：
 "PP" , "AP", "PA", "LP", "PL", "AL", "LA", "LL"
 只有"AA"不会被视为可奖励，因为缺勤次数为 2 次（需要少于 2 次）。
 示例 2：

 输入：n = 1
 输出：3
 示例 3：

 输入：n = 10101
 输出：183236316
  

 提示：

 1 <= n <= 105


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/student-attendance-record-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func checkRecord(_ n: Int) -> Int {
        let mod: Int64 = 1000000007

        var a010: Int64 = 1
        var a011: Int64 = 0, a012: Int64 = 0, a110: Int64 = 0, a111: Int64 = 0, a112: Int64 = 0
        
        for _ in 0..<n {
            let new_a010: Int64 = (a010 + a011 + a012) % mod
            let new_a011: Int64 = a010
            let new_a012: Int64 = a011
            let new_a110: Int64 = (a010 + a011 + a012 + a110 + a111 + a112) % mod
            let new_a111: Int64 = a110
            let new_a112: Int64 = a111
            
            a010 = new_a010
            a011 = new_a011
            a012 = new_a012
            a110 = new_a110
            a111 = new_a111
            a112 = new_a112
        }
        
        return Int((a010 + a011 + a012 + a110 + a111 + a112) % mod)
    }
    
    func checkRecord1(_ n: Int) -> Int {
        let mod: Int64 = 1000000007

        var f: [Int64] = [Int64].init(repeating: 0, count: n <= 5 ? 6 : n + 1)
        f[0] = 1
        f[1] = 2
        f[2] = 4
        f[3] = 7

        for i in 4..<n {
            f[i] = ((2 * f[i - 1] % mod) + (mod - f[i - 4])) % mod
        }

        var sum: Int64 = f[n]
        for i in 1..<n {
            sum += (f[i - 1] * f[n - i]) % mod
        }

        return Int(sum % mod)
    }
}


let s = Solution()
let result = s.checkRecord(2)
print(result)

assert(s.checkRecord(2) == 8)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

