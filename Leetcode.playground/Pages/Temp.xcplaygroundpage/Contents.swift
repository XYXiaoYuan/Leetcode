/**
 https://leetcode.cn/problems/path-sum-ii/
 
 给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

 叶子节点 是指没有子节点的节点。

  

 示例 1：


 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：[[5,4,11,2],[5,8,4,5]]
 示例 2：


 输入：root = [1,2,3], targetSum = 5
 输出：[]
 示例 3：

 输入：root = [1,2], targetSum = 0
 输出：[]
  

 提示：

 树中节点总数在范围 [0, 5000] 内
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/path-sum-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
import XCTest

public class _113_路径总和_II {
    //class Solution {
    public init() {}
    
    public func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var ans = [[Int]]()
        if root == nil {
            return ans
        }
        var paths = [Int]()
        var preSum = 0
        process(root, &paths, &preSum, targetSum, &ans)
        return ans
    }
    
    private func process(_ x: TreeNode?, _ paths: inout [Int], _ preSum: inout Int, _ targetSum: Int, _ ans: inout [[Int]]) {
        guard let x = x else { return }
        let val = x.val
        
        if x.left == nil && x.right == nil {
            if val + preSum == targetSum {
                paths.append(val)
                ans.append(copyPath(paths))
                paths.remove(at: paths.count - 1)
            }
            return
        }
        /// x是非叶子节点
        paths.append(val)
        preSum += val
        if x.left != nil {
            process(x.left, &paths, &preSum, targetSum, &ans)
        }
        if x.right != nil {
            process(x.right, &paths, &preSum, targetSum, &ans)
        }
        paths.remove(at: paths.count - 1)
    }
    
    private func copyPath(_ paths: [Int]) -> [Int] {
        var ans = [Int]()
        for num in paths {
            ans.append(num)
        }
        return ans
    }
}

public extension _113_路径总和_II {
    class Test: XCTestCase {
        var s = _113_路径总和_II()
        
        func testExample1() {
//            let node = TreeNode.arrayToNode([5,4,8,11,null,13,4,7,2,null,null,5,1])
//            let result = s.isBalanced(node, 22)
//            print("\(s) --- \(result)")
//            let answer = true
//            XCTAssertEqual(result, answer)
        }
                
        func testExample2() {
            let node = TreeNode.arrayToNode([1,2,3])
            let result = s.pathSum(node, 5)
            print("\(s) --- \(result)")
            let answer = [Int]()
//            XCTAssertEqual(result, answer)
        }
        
        func testExample3() {
            let node = TreeNode.arrayToNode([1,2])
            let result = s.pathSum(node, 0)
            print("\(s) --- \(result)")
            let answer = [Int]()
//            XCTAssertEqual(result, answer)
        }

    }
}

do {
//    var s = _113_路径总和_II()
//    let node = TreeNode.arrayToNode([5,4,8,11,null,13,4,7,2,null,null,null,1])
//    let result = s.isBalanced(node, 22)
//    print("\(s) --- \(result)")

    _113_路径总和_II.Test.defaultTestSuite.run()
}



//: [Next](@next)
