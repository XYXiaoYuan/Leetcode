/**
 https://leetcode-cn.com/problems/binary-tree-paths/
 
 给定一个二叉树，返回所有从根节点到叶子节点的路径。

 说明: 叶子节点是指没有子节点的节点。

 示例:

 输入:

    1
  /   \
 2     3
  \
   5

 输出: ["1->2->5", "1->3"]

 解释: 所有根节点到叶子节点的路径为: 1->2->5, 1->3


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-paths
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        
        if root.left == nil && root.right == nil {
            return ["\(root.val)"]
        }
        
        let leftPath = binaryTreePaths(root.left).map { "\(root.val)->\($0)" }
        let rightPath = binaryTreePaths(root.right).map { "\(root.val)->\($0)" }
        
        return leftPath + rightPath
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

let s = Solution()
let node = TreeNode(1,
                    TreeNode(2,
                             nil,
                             TreeNode(5, nil, nil)),
                    TreeNode(3, nil, nil))
let result = s.binaryTreePaths(node)
print(result)

//assert(s.binaryTreePaths(node) == ["1->2->5", "1->3"])

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

