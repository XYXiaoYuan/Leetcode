/**
 https://leetcode-cn.com/problems/longest-mountain-in-array/
 
 我们把数组 A 中符合下列属性的任意连续子数组 B 称为 “山脉”：

 B.length >= 3
 存在 0 < i < B.length - 1 使得 B[0] < B[1] < ... B[i-1] < B[i] > B[i+1] > ... > B[B.length - 1]
 （注意：B 可以是 A 的任意子数组，包括整个数组 A。）

 给出一个整数数组 A，返回最长 “山脉” 的长度。

 如果不含有 “山脉” 则返回 0。

  

 示例 1：

 输入：[2,1,4,7,3,2,5]
 输出：5
 解释：最长的 “山脉” 是 [1,4,7,3,2]，长度为 5。
 示例 2：

 输入：[2,2,2]
 输出：0
 解释：不含 “山脉”。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-mountain-in-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        guard A.count >= 3 else { return 0 }
        
        var increase = Array(repeating: 1, count: A.count)
        var decrease = Array(repeating: 1, count: A.count)
        
        var result = 0
        
        // 1. Fill in increase array
        for i in 1..<A.count {
            if A[i] > A[i-1] {
                increase[i] = increase[i-1] + 1
            }
        }
        
        // 2. Fill in decrease array
        for i in (0...A.count-2).reversed() {
            if A[i] > A[i+1] {
                decrease[i] = decrease[i+1] + 1
            }
        }
        
        // 3. Go through array one more time and get current result when peak is found
        for i in 1..<A.count-1 {
            if A[i] > A[i-1] && A[i] > A[i+1] {
                result = max(result, increase[i] + decrease[i+1])
            }
        }
        
        return result
    }
    
}
