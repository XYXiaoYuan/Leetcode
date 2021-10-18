/**
 https://leetcode-cn.com/problems/shun-shi-zhen-da-yin-ju-zhen-lcof/
 
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

  

 示例 1：

 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：

 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
  

 限制：

 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shun-shi-zhen-da-yin-ju-zhen-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _剑指Offer29_顺时针打印矩阵 {
//class Solution {
    public init() {}
    
    public func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty { return [] }
        
        var result = [Int]()
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        var direction = 0
        
        while left <= right && top <= bottom {
            if direction == 0 {     // go RIGHT
                for i in left...right {
                    result.append(matrix[top][i])
                }
                top += 1
            } else if direction == 1 {      // go DOWN
                for i in top...bottom {
                    result.append(matrix[i][right])
                }
                right -= 1
            } else if direction == 2 {      // go LEFT
                for i in stride(from: right, through: left, by: -1) {
                    result.append(matrix[bottom][i])
                }
                bottom -= 1
            } else {        // go UP
                for i in stride(from: bottom, through: top, by: -1) {
                    result.append(matrix[i][left])
                }
                left += 1
            }
            direction = (direction + 1) % 4
        }
        
        return result
    }
}

//let s = _剑指Offer29_顺时针打印矩阵()
//let input1 = [[1,2,3],[4,5,6],[7,8,9]]
//let input2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
//let result = s.spiralOrder(input1)
//print(result)
//
//assert(s.spiralOrder(input1) == [1,2,3,6,9,8,7,4,5])
//assert(s.spiralOrder(input2) == [1,2,3,4,8,12,11,10,9,5,6,7])
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

