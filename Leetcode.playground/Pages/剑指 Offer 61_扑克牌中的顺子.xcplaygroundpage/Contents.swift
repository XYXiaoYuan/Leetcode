/**
 https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof/
 
 从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任意数字。A 不能视为 14。

  

 示例 1:

 输入: [1,2,3,4,5]
 输出: True
  

 示例 2:

 输入: [0,0,1,2,5]
 输出: True
  

 限制：

 数组长度为 5

 数组的数取值为 [0, 13] .



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func isStraight(_ nums: [Int]) -> Bool {
        var set: Set<Int> = Set<Int>()
        
        var maxValue = 0
        var minValue = 14
        
        for num in nums {
            if num == 0 {
                continue
            }
            
            maxValue = max(maxValue, num)
            minValue = min(minValue, num)
            
            if set.contains(num) {
                return false
            }
            set.insert(num)
        }
        
        return maxValue - minValue < 5
    }
}

let s = Solution()
let input1 = [1, 2, 3, 4, 5]
let input2 = [0, 0, 1, 2, 5]
let input3 = [0, 0, 8, 5, 4]
let input4 = [8, 7, 11, 0, 9]
let input5 = [0, 0, 2, 2, 5]
let input6 = [11, 0, 9, 0, 0]
let result = s.isStraight(input6)
print(result)

assert(s.isStraight(input1) == true)
assert(s.isStraight(input2) == true)
assert(s.isStraight(input3) == true)
assert(s.isStraight(input4) == true)
assert(s.isStraight(input5) == false)
assert(s.isStraight(input6) == true)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

