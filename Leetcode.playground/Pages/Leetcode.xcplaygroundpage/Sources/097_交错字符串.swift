/**
 https://leetcode-cn.com/problems/interleaving-string/
 
 给定三个字符串 s1、s2、s3，请你帮忙验证 s3 是否是由 s1 和 s2 交错 组成的。

 两个字符串 s 和 t 交错 的定义与过程如下，其中每个字符串都会被分割成若干 非空 子字符串：

 s = s1 + s2 + ... + sn
 t = t1 + t2 + ... + tm
 |n - m| <= 1
 交错 是 s1 + t1 + s2 + t2 + s3 + t3 + ... 或者 t1 + s1 + t2 + s2 + t3 + s3 + ...
 提示：a + b 意味着字符串 a 和 b 连接。

  

 示例 1：


 输入：s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 输出：true
 示例 2：

 输入：s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 输出：false
 示例 3：

 输入：s1 = "", s2 = "", s3 = ""
 输出：true


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/interleaving-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _097_交错字符串 {
//class Solution {
    public init() {}
    
    public func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        
        guard s3.count == (s1.count + s2.count) else { return false }
        
        var B = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
        
        for i in 0..<B.count {
            for j in 0..<B[0].count {
                let k = i+j-1
                if i == 0 && j == 0 {
                    B[i][j] = true
                } else if i == 0 {
                    B[i][j] = B[i][j-1] && (s2[j-1] == s3[k])
                } else if j == 0 {
                    B[i][j] = B[i-1][j] && (s1[i-1] == s3[k])
                } else {
                    let row = B[i][j-1] && (s2[j-1] == s3[k])
                    let col = B[i-1][j] && (s1[i-1] == s3[k])
                    B[i][j] = row || col
                }
            }
        }
        
        return B[s1.count][s2.count]
    }
}

extension String {
    subscript(_ i: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: i)])
    }
}
