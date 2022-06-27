/**
 https://leetcode-cn.com/problems/shu-zu-zhong-de-ni-xu-dui-lcof/
 
 在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

  

 示例 1:

 输入: [7,5,6,4]
 输出: 5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-de-ni-xu-dui-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _剑指Offer51_数组中的逆序对 {
//class Solution {
    public init() {}
    public func reversePairs(_ nums: [Int]) -> Int {
        let len = nums.count
        
        if len < 2 {
            return 0
        }
        
        var copy = [Int].init(repeating: 0, count: len)
        for i in 0..<len {
            copy[i] = nums[i]
        }
        
        var temp = [Int].init(repeating: 0, count: len)
        return reversePairs(&copy, 0, len - 1, &temp)
    }
    
    private func reversePairs(_ nums: inout [Int], _ left: Int, _ right: Int, _ temp: inout [Int]) -> Int {
        if left == right {
            return 0
        }
        
        let mid = left + (right - left) / 2
        let leftPairs = reversePairs(&nums, left, mid, &temp)
        let rightPairs = reversePairs(&nums, mid + 1, right, &temp)
        
        if nums[mid] <= nums[mid + 1] {
            return leftPairs + rightPairs
        }
        
        let crossPairs = merageAndCount(&nums, left, mid, right, &temp)
        return leftPairs + rightPairs + crossPairs
    }
    
    private func merageAndCount(_ nums: inout [Int], _ left: Int, _ mid: Int, _ right: Int, _ temp: inout [Int]) -> Int {
        for i in left...right {
            temp[i] = nums[i]
        }
        
        var i = left
        var j = mid + 1
        
        var count: Int = 0
        for k in left...right {
            
            if i == mid + 1 {
                nums[k] = temp[j]
                j += 1
            } else if j == right + 1 {
                nums[k] = temp[i]
                i += 1
            } else if temp[i] <= temp[j] {
                nums[k] = temp[i]
                i += 1
            } else {
                nums[k] = temp[j]
                j += 1
                count += mid - i + 1
            }
        }
        
        return count
    }
}

//let s = _剑指Offer51_数组中的逆序对()
//let result = s.reversePairs([7,5,6,4])
//print(result)
//
//assert(s.reversePairs([7,5,6,4]) == 5)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}
//
