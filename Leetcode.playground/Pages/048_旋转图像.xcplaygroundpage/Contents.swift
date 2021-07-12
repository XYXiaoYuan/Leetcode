/**
 https://leetcode-cn.com/problems/rotate-image/
 
 给你一幅由 N × N 矩阵表示的图像，其中每个像素的大小为 4 字节。请你设计一种算法，将图像旋转 90 度。

 不占用额外内存空间能否做到？

  

 示例 1:

 给定 matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 示例 2:

 给定 matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-matrix-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func rotate1(_ matrix: inout [[Int]]) {
        matrix.reverse()
        for (i,row) in matrix.enumerated()  {
            for (j,_) in row.enumerated() where j >= i {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }
    
    func rotate2(_ matrix: inout [[Int]]) {
        let matrixCount: Int = matrix.count - 1
        for (i,row) in matrix.enumerated() where matrix.count/2 > i {
            for (j,_) in row.enumerated() {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[matrixCount - i][j]
                matrix[matrixCount - i][j] = temp
            }
        }
        
        for (i,row) in matrix.enumerated()  {
            for (j,_) in row.enumerated() where j >= i {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }
    
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<(n + 1)/2 {
//            print("下标i = \(i)")
            for j in 0..<n/2 {
//                print("下标j = \(j)")
                (matrix[i][j], matrix[j][n-1-i], matrix[n-1-i][n-1-j], matrix[n-1-j][i]) =
                    (matrix[n-1-j][i], matrix[i][j], matrix[j][n-1-i], matrix[n-1-i][n-1-j])
            }
        }
    }
}

let s = Solution()
var input1 = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
  ]
var input2 = [
    [ 5, 1, 9,11],
    [ 2, 4, 8,10],
    [13, 3, 6, 7],
    [15,14,12,16]
  ]
let result = s.rotate(&input1)
print(result)


/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

