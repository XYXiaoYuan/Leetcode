/**
 https://leetcode-cn.com/problems/pascals-triangle/
 
 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。



 在杨辉三角中，每个数是它左上方和右上方的数的和。

 示例:

 输入: 5
 输出:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/pascals-triangle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _118_杨辉三角 {
//class Solution {
    public init() {}

    public func generate(_ numRows: Int) -> [[Int]] {
        
        var dp: [[Int]] = [[Int]]()
        
        for i in 0..<numRows {
            var temp: [Int] = [Int].init(repeating: 1, count: i + 1)
            for j in 0..<numRows where i >= j {
//                print("i = \(i) -- j = \(j)")
                if j == 0 || j == i {
                    continue
                } else {
                    temp[j] = dp[i - 1][j - 1] + dp[i - 1][j]
                }
            }
            dp.append(temp)
        }
        
        return dp
    }
}

//let s = _118_杨辉三角()
//let result = s.generate(5)
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

