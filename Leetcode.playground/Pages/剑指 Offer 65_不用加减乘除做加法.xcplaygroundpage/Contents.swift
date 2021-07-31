/**
 https://leetcode-cn.com/problems/bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof/
 
 写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。

  

 示例:

 输入: a = 1, b = 1
 输出: 2
  

 提示：

 a, b 均可能是负数或 0
 结果不会溢出 32 位整数


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func add(_ a: Int, _ b: Int) -> Int {
        if (a == 0 || b == 0) {
            return a ^ b
        }
        return add(a ^ b, (a & b) << 1)
    }
    
    func add1(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = a ^ b
            b = (a & b) << 1
            a = temp
        }
        return a
    }

}
