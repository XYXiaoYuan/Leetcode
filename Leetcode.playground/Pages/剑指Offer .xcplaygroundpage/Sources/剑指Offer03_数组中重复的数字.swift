/**
 https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
 
 找出数组中重复的数字。


 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

 示例 1：

 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

public class _剑指Offer03_数组中重复的数字 {
//class Solution {
    public init() {}
    
    public func findRepeatNumber1(_ nums: [Int]) -> Int {
        var set: Set<Int> = Set<Int>()
        for i in nums {
            if set.contains(i) {
                return i
            }
            set.insert(i)
        }
        
        return 0
    }
    
    public func findRepeatNumber2(_ nums: [Int]) -> Int {
        let sortNums = nums.sorted()
        for i in 1..<sortNums.count {
            if sortNums[i] == sortNums[i - 1] {
                return sortNums[i]
            }
        }
        
        return 0
    }
    
    public func findRepeatNumber(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [Int: Int]()
        for num in nums {
            if let _ = dict[num] {
                return num
            } else {
                dict[num] = 1
            }
        }
        
        return 0
    }
}

//let s = _剑指Offer03_数组中重复的数字()
//let result = s.findRepeatNumber([2, 3, 1, 0, 2, 5, 3])
//print(result)
//
//assert(s.findRepeatNumber([2, 3, 1, 0, 2, 5, 3]) == 2)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

