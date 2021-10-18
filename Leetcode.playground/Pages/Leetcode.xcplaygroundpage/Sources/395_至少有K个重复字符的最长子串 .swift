//: [Previous](@previous)

import Foundation

/// https://leetcode-cn.com/problems/longest-substring-with-at-least-k-repeating-characters/

/**
 找到给定字符串（由小写字符组成）中的最长子串 T ， 要求 T 中的每一字符出现次数都不少于 k 。输出 T 的长度。

 示例 1:

 输入:
 s = "aaabb", k = 3

 输出:
 3

 最长子串为 "aaa" ，其中 'a' 重复了 3 次。
 示例 2:

 输入:
 s = "ababbc", k = 2

 输出:
 5

 最长子串为 "ababb" ，其中 'a' 重复了 2 次， 'b' 重复了 3 次。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-with-at-least-k-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

//public class _395_至少有K个重复字符的最长子串 {
//class Solution {
//public init () {}
//    public int longestSubstring(String s, int k) {
//        if (s.length() < k) return 0;
//        HashMap<Character, Integer> counter = new HashMap();
//        for (int i = 0; i < s.length(); i++) {
//            counter.put(s.charAt(i), counter.getOrDefault(s.charAt(i), 0) + 1);
//        }
//        for (char c : counter.keySet()) {
//            if (counter.get(c) < k) {
//                int res = 0;
//                for (String t : s.split(String.valueOf(c))) {
//                    res = Math.max(res, longestSubstring(t, k));
//                }
//                return res;
//            }
//        }
//        return s.length();
//    }
//}
//
//let s = Solution()
//let result = s.longestSubstring("aaabb", 3)
//print("结果result = \(result)")



//: [Next](@next)
