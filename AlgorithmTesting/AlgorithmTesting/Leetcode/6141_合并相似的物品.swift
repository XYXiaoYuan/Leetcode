/**
 https://leetcode.cn/problems/merge-similar-items/
 
 给你两个二维整数数组 items1 和 items2 ，表示两个物品集合。每个数组 items 有以下特质：

 items[i] = [valuei, weighti] 其中 valuei 表示第 i 件物品的 价值 ，weighti 表示第 i 件物品的 重量 。
 items 中每件物品的价值都是 唯一的 。
 请你返回一个二维数组 ret，其中 ret[i] = [valuei, weighti]， weighti 是所有价值为 valuei 物品的 重量之和 。

 注意：ret 应该按价值 升序 排序后返回。

  

 示例 1：

 输入：items1 = [[1,1],[4,5],[3,8]], items2 = [[3,1],[1,5]]
 输出：[[1,6],[3,9],[4,5]]
 解释：
 value = 1 的物品在 items1 中 weight = 1 ，在 items2 中 weight = 5 ，总重量为 1 + 5 = 6 。
 value = 3 的物品再 items1 中 weight = 8 ，在 items2 中 weight = 1 ，总重量为 8 + 1 = 9 。
 value = 4 的物品在 items1 中 weight = 5 ，总重量为 5 。
 所以，我们返回 [[1,6],[3,9],[4,5]] 。
 示例 2：

 输入：items1 = [[1,1],[3,2],[2,3]], items2 = [[2,1],[3,2],[1,3]]
 输出：[[1,4],[2,4],[3,4]]
 解释：
 value = 1 的物品在 items1 中 weight = 1 ，在 items2 中 weight = 3 ，总重量为 1 + 3 = 4 。
 value = 2 的物品在 items1 中 weight = 3 ，在 items2 中 weight = 1 ，总重量为 3 + 1 = 4 。
 value = 3 的物品在 items1 中 weight = 2 ，在 items2 中 weight = 2 ，总重量为 2 + 2 = 4 。
 所以，我们返回 [[1,4],[2,4],[3,4]] 。
 示例 3：

 输入：items1 = [[1,3],[2,2]], items2 = [[7,1],[2,2],[1,4]]
 输出：[[1,7],[2,4],[7,1]]
 解释：
 value = 1 的物品在 items1 中 weight = 3 ，在 items2 中 weight = 4 ，总重量为 3 + 4 = 7 。
 value = 2 的物品在 items1 中 weight = 2 ，在 items2 中 weight = 2 ，总重量为 2 + 2 = 4 。
 value = 7 的物品在 items2 中 weight = 1 ，总重量为 1 。
 所以，我们返回 [[1,7],[2,4],[7,1]] 。
  

 提示：

 1 <= items1.length, items2.length <= 1000
 items1[i].length == items2[i].length == 2
 1 <= valuei, weighti <= 1000
 items1 中每个 valuei 都是 唯一的 。
 items2 中每个 valuei 都是 唯一的 。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/merge-similar-items
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _6141_合并相似的物品 {
    //class Solution {
    public init() {}
    
    public func mergeSimilarItems(_ items1: [[Int]], _ items2: [[Int]]) -> [[Int]] {
        var dict = [Int: Int]()
        for item in items1 {
            let value = item[0]
            let weight = item[1]
            if let w = dict[value] {
                dict[value] = w + weight
            } else {
                dict[value] = weight
            }
        }
        
        for item in items2 {
            let value = item[0]
            let weight = item[1]
            if let w = dict[value] {
                dict[value] = w + weight
            } else {
                dict[value] = weight
            }
        }
        
        var res = [[Int]]()
        for (key, value) in dict.sorted(by: { (k1, k2) -> Bool in
            return k1.key < k2.key
        }) {
            res.append([key, value])
        }
        
        return res
    }
}

//extension _6141_合并相似的物品 {
//    public func test() {
//        let testTime = 10
//        var isSucceed = true
//        let letter = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
//        let minCount = 1
//        let maxCount = 100
//        let count = Int.random(in: minCount...maxCount)
//        for _ in 0..<testTime {
//            var s = ""
//            var goal = ""
//            for _ in 0..<count {
//                let sIndex = Int.random(in: 0..<letter.count)
//                s += letter[sIndex]
//
//                let goalIndex = Int.random(in: 0..<letter.count)
//                goal += letter[goalIndex]
//            }
//
//            /// 方法一
//            let result1 = rotateString0(s, goal)
//
//            /// 待验证的：方法二
//            let result2 = rotateString(s, goal)
//
//            if result1 != result2 {
//                isSucceed = false
//                print("s = \(s) --- goal = \(goal)")
//                break
//            }
//        }
//
//        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
//    }
//
//}

//do {
//    let s = _6141_合并相似的物品()
//    let result1 = s.mergeSimilarItems([[1,1],[4,5],[3,8]], [[3,1],[1,5]])
//    assert(result1 == [[1,6],[3,9],[4,5]])
//    print(result1)
//
//    let result2 = s.mergeSimilarItems([[1,1],[3,2],[2,3]], [[2,1],[3,2],[1,3]])
//    assert(result2 == [[1,4],[2,4],[3,4]])
//    print(result2)
//
//    let result3 = s.mergeSimilarItems([[1,3],[2,2]], [[7,1],[2,2],[1,4]])
//    assert(result3 == [[1,7],[2,4],[7,1]])
//    print(result3)
//
//    /// 对数器测试
////    s.test()
//}

//: [Next](@next)
