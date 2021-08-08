/**
 https://leetcode-cn.com/problems/check-permutation-lcci/
 
 给定两个字符串 s1 和 s2，请编写一个程序，确定其中一个字符串的字符重新排列后，能否变成另一个字符串。

 示例 1：

 输入: s1 = "abc", s2 = "bca"
 输出: true
 示例 2：

 输入: s1 = "abc", s2 = "bad"
 输出: false
 说明：

 0 <= len(s1) <= 100
 0 <= len(s2) <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/check-permutation-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func CheckPermutation(_ s1: String, _ s2: String) -> Bool {
        let sum1 = s1.map { (val) -> Int in
            if let value = val.asciiValue {
                return Int(value)
            }
            return 0
        }
        let sum2 = s2.map { (val) -> Int in
            if let value = val.asciiValue {
                return Int(value)
            }
            return 0
        }
        return sum1.sorted() == sum2.sorted()
    }
}
