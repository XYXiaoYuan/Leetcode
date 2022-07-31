///**
// https://leetcode.cn/problems/make-array-zero-by-subtracting-equal-amounts/
// 
// 给你一个非负整数数组 nums 。在一步操作中，你必须：
//
// 选出一个正整数 x ，x 需要小于或等于 nums 中 最小 的 非零 元素。
// nums 中的每个正整数都减去 x。
// 返回使 nums 中所有元素都等于 0 需要的 最少 操作数。
//
//  
//
// 示例 1：
//
// 输入：nums = [1,5,0,3,5]
// 输出：3
// 解释：
// 第一步操作：选出 x = 1 ，之后 nums = [0,4,0,2,4] 。
// 第二步操作：选出 x = 2 ，之后 nums = [0,2,0,0,2] 。
// 第三步操作：选出 x = 2 ，之后 nums = [0,0,0,0,0] 。
// 示例 2：
//
// 输入：nums = [0]
// 输出：0
// 解释：nums 中的每个元素都已经是 0 ，所以不需要执行任何操作。
//  
//
// 提示：
//
// 1 <= nums.length <= 100
// 0 <= nums[i] <= 100
//
//
// 来源：力扣（LeetCode）
// 链接：https://leetcode.cn/problems/make-array-zero-by-subtracting-equal-amounts
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
// */
//
//import Foundation
//import Darwin
//
//public class _6132_使数组中所有元素都等于零 /** Solution */  {
//    public init() {}
//        
//    /// 哈希表法，转化为数组中的不重复的非零元素的个数
//    public func minimumOperations2(_ nums: [Int]) -> Int {
//        var set = Set<Int>()
//        for num in nums where num != 0 {
//            set.insert(num)
//        }
//        return set.count
//    }
//    
//    /// 先排序，遍历，判断当前数如果小于差值，更新差值为当前差值加上当前数减去上一次的差值，同时更新次数+1
//    public func minimumOperations1(_ nums: [Int]) -> Int {
//        let nums = nums.sorted()
//        var count = 0
//        var delta = 0
//
//        for num in nums where delta < num {
//            count += 1
//            delta += num - delta
//        }
//        return count
//    }
//
//    public func minimumOperations(_ nums: [Int]) -> Int {
//        var nums = nums
//        return minOp(&nums)
//    }
//    
//    private func minOp(_ nums: inout [Int]) -> Int {
//        if isAllZero(nums) {
//            return 0
//        }
//        guard let min = nums.filter({ $0 != 0 }).min() else { return 0 }
//
//        for (i, num) in nums.enumerated() {
//            if num > 0 {
//                nums[i] -= min;
//            }
//        }
//        
//        return minOp(&nums) + 1
//    }
//    
//    private func isAllZero(_ nums: [Int]) -> Bool {
//        var count = 0
//        for num in nums where num == 0 {
//            count += 1
//        }
//        return count == nums.count
//    }
//}
//
//extension _6132_使数组中所有元素都等于零 {
//    public func test() {
//        let testTime = 100
//        let minValue = 1
//        let maxValue = 100
//        let count = Int.random(in: 0...100)
//        var isSucceed = true
//        for _ in 0..<testTime {
//            let randomArr = Int.random(count: count, min: minValue, max: maxValue)
//
//            /// 方法一
//            let result = minimumOperations(randomArr)
//
//            /// 待验证的：方法二
//            let result2 = minimumOperations1(randomArr)
//            
//            /// 待验证的：方法三
//            let result3 = minimumOperations2(randomArr)
//
//            if result != result2 || result != result3 {
//                isSucceed = false
//                print("randomArr = \(randomArr)")
//                break
//            }
//        }
//        
//        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
//    }
//}
//
//do {
//    let s = _6132_使数组中所有元素都等于零()
//    let result = s.minimumOperations([1,5,0,3,5])
//    print("\(s) --- \(result)")
//
//    /// 对数器测试
//    s.test()
//}
//
////: [Next](@next)
