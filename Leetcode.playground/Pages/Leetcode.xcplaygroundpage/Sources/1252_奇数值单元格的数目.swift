/**
 https://leetcode.cn/problems/cells-with-odd-values-in-a-matrix/
 
 给你一个 m x n 的矩阵，最开始的时候，每个单元格中的值都是 0。

 另有一个二维索引数组 indices，indices[i] = [ri, ci] 指向矩阵中的某个位置，其中 ri 和 ci 分别表示指定的行和列（从 0 开始编号）。

 对 indices[i] 所指向的每个位置，应同时执行下述增量操作：

 ri 行上的所有单元格，加 1 。
 ci 列上的所有单元格，加 1 。
 给你 m、n 和 indices 。请你在执行完所有 indices 指定的增量操作后，返回矩阵中 奇数值单元格 的数目。

  

 示例 1：



 输入：m = 2, n = 3, indices = [[0,1],[1,1]]
 输出：6
 解释：最开始的矩阵是 [[0,0,0],[0,0,0]]。
 第一次增量操作后得到 [[1,2,1],[0,1,0]]。
 最后的矩阵是 [[1,3,1],[1,3,1]]，里面有 6 个奇数。
 示例 2：



 输入：m = 2, n = 2, indices = [[1,1],[0,0]]
 输出：0
 解释：最后的矩阵是 [[2,2],[2,2]]，里面没有奇数。
  

 提示：

 1 <= m, n <= 50
 1 <= indices.length <= 100
 0 <= ri < m
 0 <= ci < n
  

 进阶：你可以设计一个时间复杂度为 O(n + m + indices.length) 且仅用 O(n + m) 额外空间的算法来解决此问题吗？



 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/cells-with-odd-values-in-a-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin

public class _1252_奇数值单元格的数目 {
    //class Solution {
    public init() {}
    
//    public func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
//        let r = [Bool].init(repeating: false, count: m)
//        let c = [Bool].init(repeating: false, count: n)
//        var a = 0, b = 0
//        for info in indices {
//            let ri = info[0], ci = info[1]
//            a += (r[ri] == !r[ri]) ? 1 : -1
//            b += (c[ci] == !c[ci]) ? 1 : -1
//        }
//        return a * (n - b) + (m - a) * b
//    }
    
    public func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var c1: Int = 0, c2: Int = 0
        for info in indices {
            c1 ^= 1 << info[0]
            c2 ^= 1 << info[1]
        }
        
        var a = 0, b = 0
        for i in 0..<m {
            a += ((c1 >> i) & 1)
        }
        for i in 0..<n {
            b += ((c2 >> i) & 1)
        }
        return a * (n - b) + (m - a) * b
    }
    
    public func oddCells2(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var numbers = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        for item in indices {
            let ri = item[0], ci = item[1]
            for j in 0..<numbers[ri].count {
                numbers[ri][j] += 1
            }
            for k in 0..<numbers.count {
                numbers[k][ci] += 1
            }
        }
                
        return numbers.flatMap({$0}).filter({$0 % 2 != 0}).count
    }
    
    public func oddCells1(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var numbers = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        for item in indices {
            let ri = item[0], ci = item[1]
            for (j1, num) in numbers.enumerated() {
                for j2 in 0..<num.count {
                    if j1 == ri {
                        numbers[j1][j2] += 1
                    }
                    if j2 == ci {
                        numbers[j1][j2] += 1
                    }
                }
            }
        }
                
        var res = 0
        for outer in numbers {
            for inner in outer {
                if inner % 2 == 1 {
                    res += 1
                }
            }
        }
        
        return res
    }
}

extension _1252_奇数值单元格的数目 {
    public func test() {
        let testTime = 10
        let m = Int.random(in: 1...50)
        let n = Int.random(in: 1...50)
        let indicesLength = Int.random(in: 1...100)
        var isSucceed = true
        for _ in 0..<testTime {
            var indices = [[Int]]()
            for _ in 0..<indicesLength {
                let first = Int.random(in: 0..<m)
                let last = Int.random(in: 0..<n)
                indices.append([first, last])
            }
            
            /// 方法一
            let result = oddCells1(m, n, indices)

            /// 待验证的：方法二
            let result2 = oddCells(m, n, indices)
            let result3 = oddCells2(m, n, indices)
            
            if result != result2 || result != result3 {
                isSucceed = false
                print("m = \(m), n = \(n), indices = \(indices)")
                break
            }
        }
        
        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _1252_奇数值单元格的数目()
//    let result = s.oddCells(2, 3, [[0,1],[0,0]])
//    print("\(s) --- \(result)")
//
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
