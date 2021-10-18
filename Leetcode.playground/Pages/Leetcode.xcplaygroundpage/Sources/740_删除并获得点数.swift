/**
 https://leetcode-cn.com/problems/delete-and-earn/
 
 给你一个整数数组 nums ，你可以对它进行一些操作。

 每次操作中，选择任意一个 nums[i] ，删除它并获得 nums[i] 的点数。之后，你必须删除 所有 等于 nums[i] - 1 和 nums[i] + 1 的元素。

 开始你拥有 0 个点数。返回你能通过这些操作获得的最大点数。

  

 示例 1：

 输入：nums = [3,4,2]
 输出：6
 解释：
 删除 4 获得 4 个点数，因此 3 也被删除。
 之后，删除 2 获得 2 个点数。总共获得 6 个点数。
 示例 2：

 输入：nums = [2,2,3,3,3,4]
 输出：9
 解释：
 删除 3 获得 3 个点数，接着要删除两个 2 和 4 。
 之后，再次删除 3 获得 3 个点数，再次删除 3 获得 3 个点数。
 总共获得 9 个点数。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/delete-and-earn
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _740_删除并获得点数 {
//class Solution {
    public init() {}
    
    public func deleteAndEarn(_ nums: [Int]) -> Int {
        var maxValue = 0
        for val in nums {
            maxValue = max(maxValue, val)
        }
        
        var sum = [Int].init(repeating: 0, count: maxValue + 1)
        for val in nums {
//            print("val = \(val)")
            sum[val] += val
//            print("sum[\(val)] = \(sum[val])")
//            print("sum = \(sum) \n")
        }
        return rob(&sum)
    }
    
    private func rob(_ nums: inout [Int]) -> Int {
        let count = nums.count
        var first = nums[0]
        var second = max(first, nums[1])
        
        for i in 2..<count {
            let temp = second
            second = max(first + nums[i], second)
            first = temp
        }
        return second
    }
}

//let s = _740_删除并获得点数()
//let result = s.deleteAndEarn([2,2,3,3,3,4])
//print(result)

//assert(s.deleteAndEarn([3, 4, 2]) == 6)
//assert(s.deleteAndEarn([2,2,3,3,3,4]) == 9)


/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

