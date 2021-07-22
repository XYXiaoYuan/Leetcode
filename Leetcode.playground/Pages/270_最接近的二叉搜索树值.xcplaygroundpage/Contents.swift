/**
 https://leetcode-cn.com/problems/closest-binary-search-tree-value/
 
 给定一个不为空的二叉搜索树和一个目标值 target，请在该二叉搜索树中找到最接近目标值 target 的数值。

 注意：

 给定的目标值 target 是一个浮点数
 题目保证在该二叉搜索树中只会存在一个最接近目标值的数
 示例：

 输入: root = [4,2,5,1,3]，目标值 target = 3.714286

     4
    / \
   2   5
  / \
 1   3

 输出: 4


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/closest-binary-search-tree-value
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var root = root
        
        var val: Int = 0
        var closest = root?.val ?? 0
        
        while root != nil {
            // 更新当前值
            val = root?.val ?? 0
            // 如果当前差值比之前的最小差值还要小，更新closest
            closest = abs(Double(val) - target) < abs(Double(closest) - target) ? val : closest
            // target小于当前值，遍历左子树，否则遍历右子树
            root = target < Double(val) ? root?.left : root?.right
        }
        
        return closest
    }
}
