/**
 https://leetcode-cn.com/problems/longest-palindromic-substring/
 
 给你一个字符串 s，找到 s 中最长的回文子串。

  

 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
 示例 3：

 输入：s = "a"
 输出："a"
 示例 4：

 输入：s = "ac"
 输出："a"
  

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母（大写和/或小写）组成


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _005_最长回文子串 {
//class Solution {
    public init() {}
    
    public func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        
        var low = 0
        var maxL = 0
//        var count = 1
        let word = Array(s)
        for i in 0..<word.count - 1 {
            checkSubString(i,i,word,&low,&maxL)
            checkSubString(i,i+1,word, &low, &maxL)
        }
        return String(word[low..<low + maxL])
    }
    
    private func checkSubString(_ i: Int, _ j: Int, _ s: [Character],_ low: inout Int, _ maxL: inout Int) {
        var x = i
        var y = j
        while (x >= 0 && y < s.count && s[x] == s[y]) {
            x -= 1
            y += 1
        }
        
        if (maxL < y - x - 1) {
            low = x + 1
            maxL = y - x - 1
        }
    }
}
