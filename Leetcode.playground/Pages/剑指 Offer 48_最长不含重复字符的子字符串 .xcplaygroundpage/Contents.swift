/**
 https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/
 
 请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

  

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var chars: [Int] = [Int]()
        for c in s {
            if let val = c.asciiValue {
                chars.append(Int(val))
            }
        }
        if chars.isEmpty { return 0 }
        
        // 用来保存每一个字符上一次出现的位置
        var prevIdxes = [Int].init(repeating: -1, count: 128)
        prevIdxes[chars[0]] = 0
        // 以i - 1位置字符结尾的最长不重复字符串的开始索引（最左索引）
        var li = 0;
        var maxValue = 1
        for i in 1..<chars.count {
            // i位置字符上一次出现的位置
            let pi = prevIdxes[chars[i]]
            if li <= pi {
                li = pi + 1
            }
            // 存储这个字符出现的位置
            prevIdxes[chars[i]] = i
            // 求出最长不重复子串的长度
            maxValue = max(maxValue, i - li + 1)
        }
        return maxValue;
    }
}
