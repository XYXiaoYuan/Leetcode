/**
 https://leetcode-cn.com/problems/three-steps-problem-lcci/
 
 三步问题。有个小孩正在上楼梯，楼梯有n阶台阶，小孩一次可以上1阶、2阶或3阶。实现一种方法，计算小孩有多少种上楼梯的方式。结果可能很大，你需要对结果模1000000007。

 示例1:

  输入：n = 3
  输出：4
  说明: 有四种走法
 示例2:

  输入：n = 5
  输出：13
 提示:

 n范围在[1, 1000000]之间


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/three-steps-problem-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func waysToStep(_ n: Int) -> Int {
        if n < 3 {
            return n
        }
        
        if n == 3 {
            return 4
        }
        
        var a = 1
        var b = 2
        var c = 4
        var temp = 0
        for _ in 4...n {
            temp = (a + b + c) % 1000000007
            a = b
            b = c
            c = temp
        }
        
        return c
    }
}
