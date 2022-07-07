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
import XCTest

public class _XXX生成二叉树 {
    //class Solution {
    public init() {}
    
    public func buildTree(_ pre: [Int], _ ins: [Int]) -> TreeNode? {
        if pre.isEmpty || ins.isEmpty || pre.count != ins.count {
            return nil
        }
        return f(pre: pre, L1: 0, R1: pre.count - 1, ins: ins, L2: 0, R2: ins.count - 1)
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
    private func f(pre: [Int], L1: Int, R1: Int, ins: [Int], L2: Int, R2: Int) -> TreeNode? {
        if L1 > R1 {
            return nil
        }
        let head = TreeNode(pre[L1])
        var find = L2
        while ins[find] != pre[L1] {
            find += 1
        }
        head.left = f(pre: pre, L1: L1 + 1, R1: L1 + find - L2, ins: ins, L2: L2, R2: find - 1)
        head.right = f(pre: pre, L1: L1 + find - L2 + 1, R1: R1, ins: ins, L2: find + 1, R2: R2)
        return head
    }
    
    /// 用字典优化
    public func buildTree1(_ pre: [Int], _ ins: [Int]) -> TreeNode? {
        if pre.isEmpty || ins.isEmpty || pre.count != ins.count {
            return nil
        }
        var valueIndexMap = [Int: Int]()
        for i in 0..<ins.count {
            valueIndexMap[i] = ins[i]
        }
        return g(pre: pre, L1: 0, R1: pre.count - 1, ins: ins, L2: 0, R2: ins.count - 1, valueIndexMap: valueIndexMap)
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
    private func g(pre: [Int], L1: Int, R1: Int, ins: [Int], L2: Int, R2: Int, valueIndexMap: [Int: Int]) -> TreeNode? {
        if L1 > R1 {
            return nil
        }
        let head = TreeNode(pre[L1])
        if L1 == R1 {
            return head
        }
        let find = valueIndexMap[pre[L1]] ?? L1
        head.left = g(pre: pre, L1: L1 + 1, R1: L1 + find - L2, ins: ins, L2: L2, R2: find - 1, valueIndexMap: valueIndexMap)
        head.right = g(pre: pre, L1: L1 + find - L2 + 1, R1: R1, ins: ins, L2: find + 1, R2: R2, valueIndexMap: valueIndexMap)
        return head
    }
}

extension _XXX生成二叉树 {
    class Test: XCTestCase {
        var s = _XXX生成二叉树()
        
        func testExample1() {

        }
                
        func testExample2() {

        }
        
        func testExample3() {

        }
    }
}

//do {
////    let s = _XXX生成二叉树()
//    
//    _XXX生成二叉树.Test.defaultTestSuite.run()
//}



//: [Next](@next)
