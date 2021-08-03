/**
 https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/
 
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

  

 示例 1：

 输入: s = "abcdefg", k = 2
 输出: "cdefgab"
 示例 2：

 输入: s = "lrloseumgh", k = 6
 输出: "umghlrlose"
  

 限制：

 1 <= k < s.length <= 10000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func reverseLeftWords1(_ s: String, _ n: Int) -> String {
        return String(s.dropFirst(n)) + String(s.prefix(n))
    }

    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        let mid = s.index(s.startIndex, offsetBy: n)
        return String(s[mid..<s.endIndex] + s[s.startIndex..<mid])
    }
}
