/**
 https://leetcode-cn.com/problems/binary-tree-right-side-view/
 
 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

 示例:

 输入: [1,2,3,null,5,null,4]
 输出: [1, 3, 4]
 解释:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-right-side-view
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        
        var queue: [TreeNode] = [TreeNode]()
        queue.append(node)
        
        var result = [Int]()
        while !queue.isEmpty {
            var count = queue.count - 1
            
            while count >= 0 {
                let node = queue.removeFirst()
                if count == 0 {
                    result.append(node.val)
                }
                
                if let leftChild = node.left {
                    queue.append(leftChild)
                }
                if let rightChild = node.right {
                    queue.append(rightChild)
                }
                count -= 1
            }
            
        }
        
        return result
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
let root = TreeNode(1,
                    TreeNode(2, nil, TreeNode(5, nil, nil)),
                    TreeNode(3, nil, TreeNode(4, nil, nil)))
let result = s.rightSideView(root)
print(result)

assert(s.rightSideView(root) == [1,3,4])
let root1 = TreeNode(1, nil, TreeNode(3, nil, nil))
assert(s.rightSideView(root1) == [1,3])

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

