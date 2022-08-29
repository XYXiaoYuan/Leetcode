/**
 https://leetcode.cn/problems/validate-binary-search-tree/
 
 给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。

 有效 二叉搜索树定义如下：

 节点的左子树只包含 小于 当前节点的数。
 节点的右子树只包含 大于 当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
  

 示例 1：


 输入：root = [2,1,3]
 输出：true
 示例 2：


 输入：root = [5,1,4,null,null,3,6]
 输出：false
 解释：根节点的值是 5 ，但是右子节点的值是 4 。
  

 提示：

 树中节点数目范围在[1, 104] 内
 -231 <= Node.val <= 231 - 1


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/validate-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _98_验证二叉搜索树 {
    //class Solution {
    public init() {}
    
    public func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        var cur: TreeNode? = root
        var mostRight: TreeNode?
        
        var pre: Int?
        while cur != nil {
            mostRight = cur?.left
            if mostRight != nil {
                while mostRight?.right != nil, mostRight?.right !== cur {
                    mostRight = mostRight?.right
                }
                
                if mostRight?.right == nil {
                    mostRight?.right = cur
                    cur = cur?.left
                    continue
                } else {
                    mostRight?.right = nil
                }
            }
            
            if let pre = pre, let curValue = cur?.val, pre >= curValue {
                return false
            }
            
            pre = cur?.val ?? nil
            cur = cur?.right
        }
        return true
    }

    private struct Info {
        /// 整棵树是否平衡
        var isBST: Bool
        /// 树的最大值
        var maxVal: Int
        /// 树的最小值
        var minVal: Int
    }
    
    public func isValidBST1(_ root: TreeNode?) -> Bool {
        let info = process(root)
        return info?.isBST ?? true
    }
    
    private func process(_ x: TreeNode?) -> Info? {
        guard let x = x else { return nil }

        let leftInfo = process(x.left)
        let rightInfo = process(x.right)
        var maxVal = x.val
        var minVal = x.val
        
        if let leftInfo = leftInfo {
            maxVal = max(leftInfo.maxVal, maxVal)
            minVal = min(leftInfo.minVal, minVal)
        }
        if let rightInfo = rightInfo {
            maxVal = max(rightInfo.maxVal, maxVal)
            minVal = min(rightInfo.minVal, minVal)
        }
        
        /// 默认为true
//        var isBST = true
//        if leftInfo != nil && !(leftInfo?.isBST ?? true) {
//            isBST = false
//        }
//        if rightInfo != nil && !(rightInfo?.isBST ?? true) {
//            isBST = false
//        }
//
//        /// left Max < x right min > x
//        let leftMaxLessX = leftInfo == nil ? true : ((leftInfo?.maxVal ?? 0) < x.val)
//        let rightMinMoreX = rightInfo == nil ? true : ((rightInfo?.minVal ?? 0) > x.val)
//        if !(leftMaxLessX && rightMinMoreX) {
//            isBST = false
//        }
        /// 默认为false
        var isBST = false
        let leftIsBST = leftInfo == nil ? true : (leftInfo?.isBST ?? false)
        let rightIsBST = rightInfo == nil ? true : (rightInfo?.isBST ?? false)
        let leftMaxLessX = leftInfo == nil ? true : ((leftInfo?.maxVal ?? 0) < x.val)
        let rightMinMoreX = rightInfo == nil ? true : ((rightInfo?.minVal ?? 0) > x.val)
        if leftIsBST, rightIsBST, leftMaxLessX, rightMinMoreX {
            isBST = true
        }
        
        return Info(isBST: isBST, maxVal: maxVal, minVal: minVal)
    }

}

//public extension _98_验证二叉搜索树 {
//    class Test: XCTestCase {
//        var s = _98_验证二叉搜索树()
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
//            let result = s.isValidBST(node)
//            print("\(s) --- \(result)")
////            let answer = true
////            XCTAssertEqual(result, answer)
//        }
//
//    }
//}

//do {
//    var s = _98_验证二叉搜索树()
//    let node = TreeNode.arrayToNode([3,9,20,nil,nil,15,7])
//    let result = s.isBalanced(node)
//    print("\(s) --- \(result)")
//
//    _98_验证二叉搜索树.Test.defaultTestSuite.run()
//}



//: [Next](@next)
