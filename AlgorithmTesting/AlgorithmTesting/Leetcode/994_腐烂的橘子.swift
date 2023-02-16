/**
 https://leetcode.cn/problems/rotting-oranges/
 
 在给定的 m x n 网格 grid 中，每个单元格可以有以下三个值之一：

 值 0 代表空单元格；
 值 1 代表新鲜橘子；
 值 2 代表腐烂的橘子。
 每分钟，腐烂的橘子 周围 4 个方向上相邻 的新鲜橘子都会腐烂。

 返回 直到单元格中没有新鲜橘子为止所必须经过的最小分钟数。如果不可能，返回 -1 。

  

 示例 1：



 输入：grid = [[2,1,1],[1,1,0],[0,1,1]]
 输出：4
 示例 2：

 输入：grid = [[2,1,1],[0,1,1],[1,0,1]]
 输出：-1
 解释：左下角的橘子（第 2 行， 第 0 列）永远不会腐烂，因为腐烂只会发生在 4 个正向上。
 示例 3：

 输入：grid = [[0,2]]
 输出：0
 解释：因为 0 分钟时已经没有新鲜橘子了，所以答案就是 0 。
  

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 10
 grid[i][j] 仅为 0、1 或 2


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/rotting-oranges
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _994_腐烂的橘子 {
    //class Solution {
    public init() {}
    
    struct Direction: Equatable {
        var x: Int
        var y: Int
        
        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }
    
    static let directions = [
        Direction(x:  0, y:  1),
        Direction(x:  0, y: -1),
        Direction(x:  1, y:  0),
        Direction(x: -1, y:  0),
    ]

    public func orangesRotting(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let col = grid[0].count
        
        var rotten = [Direction]() /// 腐烂集合
        var fresh  = [Direction]() /// 新鲜集合
        for i in 0..<row {
            for j in 0..<col {
                if (grid[i][j] == 2) {
                    rotten.append(Direction(x: i, y: j))
                }
                if (grid[i][j] == 1) {
                    fresh.append(Direction(x: i, y: j))
                }
            }
        }

        var time = 0
        
        while !fresh.isEmpty {
            if rotten.isEmpty { return -1 }
            var tempRotten = [Direction]()
            for rd in rotten {
                for dd in Self.directions {
                    /// 即将腐烂的如果在新鲜的集合中，就将它腐烂
                    let temp = Direction(x: rd.x + dd.x, y: rd.y + dd.y)
                    if fresh.contains(temp) {
                        tempRotten.append(temp)
                    }
                }
            }
            rotten = tempRotten
                    
            /// 新鲜里剔除腐烂的
            fresh = fresh.filter({ !rotten.contains($0) })
            time += 1
        }
        
        return time
    }
}

extension _994_腐烂的橘子 {
    public func test() {
        
        let testTime = 100
        print("对数器开始工作, 执行 【\(testTime)】 次")
        var isSucceed = true
        let count = 10
        for i in 0..<testTime {
            let m = Int.random(in: 1...count)
            let n = Int.random(in: 1...count)

            var nums = [[Int]]()
            for _ in 0..<m {
                var temp = [Int]()
                for _ in 0..<n {
                    let t = Int.random(in: 0...2)
                    temp.append(t)
                }
                nums.append(temp)
            }
            
            /// 方法一
            let result1 = orangesRotting(nums)

            let result2 = orangesRotting(nums)

            if result1 != result2 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, num = \(nums)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, (\(m) * \(n)), num = \(nums), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = _994_腐烂的橘子()
//
//    let result1 = s.orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
//    assert(result1 == 4)
//    print(result1)
//
//    let result2 = s.orangesRotting([[2,1,1],[0,1,1],[1,0,1]])
//    assert(result2 == -1)
//    print(result2)
//
//    let result3 = s.orangesRotting([[0,2]])
//    assert(result3 == 0)
//    print(result3)
//
//    s.test()
//}


//: [Next](@next)
