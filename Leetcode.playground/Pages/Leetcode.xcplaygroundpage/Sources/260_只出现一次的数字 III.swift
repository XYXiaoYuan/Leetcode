/**
 https://leetcode-cn.com/problems/single-number-iii/
 
 给定一个整数数组 nums，其中恰好有两个元素只出现一次，其余所有元素均出现两次。 找出只出现一次的那两个元素。你可以按 任意顺序 返回答案。

  

 进阶：你的算法应该具有线性时间复杂度。你能否仅使用常数空间复杂度来实现？

  

 示例 1：

 输入：nums = [1,2,1,3,2,5]
 输出：[3,5]
 解释：[5, 3] 也是有效的答案。
 示例 2：

 输入：nums = [-1,0]
 输出：[-1,0]
 示例 3：

 输入：nums = [0,1]
 输出：[1,0]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/single-number-iii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _260_只出现一次的数字III {
//class Solution {
    public init() {}
    
    public func singleNumber(_ nums: [Int]) -> [Int] {
        var dict = [Int : Int]()
        var result = [Int]()
        
        for num in nums {
            dict[num] = dict[num, default: 0] + 1
        }
        
        for num in nums {
            if dict[num] == 1 { result.append(num) }
        }
        
        return result
    }
    
    public func singleNumber1(_ nums: [Int]) -> [Int] {
        if nums.count <= 2 {
            return nums
        }
        
        // get num1 ^ num2
        var resultExclusiveOR = 0
        for num in nums {
            resultExclusiveOR ^= num
        }
        
        let indexOf1 = findFirstBitIs1(&resultExclusiveOR)
        
        var num1 = 0
        var num2 = 0
        
        for val in nums {
            if isBit1(val, indexOf1) {
                num1 ^= val
            } else {
                num2 ^= val
            }
        }
        
        return [num1, num2]
    }
    
    private func findFirstBitIs1(_ num: inout Int) -> Int {
        var indexBit = 0
        while num & 1 == 0 && indexBit < 32 {
            num = num >> 1
            indexBit += 1
        }
        return indexBit
    }
    
    private func isBit1(_ val: Int, _ indexBit: Int) -> Bool {
        let num = val >> indexBit
        return num & 1 != 0
    }
}

//let s = _260_只出现一次的数字III()
//let result = s.singleNumber([1,2,1,3,2,5])
//print(result)
//
//assert(s.singleNumber([1,2,1,3,2,5]) == [3, 5])
//assert(s.singleNumber([-1,0]) == [-1,0])
//assert(s.singleNumber([0,1]) == [0,1])
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}
