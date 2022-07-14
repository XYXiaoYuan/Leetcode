//: [Previous](@previous)

/// https://leetcode-cn.com/problems/contains-duplicate/

/**
 给定一个整数数组，判断是否存在重复元素。

 如果存在一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false 。

  

 示例 1:

 输入: [1,2,3,1]
 输出: true
 示例 2:

 输入: [1,2,3,4]
 输出: false
 示例 3:

 输入: [1,1,1,3,3,4,3,2,4,2]
 输出: true


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/contains-duplicate
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _217_存在重复元素 {
//class Solution {
    public init() {}
    
    public func containsDuplicate2(_ nums: [Int]) -> Bool {
        var dict = [Int: Bool]()
        
        for num in nums {
            if let _ = dict[num] {
                return true
            } else {
                dict[num] = true
            }
        }
        
        return false
    }

    
    public func containsDuplicate(_ nums: [Int]) -> Bool {
        let sortNums = nums.sorted()
        for i in 1..<sortNums.count {
            if sortNums[i] == sortNums[i - 1] {
                return true
            }
        }
        
        return false
    }
    
    public func containsDuplicate1(_ nums: [Int]) -> Bool {
        var set: Set<Int> = Set<Int>()
        for i in nums {
            if set.contains(i) {
                return true
            }
            set.insert(i)
        }
        
        return false
    }
}

//let s = _217_存在重复元素()
//let result = s.containsDuplicate([1])
//print("结果result = \(result)")


//: [Next](@next)
