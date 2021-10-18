/**
 https://leetcode-cn.com/problems/excel-sheet-column-number/
 
 给定一个Excel表格中的列名称，返回其相应的列序号。

 例如，

     A -> 1
     B -> 2
     C -> 3
     ...
     Z -> 26
     AA -> 27
     AB -> 28
     ...
 示例 1:

 输入: "A"
 输出: 1
 示例 2:

 输入: "AB"
 输出: 28
 示例 3:

 输入: "ZY"
 输出: 701
 致谢：
 特别感谢 @ts 添加此问题并创建所有测试用例。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/excel-sheet-column-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _171_Excel表列序号 {
//class Solution {
    public init() {}
    
    public func titleToNumber1(_ s: String) -> Int {
        return s.unicodeScalars.reduce(0) { $0 * 26 + Int($1.value) - 64 }
    }
    
    public func titleToNumber(_ columnTitle: String) -> Int {
        var result = 0
        for ch in columnTitle.unicodeScalars {
            let num = ch.value - 64
            result = result * 26 + Int(num)
        }
        return result
    }

}

//let s = _171_Excel表列序号()
//let result = s.titleToNumber("ABCD")
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

