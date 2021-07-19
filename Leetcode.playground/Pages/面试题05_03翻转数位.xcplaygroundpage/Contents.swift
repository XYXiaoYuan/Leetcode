/**
 https://leetcode-cn.com/problems/reverse-bits-lcci/
 
 
 给定一个32位整数 num，你可以将一个数位从0变为1。请编写一个程序，找出你能够获得的最长的一串1的长度。

 示例 1：

 输入: num = 1775(110111011112)
 输出: 8
 示例 2：

 输入: num = 7(01112)
 输出: 4


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-bits-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func reverseBits(_ num: Int) -> Int {
       var cur = 0
        var insert = 0
        var res = 1
        for i in 0..<32 {
            if ((num & (1 << i)) != 0) {
                cur += 1
                insert += 1
            } else {
                insert = cur + 1
                cur = 0
            }
            res = max(res, insert)
        }
        
        return res
    }
}
