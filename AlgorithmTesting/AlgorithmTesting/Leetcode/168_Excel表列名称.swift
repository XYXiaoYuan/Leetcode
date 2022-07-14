/**
 https://leetcode-cn.com/problems/excel-sheet-column-title/
 
 给你一个整数 columnNumber ，返回它在 Excel 表中相对应的列名称。

 例如：

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
  

 示例 1：

 输入：columnNumber = 1
 输出："A"
 示例 2：

 输入：columnNumber = 28
 输出："AB"
 示例 3：

 输入：columnNumber = 701
 输出："ZY"
 示例 4：

 输入：columnNumber = 2147483647
 输出："FXSHRXW"


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/excel-sheet-column-title
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _168_Excel表列名称 {
//class Solution {
    public init() {}
    
    public func convertToTitle1(_ n: Int) -> String {
        let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        let count: Int = letters.count
        
        var result = ""
        var current = n
        
        while current > 0 {
            result = letters[(current - 1) % count] + result
            current = (current - 1) / count
        }
        return result
    }
    
    public func convertToTitle(_ n: Int) -> String {
        var result: String = ""
        var n: Int = n
        let count = 26
        while n > 0 {
            if let letter = UnicodeScalar((n - 1) % count + 65) {
                result = String(letter) + result
                n = (n - 1) / count
            }
        }
        return result
    }
}

//let s = _168_Excel表列名称()
//let result = s.convertToTitle(52)
//print(result)
//
//assert(s.convertToTitle(1) == "A")
//assert(s.convertToTitle(26) == "Z")
//assert(s.convertToTitle(28) == "AB")
//assert(s.convertToTitle(701) == "ZY")
//assert(s.convertToTitle(2147483647) == "FXSHRXW")

/// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

