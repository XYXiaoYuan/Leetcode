/**
 https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/
 
 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [20,9],
   [15,7]
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _剑指Offer32_III_从上到下打印二叉树III {
//class Solution {
    public init() {}
    
    public func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var res = [[Int]]()
        var ts = [TreeNode]()
        ts.append(root)
        
        while !ts.isEmpty {
            var ans = [Int]() //存放该层所有数值
            var temp = [TreeNode]()
            for tree in ts {
                ans.append(tree.val)
                if let left = tree.left {
                    temp.append(left)
                }
                if let right = tree.right {
                    temp.append(right)
                }
            }
            ts = temp
            res.append(ans)
        }
        return res.reversed()
    }
}

