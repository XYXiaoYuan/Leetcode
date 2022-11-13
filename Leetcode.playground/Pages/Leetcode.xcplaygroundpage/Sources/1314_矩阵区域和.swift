/**
 https://leetcode.cn/problems/matrix-block-sum/
 
 给你一个 m x n 的矩阵 mat 和一个整数 k ，请你返回一个矩阵 answer ，其中每个 answer[i][j] 是所有满足下述条件的元素 mat[r][c] 的和：

 i - k <= r <= i + k,
 j - k <= c <= j + k 且
 (r, c) 在矩阵内。
  

 示例 1：

 输入：mat = [[1,2,3],[4,5,6],[7,8,9]], k = 1
 输出：[[12,21,16],[27,45,33],[24,39,28]]
 示例 2：

 输入：mat = [[1,2,3],[4,5,6],[7,8,9]], k = 2
 输出：[[45,45,45],[45,45,45],[45,45,45]]
  

 提示：

 m == mat.length
 n == mat[i].length
 1 <= m, n, k <= 100
 1 <= mat[i][j] <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/matrix-block-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _1314_矩阵区域和 {
    //class Solution {
    public init() {}
    
    public func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
        let m = mat.count
        let n = mat[0].count
        let numMatrix = NumMatrix(mat)
        guard let numMatrix = numMatrix else { return [[Int]]() }

        var res = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                // 左上角的坐标
                let x1 = Swift.max(i - k, 0)
                let y1 = Swift.max(j - k, 0)
                // 右下角坐标
                let x2 = Swift.min(i + k, m - 1)
                let y2 = Swift.min(j + k, n - 1)
                
                res[i][j] = numMatrix.sumRegion(x1, y1, x2, y2)
            }
        }
        return res
    }
    
    class NumMatrix {
        // 定义：preSum[i][j] 记录 matrix 中子矩阵 [0, 0, i-1, j-1] 的元素和
        private var preSum: [[Int]]

        public init?(_ matrix: [[Int]]) {
            let m = matrix.count
            let n = matrix[0].count
            if m == 0 || n == 0 { return nil }
            // 构造前缀和矩阵
            preSum = [[Int]].init(repeating: [Int].init(repeating: 0, count: n + 1), count: m + 1)
            for i in 1...m {
                for j in 1...n {
                    // 计算每个矩阵 [0, 0, i, j] 的元素和
                    preSum[i][j] = preSum[i - 1][j] + preSum[i][j - 1] + matrix[i - 1][j - 1] - preSum[i - 1][j - 1]
                }
            }
        }

        // 计算子矩阵 [x1, y1, x2, y2] 的元素和
        public func sumRegion(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
            // 目标矩阵之和由四个相邻矩阵运算获得
            return preSum[x2 + 1][y2 + 1] - preSum[x1][y2 + 1] - preSum[x2 + 1][y1] + preSum[x1][y1]
        }
    }
}

//do {
//    let s = _1314_矩阵区域和()
//
//    let result1 = s.matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 1)
//    assert(result1 == [[12,21,16],[27,45,33],[24,39,28]])
//    print(result1)
//
//    let result2 = s.matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 2)
//    assert(result2 == [[45,45,45],[45,45,45],[45,45,45]])
//    print(result2)
//}


//: [Next](@next)
