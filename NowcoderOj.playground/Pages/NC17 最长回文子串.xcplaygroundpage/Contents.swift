/**
 https://www.nowcoder.com/practice/b4525d1d84934cf280439aeecc36f4af?tpId=188&&tqId=38608&rp=1&ru=/activity/oj&qru=/ta/job-code-high-week/question-ranking
 
 描述
 对于一个字符串，请设计一个高效算法，计算其中最长回文子串的长度。

 给定字符串A以及它的长度n，请返回最长回文子串的长度。

 示例1
 输入：
 "abc1234321ab",12
 复制
 返回值：
 7
 复制

 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param A string字符串
     * @param n int整型
     * @return int整型
     */
    func getLongestPalindrome ( _ s: String,  _ n: Int) -> Int {
        if s.count < 2 {
            return s
        }
        
        var low = 0
        var maxL = 0
        var count = 1
        let word = Array(s)
        for i in 0..<word.count - 1 {
            checkSubString(i,i,word,&low,&maxL)
            checkSubString(i,i+1,word, &low, &maxL)
        }
        return String(word[low..<low + maxL])
    }
    
    func checkSubString(_ i: Int, _ j: Int, _ s: [Character], _ low: inout Int, _ maxL: inout Int) {
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
