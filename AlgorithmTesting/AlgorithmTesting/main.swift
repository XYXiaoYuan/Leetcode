/**
 https://leetcode.cn/problems/balanced-binary-tree/
 
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：true
 示例 2：


 输入：root = [1,2,2,3,3,null,null,4,4]
 输出：false
 示例 3：

 输入：root = []
 输出：true
  

 提示：

 树中的节点数在范围 [0, 5000] 内
 -104 <= Node.val <= 104


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/balanced-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class Solution {
    //class Solution {
    public init() {}
    
    private struct Info {
        /// 整棵树是否平衡
        var isBalanced: Bool
        /// 整棵树的高度
        var height: Int
    }
    
    public func isBalanced(_ root: TreeNode?) -> Bool {
        return process(root).isBalanced
    }
    
    private func process(_ x: TreeNode?) -> Info {
        guard let x = x else { return Info(isBalanced: true, height: 0) }
        
        let leftInfo = process(x.left)
        let rightInfo = process(x.right)
        let height = max(leftInfo.height, rightInfo.height) + 1
        let isBalanced = leftInfo.isBalanced && rightInfo.isBalanced && abs((leftInfo.height - rightInfo.height)) < 2
        return Info(isBalanced: isBalanced, height: height)
    }

}

//public extension Solution {
//    class Test: XCTestCase {
//        var s = Solution()
//
//        func testExample1() {
////            let node = TreeNode.arrayToNode([3,9,20,nil,nil,15,7])
////            let result = s.isBalanced(node)
////            print("\(s) --- \(result)")
////            let answer = true
////            XCTAssertEqual(result, answer)
//        }
//
//        func testExample2() {
////            let node = TreeNode.arrayToNode([1,2,2,3,3,nil,nil,4,4])
////            let result = s.isBalanced(node)
////            print("\(s) --- \(result)")
////            let answer = false
////            XCTAssertEqual(result, answer)
//        }
//
//        func testExample3() {
//            let node = TreeNode.arrayToNode([])
//            let result = s.isBalanced(node)
//            print("\(s) --- \(result)")
////            let answer = true
////            XCTAssertEqual(result, answer)
//        }
//
//    }
//}

do {
    let s = Solution()
    let node = TreeNode.arrayToNode([3,9,20,nil,nil,15,7])
    if let node = node {
        print(node)
    }

    let result = s.isBalanced(node)
    print("\(s) --- \(result)")

//    Solution.Test.defaultTestSuite.run()
}


//: [Next](@next)
