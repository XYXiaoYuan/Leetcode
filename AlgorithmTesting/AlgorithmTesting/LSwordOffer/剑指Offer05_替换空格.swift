/**
 https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/
 
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

  

 示例 1：

 输入：s = "We are happy."
 输出："We%20are%20happy."
  

 限制：

 0 <= s 的长度 <= 10000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer05_替换空格 {
//class Solution {
    public init() {}
    
    public func replaceSpace(_ s: String) -> String {

        var result: String = ""
        for val in s {
            let temp = String(val)
            switch temp {
            case " ":
                result.append("%20")
            default:
                result.append(temp)
            }
        }

        return result
    }
}
