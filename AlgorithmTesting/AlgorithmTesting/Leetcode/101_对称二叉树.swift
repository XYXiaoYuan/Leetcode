/**
 https://leetcode.cn/problems/symmetric-tree/
 
 给你一个二叉树的根节点 root ， 检查它是否轴对称。

  

 示例 1：


 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：


 输入：root = [1,2,2,null,3,null,3]
 输出：false
  

 提示：

 树中节点数目在范围 [1, 1000] 内
 -100 <= Node.val <= 100
  

 进阶：你可以运用递归和迭代两种方法解决这个问题吗？



 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/symmetric-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _101_对称二叉树 {
    //class Solution {
    public init() {}
    
    public func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    
    private func isMirror(_ h1: TreeNode?, _ h2: TreeNode?) -> Bool {
        if h1 == nil && h2 == nil {
            return true
        }
        return h1?.val == h2?.val && isMirror(h1?.left, h2?.right) && isMirror(h1?.right, h2?.left)
    }
}

//extension _101_对称二叉树 {
//    class Test: XCTestCase {
//        var s = _101_对称二叉树()
//        
//        func testExample1() {
//
//        }
//                
//        func testExample2() {
//
//        }
//        
//        func testExample3() {
//
//        }
//    }
//}

//do {
////    let s = _101_对称二叉树()
//
//    _101_对称二叉树.Test.defaultTestSuite.run()
//}



//: [Next](@next)
