/**
 https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
 
 给定一个已按照 升序排列  的整数数组 numbers ，请你从数组中找出两个数满足相加之和等于目标数 target 。

 函数应该以长度为 2 的整数数组的形式返回这两个数的下标值。numbers 的下标 从 1 开始计数 ，所以答案数组应当满足 1 <= answer[0] < answer[1] <= numbers.length 。

 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。

  
 示例 1：

 输入：numbers = [2,7,11,15], target = 9
 输出：[1,2]
 解释：2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
 示例 2：

 输入：numbers = [2,3,4], target = 6
 输出：[1,3]
 示例 3：

 输入：numbers = [-1,0], target = -1
 输出：[1,2]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

public class _167_两数之和_II_输入有序数组 {
//class Solution {
    public init() {}
    
    public func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [Int: Int]()
        
        for (index, num) in numbers.enumerated() {
            let second = target - num
            if let val = dict[second]  {
                return [val, index + 1]
            } else {
                dict[num] = index + 1
            }
        }
        
        return [Int]()
    }
}

//let s = _167_两数之和_II_输入有序数组()
//let result = s.twoSum([2,7,11,15], 9)
//print(result)
//
//assert(s.twoSum([2,7,11,15], 9) == [1, 2])
//assert(s.twoSum([2,3,4], 6) == [1, 3])
//assert(s.twoSum([-1,0], -1) == [1, 2])
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

