/**
 https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/
 
 输入某二叉树的前序遍历和中序遍历的结果，请构建该二叉树并返回其根节点。

 假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

  

 示例 1:


 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 示例 2:

 Input: preorder = [-1], inorder = [-1]
 Output: [-1]
  

 限制：

 0 <= 节点个数 <= 5000

  

 注意：本题与主站 105 题重复：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer07_重建二叉树 {
//class Solution {
    public init() {}
    
    public func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        
        //构建二叉树根结点
        let root: TreeNode? = TreeNode.init(preorder[0])
        
        //对中序序列进行遍历
        for (index, num) in inorder.enumerated() {
            // 如果找到根节点
            if num == preorder[0] {
                root?.left = buildTree(
                    Array(preorder[1..<index+1]),
                    Array(inorder[0..<index])
                )
                root?.right = buildTree(
                    Array(preorder[index+1..<preorder.endIndex]),
                    Array(inorder[index+1..<inorder.endIndex])
                )
            }
        }
        
        return root
        
    }
}
