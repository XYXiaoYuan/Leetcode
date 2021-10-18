/**
 https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/
 
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。

  

 示例 1:

 给定二叉树 [3,9,20,null,null,15,7]

     3
    / \
   9  20
     /  \
    15   7
 返回 true 。

 示例 2:

 给定二叉树 [1,2,2,3,3,null,null,4,4]

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 返回 false 。

  

 限制：

 0 <= 树的结点个数 <= 10000
 注意：本题与主站 110 题相同：https://leetcode-cn.com/problems/balanced-binary-tree/

  



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer55_II_平衡二叉树 {
//class Solution {
    public init() {}
    
    public func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        } else {
            let heightDelta: Int = height(root?.left) - height(root?.right)
            return abs(heightDelta) <= 1 &&
                isBalanced(root?.left) &&
                isBalanced(root?.right)
        }
    }

    private func height(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(height(root?.left), height(root?.right)) + 1
    }
}

public class __剑指Offer55_II_平衡二叉树2 {
//class Solution2 {
    public init() {}
    
    public func isBalanced(_ root: TreeNode?) -> Bool {
        return height(root) >= 0
    }

    private func height(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftHeight = height(root?.left)
        let rightHeight = height(root?.right)
        if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return max(leftHeight, rightHeight) + 1
    }
}
