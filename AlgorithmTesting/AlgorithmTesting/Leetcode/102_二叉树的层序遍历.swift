/**
 https://leetcode.cn/problems/binary-tree-zigzag-level-order-traversal/
 
 给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：[[3],[9,20],[15,7]]
 示例 2：

 输入：root = [1]
 输出：[[1]]
 示例 3：

 输入：root = []
 输出：[]
  

 提示：

 树中节点数目在范围 [0, 2000] 内
 -1000 <= Node.val <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/binary-tree-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _102_二叉树的层序遍历 {
    //class Solution {
    public init() {}
    
    public func levelOrder(_ root: TreeNode?) -> [[Int]] {
        let ans = [[Int]]()
        if root === nil {
            return ans
        }
        
        return ans
    }
    
}

//public extension _102_二叉树的层序遍历 {
//    class Test: XCTestCase {
//        var s = _102_二叉树的层序遍历()
//        
//        func testExample1() {
////            let node = TreeNode.arrayToNode([3,9,20,nil,nil,15,7])
////            let result = s.levelOrder(node)
////            print("\(s) --- \(result)")
////            let answer = [[3],[9,20],[15,7]]
////            XCTAssertEqual(result, answer)
//        }
//                
//        func testExample2() {
//            let node = TreeNode.arrayToNode([1])
//            let result = s.levelOrder(node)
//            print("\(s) --- \(result)")
////            let answer = [[1]]
////            XCTAssertEqual(result, answer)
//        }
//        
//        func testExample3() {
//            let node = TreeNode.arrayToNode([])
//            let result = s.levelOrder(node)
//            print("\(s) --- \(result)")
////            let answer = []
////            XCTAssertEqual(result, answer)
//        }
//
//    }
//}

//do {
//    let s = _102_二叉树的层序遍历()
//    let node = TreeNode.arrayToNode([3,9,20,nil,nil,15,7])
//    let result = s.levelOrder(node)
//    print("\(s) --- \(result)")
//
//    _102_二叉树的层序遍历.Test.defaultTestSuite.run()
//}



//: [Next](@next)
