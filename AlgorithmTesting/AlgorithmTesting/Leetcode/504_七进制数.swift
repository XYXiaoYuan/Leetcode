/**
 https://leetcode-cn.com/problems/base-7/
 
 给定一个整数 num，将其转化为 7 进制，并以字符串形式输出。

  

 示例 1:

 输入: num = 100
 输出: "202"
 示例 2:

 输入: num = -7
 输出: "-10"
  

 提示：

 -107 <= num <= 107


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/base-7
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


public class _504_七进制数 {
//class Solution {
    public init() {}
    
    public func convertToBase7(_ num: Int) -> String {
        return String(num, radix: 7)
    }
}
