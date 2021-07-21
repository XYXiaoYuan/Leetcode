/**
 https://www.nowcoder.com/practice/7edf70f2d29c4b599693dc3aaeea1d31?tpId=196&&tqId=37072&rp=1&ru=/activity/oj&qru=/ta/job-code-total/question-ranking
 
 描述
 给定一个m x n大小的矩阵（m行，n列），按螺旋的顺序返回矩阵中的所有元素。
 示例1
 输入：
 [[1,2,3],[4,5,6],[7,8,9]]
 复制
 返回值：
 [1,2,3,6,9,8,7,4,5]
 复制

 */

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param matrix int整型二维数组
     * @return int整型一维数组
     */
    func spiralOrder ( _ matrix: [[Int]]) -> [Int] {
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
