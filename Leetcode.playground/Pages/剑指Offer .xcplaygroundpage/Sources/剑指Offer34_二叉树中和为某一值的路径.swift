/**
 https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/
 
 输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。

  

 示例:
 给定如下二叉树，以及目标和 target = 22，

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \    / \
         7    2  5   1
 返回:

 [
    [5,4,11,2],
    [5,8,4,5]
 ]
  

 提示：

 节点总数 <= 10000
 注意：本题与主站 113 题相同：https://leetcode-cn.com/problems/path-sum-ii/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer34_二叉树中和为某一值的路径 {
//class Solution {
    public init() {}
    
    public func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var paths = [[Int]]()
        var path = [Int]()
        
        dfs(root, sum, &path, &paths)
        
        return paths
    }
    
    private func dfs(_ root: TreeNode?, _ sum: Int, _ path: inout [Int], _ paths: inout [[Int]]) {
        guard let root = root else {
            return
        }
        
        path.append(root.val)
        if root.left == nil && root.right == nil && sum == root.val {
            paths.append(path)
        } else {
            dfs(root.left, sum - root.val, &path, &paths)
            dfs(root.right, sum - root.val, &path, &paths)
        }
        path.removeLast()
    }
}
