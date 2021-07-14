/**
 https://leetcode-cn.com/problems/unique-length-3-palindromic-subsequences/
 
 给你一个字符串 s ，返回 s 中 长度为 3 的不同回文子序列 的个数。

 即便存在多种方法来构建相同的子序列，但相同的子序列只计数一次。

 回文 是正着读和反着读一样的字符串。

 子序列 是由原字符串删除其中部分字符（也可以不删除）且不改变剩余字符之间相对顺序形成的一个新字符串。

 例如，"ace" 是 "abcde" 的一个子序列。
  

 示例 1：

 输入：s = "aabca"
 输出：3
 解释：长度为 3 的 3 个回文子序列分别是：
 - "aba" ("aabca" 的子序列)
 - "aaa" ("aabca" 的子序列)
 - "aca" ("aabca" 的子序列)
 示例 2：

 输入：s = "adc"
 输出：0
 解释："adc" 不存在长度为 3 的回文子序列。
 示例 3：

 输入：s = "bbcbaba"
 输出：4
 解释：长度为 3 的 4 个回文子序列分别是：
 - "bbb" ("bbcbaba" 的子序列)
 - "bcb" ("bbcbaba" 的子序列)
 - "bab" ("bbcbaba" 的子序列)
 - "aba" ("bbcbaba" 的子序列)


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-length-3-palindromic-subsequences
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        let arrs: [String] = s.map { String($0) }
        
        let n = s.count
        var set: Set<String> = Set<String>()
        
        var alpha = [Int].init(repeating: 0, count: 26)
        for s in arrs {
            if let value = Character(s).asciiValue {
                let v = Int(value)
                alpha[v - 65] += 1
            }
        }
        
        for i in 0..<26 {
            if alpha[i] < 2 {
                continue
            } else {
                
            }
        }
        
        
        return set.count
    }
}

print(Character("a").asciiValue)
print(UnicodeScalar("a"))

let s = Solution()
let result = s.countPalindromicSubsequence("aabca")
print(result)

//assert(s.countPalindromicSubsequence("aabca") == 3)
//assert(s.countPalindromicSubsequence("adc") == 0)
//assert(s.countPalindromicSubsequence("bbcbaba") == 4)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

