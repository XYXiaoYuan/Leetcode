/**
 https://leetcode-cn.com/problems/pascals-triangle-ii/
 
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。



 在杨辉三角中，每个数是它左上方和右上方的数的和。

 示例:

 输入: 3
 输出: [1,3,3,1]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/pascals-triangle-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _119_杨辉三角II {
//class Solution {
    public init() {}
    
    public func getRow(_ rowIndex: Int) -> [Int] {
        var dp: [[Int]] = [[Int]]()

        for i in 0...rowIndex {
            var temp: [Int] = [Int].init(repeating: 1, count: i + 1)
            for j in 0...rowIndex where i >= j {
                if j == 0 || j == i {
                    continue
                } else {
                    temp[j] = dp[i - 1][j - 1] + dp[i - 1][j]
                }
            }
            dp.append(temp)
        }
        
        return dp[rowIndex]
    }
}

//let s = _119_杨辉三角II()
//let result = s.getRow(3)
//print(result)
//
////assert(s.getRow(3) == [1,3,3,1])
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

