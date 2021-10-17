/**
 https://www.nowcoder.com/practice/9cf027bf54714ad889d4f30ff0ae5481?tpId=196&&tqId=37129&rp=1&ru=/activity/oj&qru=/ta/job-code-total/question-ranking
 
 描述
 给定数组arr，设长度为n，输出arr的最长递增子序列。（如果有多个答案，请输出其中 按数值(注：区别于按单个字符的ASCII码值)进行比较的 字典序最小的那个）
 示例1
 输入：
 [2,1,5,3,6,4,8,9,7]
 复制
 返回值：
 [1,3,4,8,9]
 复制
 示例2
 输入：
 [1,2,8,6,4]
 复制
 返回值：
 [1,2,4]
 复制
 说明：
 其最长递增子序列有3个，（1，2，8）、（1，2，6）、（1，2，4）其中第三个 按数值进行比较的字典序 最小，故答案为（1，2，4）
 备注：
 n \leq 10^5n≤10
 5
  
 1 \leq arr_i \leq 10^91≤arr
 i
 ​
  ≤10
 9

 */

public class NC91_最长递增子序列 {
//class Solution {
    public init() {}

        
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * retrun the longest increasing subsequence
     * @param arr int整型一维数组 the array
     * @return int整型一维数组
     */
    func LIS ( _ arr: [Int]) -> [Int] {
        if arr.isEmpty {
            return arr
        }
        
        var dp: [Int] = [Int].init(repeating: 0, count: arr.count)
        dp[0] = 1
        var maxValue = 1
        let result: [Int] = [Int]()
        for i in 1..<dp.count {
            dp[i] = 1
            for j in 0..<i {
                if arr[i] <= arr[j] {
                    continue
                }
                dp[i] = max(dp[i], dp[j] + 1)
            }
            
            maxValue = max(dp[i], maxValue)
        }
        
        return result
    }
}


//let s = Solution()
//let input1 = [1,2,8,6,4]
//let input2 = [2,1,5,3,6,4,8,9,7]
//let result = s.LIS(input1)
//print(result)
//
////assert(s.maxValue(input1) == 12)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

