/**
 https://leetcode.cn/problems/path-crossing/solution/
 
 给你一个字符串 path，其中 path[i] 的值可以是 'N'、'S'、'E' 或者 'W'，分别表示向北、向南、向东、向西移动一个单位。

 你从二维平面上的原点 (0, 0) 处开始出发，按 path 所指示的路径行走。

 如果路径在任何位置上与自身相交，也就是走到之前已经走过的位置，请返回 true ；否则，返回 false 。

  

 示例 1：



 输入：path = "NES"
 输出：false
 解释：该路径没有在任何位置相交。
 示例 2：



 输入：path = "NESWW"
 输出：true
 解释：该路径经过原点两次。
  

 提示：

 1 <= path.length <= 104
 path[i] 为 'N'、'S'、'E' 或 'W'


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/path-crossing
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class Solution1 {
    //class Solution {
    public init() {}

    public func isPathCrossing(_ path: String) -> Bool {
        print("\(#function) 入参, path = \(path)")
        
        struct Path: Hashable {
            var x: Int
            var y: Int
        }
        
        let dirs: [String: Path] = [
            "N": Path(x: -1,  y:  0),
            "S": Path(x:  1,  y:  0),
            "W": Path(x:  0,  y: -1),
            "E": Path(x:  0,  y:  1),
        ]
        
        var point = Path(x: 0, y: 0)
        var vis: Set<Path> = [point]
        for ch in path.map({ String($0) }) {
            let dir = dirs[ch]
            if let dir = dir {
                point = Path(x: point.x + dir.x, y: point.y + dir.y)
                if vis.contains(point) {
                    return true
                }
                vis.insert(point)
            }
        }
        
        return false
    }

    public func isPathCrossing0(_ path: String) -> Bool {
        print("\(#function) 入参, path = \(path)")
        
        struct Path: Hashable {
            var x: Int
            var y: Int
        }
        
        let dirs: [String: Path] = [
            "N": Path(x: -1,  y:  0),
            "S": Path(x:  1,  y:  0),
            "W": Path(x:  0,  y: -1),
            "E": Path(x:  0,  y:  1),
        ]
        
        var point = Path(x: 0, y: 0)
        var vis: Set<Path> = [point]
        vis.insert(point)
        for ch in path.map({ String($0) }) {
            let dir = dirs[ch]
            point = Path(x: point.x + dir!.x, y: point.y + dir!.y)
            if vis.contains(point) {
                return true
            }
            vis.insert(point)
        }
        
        return false
    }
}

extension Solution1 {
    public func test() {
        
        let testTime = 10
        print("对数器开始工作, 执行 【\(testTime)】 次")
        var isSucceed = true
        for i in 0..<testTime {
            let max = 10//10000
            let directions = ["N", "E", "W", "S"]
            let count = Int.random(in: 1...max)
            var paths = String()
            for _ in 0..<count {
                let index = Int.random(in: 0..<directions.count)
                let t = directions[index]
                paths.append(t)
            }

            /// 方法一
            let result1 = isPathCrossing0(paths)

            let result2 = isPathCrossing(paths)

            if result1 != result2 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, paths = \(paths)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, paths = \(paths)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = Solution1()
//
//    let result1 = s.isPathCrossing("NES")
//    assert(result1 == false)
//    print(result1)
//
//    let result2 = s.isPathCrossing("NESWW")
//    assert(result2 == true)
//    print(result2)
//
//    s.test()
//}


//: [Next](@next)
