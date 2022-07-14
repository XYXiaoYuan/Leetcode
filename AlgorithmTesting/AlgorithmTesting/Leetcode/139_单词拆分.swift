/**
 https://leetcode-cn.com/problems/word-break/
 
 给定一个非空字符串 s 和一个包含非空单词的列表 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。

 说明：

 拆分时可以重复使用字典中的单词。
 你可以假设字典中没有重复的单词。
 示例 1：

 输入: s = "leetcode", wordDict = ["leet", "code"]
 输出: true
 解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。
 示例 2：

 输入: s = "applepenapple", wordDict = ["apple", "pen"]
 输出: true
 解释: 返回 true 因为 "applepenapple" 可以被拆分成 "apple pen apple"。
      注意你可以重复使用字典中的单词。
 示例 3：

 输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 输出: false


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-break
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

public class _139_单词拆分 {
//class Solution {
    public init() {}
    public func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let n = s.count
        var dp: [Bool] = [Bool].init(repeating: false, count: n + 1)
        dp[0] = true
        
        for i in 1..<dp.count {
            for word in wordDict where word.count <= i && dp[i - word.count] {
                let start = s.index(s.startIndex, offsetBy: i - word.count)
                let end = s.index(s.startIndex, offsetBy: i)
                let subS = s[start..<end]
                if subS == word {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[n]
    }
    
}
