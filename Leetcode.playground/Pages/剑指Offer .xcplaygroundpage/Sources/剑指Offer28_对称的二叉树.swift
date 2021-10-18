/**
 https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof/solution/
 
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3

  

 示例 1：

 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：

 输入：root = [1,2,2,null,3,null,3]
 输出：false
  

 限制：

 0 <= 节点个数 <= 1000

 注意：本题与主站 101 题相同：https://leetcode-cn.com/problems/symmetric-tree/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer28_对称的二叉树 {
//class Solution {
    public init() {}
    
    public func isSymmetric(_ root: TreeNode?) -> Bool {
        return root == nil ? true : recur(root?.left, root?.right)
    }
    
    private func recur(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil || left?.val != right?.val {
            return false
        }
        return recur(left?.left, right?.right) && recur(left?.right, right?.left)
    }
}
