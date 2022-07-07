/**
 https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 
 给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。

  

 示例 1:


 输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 输出: [3,9,20,null,null,15,7]
 示例 2:

 输入: preorder = [-1], inorder = [-1]
 输出: [-1]
  

 提示:

 1 <= preorder.length <= 3000
 inorder.length == preorder.length
 -3000 <= preorder[i], inorder[i] <= 3000
 preorder 和 inorder 均 无重复 元素
 inorder 均出现在 preorder
 preorder 保证 为二叉树的前序遍历序列
 inorder 保证 为二叉树的中序遍历序列


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
import XCTest

public class _105_从前序与中序遍历序列构造二叉树 {
    //class Solution {
    public init() {}
    
    public func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty || preorder.count != inorder.count {
            return nil
        }
        return f(preorder: preorder, L1: 0, R1: preorder.count - 1, inorder: inorder, L2: 0, R2: inorder.count - 1)
    }
    
    /// 有一棵树，先序结果是pre[L1..R1]，中序结果是ins[L2...R2]
    /// - Parameters:
    ///   - pre: 先序数组
    ///   - L1: 先序数组L1
    ///   - R1: 先序数组R1
    ///   - ins: 中序数组
    ///   - L2: 中序数组L2
    ///   - R2: 中序数组R2
    /// - Returns: 请建出整棵树，返回头节点
    private func f(preorder: [Int], L1: Int, R1: Int, inorder: [Int], L2: Int, R2: Int) -> TreeNode? {
        if L1 > R1 {
            return nil
        }
        let head = TreeNode(preorder[L1])
        if L1 == R1 {
            return head
        }
        var find = L2
        while inorder[find] != preorder[L1] {
            find += 1
        }
        head.left = f(preorder: preorder, L1: L1 + 1, R1: L1 + find - L2, inorder: inorder, L2: L2, R2: find - 1)
        head.right = f(preorder: preorder, L1: L1 + find - L2 + 1, R1: R1, inorder: inorder, L2: find + 1, R2: R2)
        return head
    }
    
    /// 用字典优化
    public func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty || preorder.count != inorder.count {
            return nil
        }
        var valueIndexMap = [Int: Int]()
        for (i, num) in inorder.enumerated() {
            valueIndexMap[num] = i
        }
        return g(preorder: preorder, L1: 0, R1: preorder.count - 1, inorder: inorder, L2: 0, R2: inorder.count - 1, valueIndexMap: valueIndexMap)
    }
    
    /// 有一棵树，先序结果是pre[L1..R1]，中序结果是ins[L2...R2]
    /// - Parameters:
    ///   - pre: 先序数组
    ///   - L1: 先序数组L1
    ///   - R1: 先序数组R1
    ///   - ins: 中序数组
    ///   - L2: 中序数组L2
    ///   - R2: 中序数组R2
    ///     - valueIndexMap: 下标字典
    /// - Returns: 请建出整棵树，返回头节点
    private func g(preorder: [Int], L1: Int, R1: Int, inorder: [Int], L2: Int, R2: Int, valueIndexMap: [Int: Int]) -> TreeNode? {
        if L1 > R1 {
            return nil
        }
        let head = TreeNode(preorder[L1])
        if L1 == R1 {
            return head
        }
        let find = valueIndexMap[preorder[L1]] ?? L1
        head.left = g(preorder: preorder, L1: L1 + 1, R1: L1 + find - L2, inorder: inorder, L2: L2, R2: find - 1, valueIndexMap: valueIndexMap)
        head.right = g(preorder: preorder, L1: L1 + find - L2 + 1, R1: R1, inorder: inorder, L2: find + 1, R2: R2, valueIndexMap: valueIndexMap)
        return head
    }
}

extension _105_从前序与中序遍历序列构造二叉树 {
    class Test: XCTestCase {
        var s = _105_从前序与中序遍历序列构造二叉树()
        
        func testExample1() {
            let result = s.buildTree([3,9,20,15,7], [9,3,15,20,7])
            if let result = result {
                print("\(s) --- \(result)")
//                let answer = [3,9,20,null,null,15,7]
//                XCTAssertEqual(result, answer)
            }
        }
                
        func testExample2() {
            let result = s.buildTree([-1], [-1])
            if let result = result {
                print("\(s) --- \(result)")
//                let answer = [-1]
//                XCTAssertEqual(result, answer)
            }
        }
    }
}

//do {
//    let s = _105_从前序与中序遍历序列构造二叉树()
//    let result = s.buildTree1([3,9,20,15,7], [9,3,15,20,7])
//    if let result = result {
//        print("\(s) --- \(result)")
//    }
//
//    _105_从前序与中序遍历序列构造二叉树.Test.defaultTestSuite.run()
//}



//: [Next](@next)
