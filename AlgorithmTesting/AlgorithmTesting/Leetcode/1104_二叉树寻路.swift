/**
 https://leetcode-cn.com/problems/path-in-zigzag-labelled-binary-tree/
 
 在一棵无限的二叉树上，每个节点都有两个子节点，树中的节点 逐行 依次按 “之” 字形进行标记。

 如下图所示，在奇数行（即，第一行、第三行、第五行……）中，按从左到右的顺序进行标记；

 而偶数行（即，第二行、第四行、第六行……）中，按从右到左的顺序进行标记。



 给你树上某一个节点的标号 label，请你返回从根节点到该标号为 label 节点的路径，该路径是由途经的节点标号所组成的。

  

 示例 1：

 输入：label = 14
 输出：[1,3,4,14]
 示例 2：

 输入：label = 26
 输出：[1,2,6,10,26]
  

 提示：

 1 <= label <= 10^6


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/path-in-zigzag-labelled-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Darwin

public class _1104_二叉树寻路 {
//class Solution {
    public init() {}

    public func pathInZigZagTree(_ label: Int) -> [Int] {
        var path: [Int] = [Int]()
        var label = label
        while label >= 1 {
            path.append(label)
            label = label / 2
            
            let depth = myLog(label)
            let range = getLevelRange(depth)
            /// 由于之字形分布，根据上层的节点取值范围，修正父节点
            label = range[1] - (label - range[0])
            
        }
        
        if path == [1] {
            return [1]
        }
        /// 反转成从根节点到目标节点的路径
        return [1] + path.reversed()
    }
    
    /// 获取第 n 层节点的取值范围
    private func getLevelRange(_ n: Int) -> [Int] {
        let p = Int(pow(Float(2.0), Float(n)))
        return [p, 2 * p - 1]
    }
    
    private func myLog(_ x: Int) -> Int {
        let value = log(Float(x))
        if value <= 0 {
            return -1
        }
        let depth = Int(value / log(Float(2.0)))
        return depth
    }
}


//let s = _1104_二叉树寻路()
//let result = s.pathInZigZagTree(26)
//print(result)

