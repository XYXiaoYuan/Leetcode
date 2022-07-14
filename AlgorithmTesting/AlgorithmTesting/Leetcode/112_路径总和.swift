/**
 https://leetcode.cn/problems/path-sum/
 
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum 。判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。如果存在，返回 true ；否则，返回 false 。

 叶子节点 是指没有子节点的节点。

  

 示例 1：


 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 输出：true
 解释：等于目标和的根节点到叶节点路径如上图所示。
 示例 2：


 输入：root = [1,2,3], targetSum = 5
 输出：false
 解释：树中存在两条根节点到叶子节点的路径：
 (1 --> 2): 和为 3
 (1 --> 3): 和为 4
 不存在 sum = 5 的根节点到叶子节点的路径。
 示例 3：

 输入：root = [], targetSum = 0
 输出：false
 解释：由于树是空的，所以不存在根节点到叶子节点的路径。
  

 提示：

 树中节点的数目在范围 [0, 5000] 内
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _112_路径总和 {
    //class Solution {
    public init() {}
    
    static var isSum = false
    public func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        Self.isSum = false
        var preSum = 0
        Self.process(root, &preSum, targetSum)
        return Self.isSum
    }
    
    private static func process(_ x: TreeNode?, _ preSum: inout Int, _ sum: Int) {
        if x?.left == nil && x?.right == nil {
            if (x?.val ?? 0) + preSum == sum {
                Self.isSum = true
            }
            return
        }
        /// x是非叶子节点
        preSum += (x?.val ?? 0)
        if x?.left != nil {
            process(x?.left, &preSum, sum)
        }
        if x?.right != nil {
            process(x?.right, &preSum, sum)
        }
    }
}

//public extension _112_路径总和 {
//    class Test: XCTestCase {
//        var s = _112_路径总和()
//        
//        func testExample1() {
////            let node = TreeNode.arrayToNode([5,4,8,11,null,13,4,7,2,null,null,null,1])
////            let result = s.isBalanced(node, 22)
////            print("\(s) --- \(result)")
////            let answer = true
////            XCTAssertEqual(result, answer)
//        }
//                
//        func testExample2() {
//            let node = TreeNode.arrayToNode([1,2,3])
//            let result = s.hasPathSum(node, 5)
//            print("\(s) --- \(result)")
//            let answer = false
//            XCTAssertEqual(result, answer)
//        }
//        
//        func testExample3() {
//            let node = TreeNode.arrayToNode([])
//            let result = s.hasPathSum(node, 0)
//            print("\(s) --- \(result)")
//            let answer = false
//            XCTAssertEqual(result, answer)
//        }
//
//    }
//}

//do {
//    let node = TreeNode.arrayToNode([5,4,8,11,null,13,4,7,2,null,null,null,1])
//    let result = s.isBalanced(node, 22)
//    print("\(s) --- \(result)")
//
//    _112_路径总和.Test.defaultTestSuite.run()
//}



//: [Next](@next)
