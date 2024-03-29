/**
 https://leetcode-cn.com/problems/24-game/
 
 你有 4 张写有 1 到 9 数字的牌。你需要判断是否能通过 *，/，+，-，(，) 的运算得到 24。

 示例 1:

 输入: [4, 1, 8, 7]
 输出: True
 解释: (8-4) * (7-1) = 24
 示例 2:

 输入: [1, 2, 1, 2]
 输出: False
 注意:

 除法运算符 / 表示实数除法，而不是整数除法。例如 4 / (1 - 2/3) = 12 。
 每个运算符对两个数进行运算。特别是我们不能用 - 作为一元运算符。例如，[1, 1, 1, 1] 作为输入时，表达式 -1 - 1 - 1 - 1 是不允许的。
 你不能将数字连接在一起。例如，输入为 [1, 2, 1, 2] 时，不能写成 12 + 12 。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/24-game
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _679_24点游戏 {
//class Solution {
    public init() {}
    
    let allResult = [[1, 1, 1, 8], [1, 1, 2, 6], [1, 1, 2, 7], [1, 1, 2, 8], [1, 1, 2, 9], [1, 1, 3, 4], [1, 1, 3, 5], [1, 1, 3, 6], [1, 1, 3, 7], [1, 1, 3, 8], [1, 1, 3, 9], [1, 1, 4, 4], [1, 1, 4, 5], [1, 1, 4, 6], [1, 1, 4, 7], [1, 1, 4, 8], [1, 1, 4, 9], [1, 1, 5, 5], [1, 1, 5, 6], [1, 1, 5, 7], [1, 1, 5, 8], [1, 1, 6, 6], [1, 1, 6, 8], [1, 1, 6, 9], [1, 1, 8, 8], [1, 2, 2, 4], [1, 2, 2, 5], [1, 2, 2, 6], [1, 2, 2, 7], [1, 2, 2, 8], [1, 2, 2, 9], [1, 2, 3, 3], [1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 3, 6], [1, 2, 3, 7], [1, 2, 3, 8], [1, 2, 3, 9], [1, 2, 4, 4], [1, 2, 4, 5], [1, 2, 4, 6], [1, 2, 4, 7], [1, 2, 4, 8], [1, 2, 4, 9], [1, 2, 5, 5], [1, 2, 5, 6], [1, 2, 5, 7], [1, 2, 5, 8], [1, 2, 5, 9], [1, 2, 6, 6], [1, 2, 6, 7], [1, 2, 6, 8], [1, 2, 6, 9], [1, 2, 7, 7], [1, 2, 7, 8], [1, 2, 7, 9], [1, 2, 8, 8], [1, 2, 8, 9], [1, 3, 3, 3], [1, 3, 3, 4], [1, 3, 3, 5], [1, 3, 3, 6], [1, 3, 3, 7], [1, 3, 3, 8], [1, 3, 3, 9], [1, 3, 4, 4], [1, 3, 4, 5], [1, 3, 4, 6], [1, 3, 4, 7], [1, 3, 4, 8], [1, 3, 4, 9], [1, 3, 5, 6], [1, 3, 5, 7], [1, 3, 5, 8], [1, 3, 5, 9], [1, 3, 6, 6], [1, 3, 6, 7], [1, 3, 6, 8], [1, 3, 6, 9], [1, 3, 7, 7], [1, 3, 7, 8], [1, 3, 7, 9], [1, 3, 8, 8], [1, 3, 8, 9], [1, 3, 9, 9], [1, 4, 4, 4], [1, 4, 4, 5], [1, 4, 4, 6], [1, 4, 4, 7], [1, 4, 4, 8], [1, 4, 4, 9], [1, 4, 5, 5], [1, 4, 5, 6], [1, 4, 5, 7], [1, 4, 5, 8], [1, 4, 5, 9], [1, 4, 6, 6], [1, 4, 6, 7], [1, 4, 6, 8], [1, 4, 6, 9], [1, 4, 7, 7], [1, 4, 7, 8], [1, 4, 7, 9], [1, 4, 8, 8], [1, 4, 8, 9], [1, 5, 5, 5], [1, 5, 5, 6], [1, 5, 5, 9], [1, 5, 6, 6], [1, 5, 6, 7], [1, 5, 6, 8], [1, 5, 6, 9], [1, 5, 7, 8], [1, 5, 7, 9], [1, 5, 8, 8], [1, 5, 8, 9], [1, 5, 9, 9], [1, 6, 6, 6], [1, 6, 6, 8], [1, 6, 6, 9], [1, 6, 7, 9], [1, 6, 8, 8], [1, 6, 8, 9], [1, 6, 9, 9], [1, 7, 7, 9], [1, 7, 8, 8], [1, 7, 8, 9], [1, 7, 9, 9], [1, 8, 8, 8], [1, 8, 8, 9], [2, 2, 2, 3], [2, 2, 2, 4], [2, 2, 2, 5], [2, 2, 2, 7], [2, 2, 2, 8], [2, 2, 2, 9], [2, 2, 3, 3], [2, 2, 3, 4], [2, 2, 3, 5], [2, 2, 3, 6], [2, 2, 3, 7], [2, 2, 3, 8], [2, 2, 3, 9], [2, 2, 4, 4], [2, 2, 4, 5], [2, 2, 4, 6], [2, 2, 4, 7], [2, 2, 4, 8], [2, 2, 4, 9], [2, 2, 5, 5], [2, 2, 5, 6], [2, 2, 5, 7], [2, 2, 5, 8], [2, 2, 5, 9], [2, 2, 6, 6], [2, 2, 6, 7], [2, 2, 6, 8], [2, 2, 6, 9], [2, 2, 7, 7], [2, 2, 7, 8], [2, 2, 8, 8], [2, 2, 8, 9], [2, 3, 3, 3], [2, 3, 3, 5], [2, 3, 3, 6], [2, 3, 3, 7], [2, 3, 3, 8], [2, 3, 3, 9], [2, 3, 4, 4], [2, 3, 4, 5], [2, 3, 4, 6], [2, 3, 4, 7], [2, 3, 4, 8], [2, 3, 4, 9], [2, 3, 5, 5], [2, 3, 5, 6], [2, 3, 5, 7], [2, 3, 5, 8], [2, 3, 5, 9], [2, 3, 6, 6], [2, 3, 6, 7], [2, 3, 6, 8], [2, 3, 6, 9], [2, 3, 7, 7], [2, 3, 7, 8], [2, 3, 7, 9], [2, 3, 8, 8], [2, 3, 8, 9], [2, 3, 9, 9], [2, 4, 4, 4], [2, 4, 4, 5], [2, 4, 4, 6], [2, 4, 4, 7], [2, 4, 4, 8], [2, 4, 4, 9], [2, 4, 5, 5], [2, 4, 5, 6], [2, 4, 5, 7], [2, 4, 5, 8], [2, 4, 5, 9], [2, 4, 6, 6], [2, 4, 6, 7], [2, 4, 6, 8], [2, 4, 6, 9], [2, 4, 7, 7], [2, 4, 7, 8], [2, 4, 7, 9], [2, 4, 8, 8], [2, 4, 8, 9], [2, 4, 9, 9], [2, 5, 5, 7], [2, 5, 5, 8], [2, 5, 5, 9], [2, 5, 6, 6], [2, 5, 6, 7], [2, 5, 6, 8], [2, 5, 6, 9], [2, 5, 7, 7], [2, 5, 7, 8], [2, 5, 7, 9], [2, 5, 8, 8], [2, 5, 8, 9], [2, 6, 6, 6], [2, 6, 6, 7], [2, 6, 6, 8], [2, 6, 6, 9], [2, 6, 7, 8], [2, 6, 7, 9], [2, 6, 8, 8], [2, 6, 8, 9], [2, 6, 9, 9], [2, 7, 7, 8], [2, 7, 8, 8], [2, 7, 8, 9], [2, 8, 8, 8], [2, 8, 8, 9], [2, 8, 9, 9], [3, 3, 3, 3], [3, 3, 3, 4], [3, 3, 3, 5], [3, 3, 3, 6], [3, 3, 3, 7], [3, 3, 3, 8], [3, 3, 3, 9], [3, 3, 4, 4], [3, 3, 4, 5], [3, 3, 4, 6], [3, 3, 4, 7], [3, 3, 4, 8], [3, 3, 4, 9], [3, 3, 5, 5], [3, 3, 5, 6], [3, 3, 5, 7], [3, 3, 5, 9], [3, 3, 6, 6], [3, 3, 6, 7], [3, 3, 6, 8], [3, 3, 6, 9], [3, 3, 7, 7], [3, 3, 7, 8], [3, 3, 7, 9], [3, 3, 8, 8], [3, 3, 8, 9], [3, 3, 9, 9], [3, 4, 4, 4], [3, 4, 4, 5], [3, 4, 4, 6], [3, 4, 4, 7], [3, 4, 4, 8], [3, 4, 4, 9], [3, 4, 5, 5], [3, 4, 5, 6], [3, 4, 5, 7], [3, 4, 5, 8], [3, 4, 5, 9], [3, 4, 6, 6], [3, 4, 6, 8], [3, 4, 6, 9], [3, 4, 7, 7], [3, 4, 7, 8], [3, 4, 7, 9], [3, 4, 8, 9], [3, 4, 9, 9], [3, 5, 5, 6], [3, 5, 5, 7], [3, 5, 5, 8], [3, 5, 5, 9], [3, 5, 6, 6], [3, 5, 6, 7], [3, 5, 6, 8], [3, 5, 6, 9], [3, 5, 7, 8], [3, 5, 7, 9], [3, 5, 8, 8], [3, 5, 8, 9], [3, 5, 9, 9], [3, 6, 6, 6], [3, 6, 6, 7], [3, 6, 6, 8], [3, 6, 6, 9], [3, 6, 7, 7], [3, 6, 7, 8], [3, 6, 7, 9], [3, 6, 8, 8], [3, 6, 8, 9], [3, 6, 9, 9], [3, 7, 7, 7], [3, 7, 7, 8], [3, 7, 7, 9], [3, 7, 8, 8], [3, 7, 8, 9], [3, 7, 9, 9], [3, 8, 8, 8], [3, 8, 8, 9], [3, 8, 9, 9], [3, 9, 9, 9], [4, 4, 4, 4], [4, 4, 4, 5], [4, 4, 4, 6], [4, 4, 4, 7], [4, 4, 4, 8], [4, 4, 4, 9], [4, 4, 5, 5], [4, 4, 5, 6], [4, 4, 5, 7], [4, 4, 5, 8], [4, 4, 6, 8], [4, 4, 6, 9], [4, 4, 7, 7], [4, 4, 7, 8], [4, 4, 7, 9], [4, 4, 8, 8], [4, 4, 8, 9], [4, 5, 5, 5], [4, 5, 5, 6], [4, 5, 5, 7], [4, 5, 5, 8], [4, 5, 5, 9], [4, 5, 6, 6], [4, 5, 6, 7], [4, 5, 6, 8], [4, 5, 6, 9], [4, 5, 7, 7], [4, 5, 7, 8], [4, 5, 7, 9], [4, 5, 8, 8], [4, 5, 8, 9], [4, 5, 9, 9], [4, 6, 6, 6], [4, 6, 6, 7], [4, 6, 6, 8], [4, 6, 6, 9], [4, 6, 7, 7], [4, 6, 7, 8], [4, 6, 7, 9], [4, 6, 8, 8], [4, 6, 8, 9], [4, 6, 9, 9], [4, 7, 7, 7], [4, 7, 7, 8], [4, 7, 8, 8], [4, 7, 8, 9], [4, 7, 9, 9], [4, 8, 8, 8], [4, 8, 8, 9], [4, 8, 9, 9], [5, 5, 5, 5], [5, 5, 5, 6], [5, 5, 5, 9], [5, 5, 6, 6], [5, 5, 6, 7], [5, 5, 6, 8], [5, 5, 7, 7], [5, 5, 7, 8], [5, 5, 8, 8], [5, 5, 8, 9], [5, 5, 9, 9], [5, 6, 6, 6], [5, 6, 6, 7], [5, 6, 6, 8], [5, 6, 6, 9], [5, 6, 7, 7], [5, 6, 7, 8], [5, 6, 7, 9], [5, 6, 8, 8], [5, 6, 8, 9], [5, 6, 9, 9], [5, 7, 7, 9], [5, 7, 8, 8], [5, 7, 8, 9], [5, 8, 8, 8], [5, 8, 8, 9], [6, 6, 6, 6], [6, 6, 6, 8], [6, 6, 6, 9], [6, 6, 7, 9], [6, 6, 8, 8], [6, 6, 8, 9], [6, 7, 8, 9], [6, 7, 9, 9], [6, 8, 8, 8], [6, 8, 8, 9], [6, 8, 9, 9], [7, 8, 8, 9]]
    
    let precision = 1e-6
    let target = 24.0
    
    public func judgePoint24(_ nums: [Int]) -> Bool {
        return judgePoint24(nums.map({ Double($0) }))
    }
    
    private func judgePoint24(_ nums: [Double]) -> Bool {
        if nums.count == 1 {
            return abs(nums[0] - 24.0) < 1e-6
        }
        
        for i in 0..<nums.count {
            for j in 0..<nums.count {
                if i == j {
                    continue
                }
                var nums_ = nums.enumerated().filter({ $0.0 != i && $0.0 != j }).map({ $0.1 })
                let parts = possibleParts(a: nums[i], b: nums[j])
                for p in parts {
                    nums_.append(p)
                    if judgePoint24(nums_) {
                        return true
                    }
                    nums_ = nums_.dropLast()
                }
            }
        }
        return false
    }
    
    private func possibleParts(a: Double, b: Double) -> [Double] {
        var res = [a + b, a - b, a * b]
        if a != 0 {
            res.append(b / a)
        }
        return res
    }
}

//let s = _679_24点游戏()
//let result = s.judgePoint24([4, 1, 8, 7])
//print(result)

//assert(s.judgePoint24([4, 1, 8, 7]) == true)
//assert(s.judgePoint24([1, 2, 1, 2]) == false)
