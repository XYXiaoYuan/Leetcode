/**
 https://leetcode.cn/problems/elimination-game/
 
 列表 arr 由在范围 [1, n] 中的所有整数组成，并按严格递增排序。请你对 arr 应用下述算法：

 从左到右，删除第一个数字，然后每隔一个数字删除一个，直到到达列表末尾。
 重复上面的步骤，但这次是从右到左。也就是，删除最右侧的数字，然后剩下的数字每隔一个删除一个。
 不断重复这两步，从左到右和从右到左交替进行，直到只剩下一个数字。
 给你整数 n ，返回 arr 最后剩下的数字。

  

 示例 1：

 输入：n = 9
 输出：6
 解释：
 arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
 arr = [2, 4, 6, 8]
 arr = [2, 6]
 arr = [6]
 示例 2：

 输入：n = 1
 输出：1
  

 提示：

 1 <= n <= 10的9次方


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/elimination-game
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _390_消除游戏 {
    public init() {}
    //class Solution class Solution {
    
    public func lastRemaining(_ n: Int) -> Int {
        var ltr = true
        var remain = n
        var step = 1
        var head = 1
        
        while remain > 1 {
            if ltr || remain % 2 == 1 {
                head = head + step
            }
            remain = remain / 2
            step  = step * 2
            ltr = !ltr
        }
        
        return head
    }
    
    public func lastRemaining1(_ n: Int) -> Int {
        return help(n, true)
    }
    
    private func help(_ n: Int, _ L2R: Bool) -> Int {
        // L2R = true 从左到右
        if n == 1 { // 最小子问题
            return 1
        }
        
        if L2R { // 左到右
            return 2 * help(n / 2, !L2R)
            //  1 2 3 4 5 6 7 8
            //    2   4   6   8
            // 2*(1   2   3   4)
        } else { // 右到左
            if n & 1 == 1 { // 奇数长度的情况
                return 2 * help(n / 2, !L2R)
                //  1 2 3 4 5 6 7
                //    2   4   6
                // 2*(1   2   3)
            } else { // 偶数长度的情况
                return 2 * help(n / 2, !L2R) - 1
                //    1 2 3 4 5 6 7 8
                //    1   3   5   7
                // 2*(1   2   3   4) - 1
            }
        }
    }
}

//do {
//    let s = _390_消除游戏()
//    let result = s.lastRemaining(9)
//    print(result)
//}

