/**
 https://leetcode-cn.com/problems/lexicographical-numbers/
 
 给定一个整数 n, 返回从 1 到 n 的字典顺序。

 例如，

 给定 n =1 3，返回 [1,10,11,12,13,2,3,4,5,6,7,8,9] 。

 请尽可能的优化算法的时间复杂度和空间复杂度。 输入的数据 n 小于等于 5,000,000。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lexicographical-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var result = [Int]()
       
        func helper(_ x: Int) {
            if x > n { return }
            result.append(x)
            helper(x * 10)
            if x % 10 < 9 {
                helper(x + 1)
            }
        }
        
        helper(1)
        return result
    }
}
