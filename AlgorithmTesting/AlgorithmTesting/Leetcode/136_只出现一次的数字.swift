/**
 https://leetcode-cn.com/problems/single-number/
 
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 说明：

 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:

 输入: [2,2,1]
 输出: 1
 示例 2:

 输入: [4,1,2,1,2]
 输出: 4


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/single-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _136_只出现一次的数字 {
//class Solution {
    public init() {}
    
    public func singleNumberDict(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var dict = [Int: Int]()
        for i in nums {
            dict.updateValue((dict[i] ?? 0) + 1, forKey: i)
        }
        
        for (key, value) in dict where value == 1 {
            return key
        }
        
        return 0
    }
    
    public func singleNumber(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var res = 0
        for num in nums {
            res ^= num
        }
        
        return res
    }
}

//let s = _136_只出现一次的数字()
//let input1 = [2,2,1]
//let input2 = [4,1,2,1,2]
//let result = s.singleNumber(input2)
//print(result)
//
//assert(s.singleNumber(input1) == 1)
//assert(s.singleNumber(input2) == 4)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}
//
