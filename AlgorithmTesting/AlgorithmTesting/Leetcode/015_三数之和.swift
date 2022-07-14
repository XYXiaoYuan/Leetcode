/**
给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

注意：答案中不可以包含重复的三元组。

例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

满足要求的三元组集合为：
[
  [-1, 0, 1],
  [-1, -1, 2]
]
*/

import Foundation

public class _015_三数之和 {
//class Solution {
    public init() {}
    
    public func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        if nums.count < 3 {
            return res
        } else {
            let sorted: [Int] = nums.sorted {$0 < $1}
            var twoSum: Int
            let size: Int = sorted.count
            var i = 0
            while i < size - 2 {
                var l: Int = i + 1
                var r: Int = size - 1
                twoSum = 0 - sorted[i]
                while l < r {
                    if sorted[l] + sorted[r] < twoSum {
                        l += 1
                    } else if sorted[l] + sorted[r] == twoSum {
                        var three: [Int] = []
                        three.append(sorted[i])
                        three.append(sorted[l])
                        three.append(sorted[r])
                        res.append(three)
                        repeat {
                            l += 1
                        } while l < r && sorted[l-1] == sorted[l]
                        repeat {
                            r -= 1
                        } while l < r && sorted[r+1] == sorted[r]
                    } else {
                        r -= 1
                    }
                }
                repeat {
                    i += 1
                } while i < size - 1 && sorted[i-1] == sorted[i]
            }
            return res
        }
    }
}

//let s = _015_三数之和()
//let result = s.threeSum([-1, 0, 1, 2, -1, -4])
//print(result)

