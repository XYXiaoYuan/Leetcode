/**
 https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/
 
 给定一棵二叉搜索树，请找出其中第k大的节点。

  

 示例 1:

 输入: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 输出: 4
 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 4
  

 限制：

 1 ≤ k ≤ 二叉搜索树元素个数



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer54_二叉搜索树的第k大节点 {
//class Solution {
    public init() {}
    
    var res: Int = 0
    var k: Int = 0
    
    public func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        self.k = k
        dfs(root)
        return res
    }
    
    private func dfs(_ root: TreeNode?) {
        if root == nil {
            return
        }
        dfs(root?.right)
        if k == 0 {
            return
        }
        k -= 1
        if k == 0 {
            res = root?.val ?? 0
        }
        
        dfs(root?.left)
    }
}
