/**
 https://leetcode.cn/problems/cherry-pickup/
 
 一个N x N的网格(grid) 代表了一块樱桃地，每个格子由以下三种数字的一种来表示：

 0 表示这个格子是空的，所以你可以穿过它。
 1 表示这个格子里装着一个樱桃，你可以摘到樱桃然后穿过它。
 -1 表示这个格子里有荆棘，挡着你的路。
 你的任务是在遵守下列规则的情况下，尽可能的摘到最多樱桃：

 从位置 (0, 0) 出发，最后到达 (N-1, N-1) ，只能向下或向右走，并且只能穿越有效的格子（即只可以穿过值为0或者1的格子）；
 当到达 (N-1, N-1) 后，你要继续走，直到返回到 (0, 0) ，只能向上或向左走，并且只能穿越有效的格子；
 当你经过一个格子且这个格子包含一个樱桃时，你将摘到樱桃并且这个格子会变成空的（值变为0）；
 如果在 (0, 0) 和 (N-1, N-1) 之间不存在一条可经过的路径，则没有任何一个樱桃能被摘到。
 示例 1:

 输入: grid =
 [[0, 1, -1],
  [1, 0, -1],
  [1, 1,  1]]
 输出: 5
 解释：
 玩家从（0,0）点出发，经过了向下走，向下走，向右走，向右走，到达了点(2, 2)。
 在这趟单程中，总共摘到了4颗樱桃，矩阵变成了[[0,1,-1],[0,0,-1],[0,0,0]]。
 接着，这名玩家向左走，向上走，向上走，向左走，返回了起始点，又摘到了1颗樱桃。
 在旅程中，总共摘到了5颗樱桃，这是可以摘到的最大值了。
 说明:

 grid 是一个 N * N 的二维数组，N的取值范围是1 <= N <= 50。
 每一个 grid[i][j] 都是集合 {-1, 0, 1}其中的一个数。
 可以保证起点 grid[0][0] 和终点 grid[N-1][N-1] 的值都不会是 -1。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/cherry-pickup
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin

public class _741_摘樱桃 {
    //class Solution {
    public init() {}
    
    public func cherryPickup(_ grid: [[Int]]) -> Int {
        let n = grid.count
        
        let N = 50
        let INF = Int.min
        var f = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: N), count: N), count: 2 * N)

        for k in 0..<(2 * n) {
            for i1 in 0..<n {
                for i2 in 0..<n {
                    f[k][i1][i2] = INF
                }
            }
        }
        
        f[2][1][1] = grid[0][0]
        
        for k in 3..<(2 * n) {
            for i1 in 1..<n {
                for i2 in 1..<n {
                    let j1 = k - i1, j2 = k - i2
                    if j1 <= 0 || j1 > n || j2 <= 0 || j2 > n {
                        continue
                    }
                    
                    let A = grid[i1 - 1][j1 - 1], B = grid[i2 - 1][j2 - 1]
                    if A == -1 || B == -1 {
                        continue
                    }

                    let a = f[k - 1][i1 - 1][i2]
                    let b = f[k - 1][i1 - 1][i2 - 1]
                    let c = f[k - 1][i1][i2 - 1]
                    let d = f[k - 1][i1][i2];
                    
                    var t = max(a, b, c, d) + A
                    if i1 != i2 {
                        t += B
                    }
                    
//                    print("A = \(A), B = \(B), a = \(a), b = \(b), c = \(c), d = \(d), t = \(t), 设置前 f[\(k)][\(i1)][\(i2)] = \(f[k][i1][i2])")

                    f[k][i1][i2] = t
                    
//                    print("设置后 f[\(k)][\(i1)][\(i2)] = \(f[k][i1][i2])")
                }
            }
        }
                
        return f[2 * n][n][n] <= 0 ? 0 : f[2 * n][n][n]
    }
}

//public extension _741_摘樱桃 {
//    class Test: XCTestCase {
//        var s = _741_摘樱桃()
//
//        func testExample1() {
//            let grid = [[0, 1, -1],
//                        [1, 0, -1],
//                        [1, 1,  1]]
//            let result = s.cherryPickup(grid)
//            print("\(s) --- \(result)")
//            let answer = 5
//            XCTAssertEqual(result, answer)
//        }
//    }
//}

//do {
//    let s = _741_摘樱桃()
//    let grid = [[0, 1, -1],
//                [1, 0, -1],
//                [1, 1,  1]]
//    let result = s.cherryPickup(grid)
//    print("\(s) --- \(result)")
//
//}



//: [Next](@next)
