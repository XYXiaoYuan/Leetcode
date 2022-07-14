/**
 https://leetcode-cn.com/problems/missing-ranges/
 
 给定一个排序的整数数组 nums ，其中元素的范围在 闭区间 [lower, upper] 当中，返回不包含在数组中的缺失区间。

 示例：

 输入: nums = [0, 1, 3, 50, 75], lower = 0 和 upper = 99,
 输出: ["2", "4->49", "51->74", "76->99"]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/missing-ranges
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

public class _163_缺失的区间 {
    public init() {}
    
    public func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var numsVar = nums
        numsVar.append(upper + 1)
        let numbers = numsVar
        
        var result: [String] = [String]()
        
        var last = lower - 1
        for num in numbers {
            /// 比上一个数字中有缺失,需要添加在答案中的
            let start = last + 1
            if num - last > 2 {
                result.append("\(start)->\(num - 1)")
            } else if num - last == 2 {
                result.append("\(start)")
            }
            last = num
        }
            
        return result
    }
}

//let s = _163_缺失的区间()
//let result = s.findMissingRanges([0, 1, 3, 50, 75], 0, 99)
//print("\(s) --- \(result)")

//assert(s.findMissingRanges([0, 1, 3, 50, 75], 0, 99) == ["2", "4->49", "51->74", "76->99"])

