/**
 https://leetcode-cn.com/problems/maximum-sum-circular-subarray/
 
 给定一个由整数数组 A 表示的环形数组 C，求 C 的非空子数组的最大可能和。

 在此处，环形数组意味着数组的末端将会与开头相连呈环状。（形式上，当0 <= i < A.length 时 C[i] = A[i]，且当 i >= 0 时 C[i+A.length] = C[i]）

 此外，子数组最多只能包含固定缓冲区 A 中的每个元素一次。（形式上，对于子数组 C[i], C[i+1], ..., C[j]，不存在 i <= k1, k2 <= j 其中 k1 % A.length = k2 % A.length）

  

 示例 1：

 输入：[1,-2,3,-2]
 输出：3
 解释：从子数组 [3] 得到最大和 3
 示例 2：

 输入：[5,-3,5]
 输出：10
 解释：从子数组 [5,5] 得到最大和 5 + 5 = 10
 示例 3：

 输入：[3,-1,2,-1]
 输出：4
 解释：从子数组 [2,-1,3] 得到最大和 2 + (-1) + 3 = 4
 示例 4：

 输入：[3,-2,2,-3]
 输出：3
 解释：从子数组 [3] 和 [3,-2,2] 都可以得到最大和 3
 示例 5：

 输入：[-2,-3,-1]
 输出：-1
 解释：从子数组 [-1] 得到最大和 -1


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-sum-circular-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _918_环形子数组的最大和 {
//class Solution {
    public init() {}
    
    public func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 0 else { return 0 }
        
        // Case 1: maximum of [i,j] with (i <= j)
        // Case 2: maximum [0...i-1] + [j+1..<n] = sum - minimum of [i,j] with (i <= j)
        // Compare results of 2 cases
        var sum = 0
        var max1 = Int.min
        var max_ending_here = 0
        var min1 = Int.max
        var min_ending_here = 0
        for i in 0..<n {
            max_ending_here = max_ending_here + nums[i]
            max1 = Swift.max(max1, max_ending_here)
            if max_ending_here < 0 {
                max_ending_here = 0
            }
            
            min_ending_here = min_ending_here + nums[i]
            min1 = Swift.min(min1, min_ending_here)
            if min_ending_here > 0 {
                min_ending_here = 0
            }
            
            sum += nums[i]
        }
        
        return sum == min1 ? max1 : Swift.max(max1, sum - min1)
    }
}

//let s = _918_环形子数组的最大和()
//let input1 = [1,-2,3,-2]
//let input2 = [5,-3,5]
//let result = s.maxSubarraySumCircular(input1)
//print(result)
//
//assert(s.maxSubarraySumCircular(input1) == 3)
//assert(s.maxSubarraySumCircular(input2) == 10)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

