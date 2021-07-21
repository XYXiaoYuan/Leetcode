/**
 https://www.nowcoder.com/practice/c3a6afee325e472386a1c4eb1ef987f3?tpId=194&&tqId=36151&rp=1&ru=/activity/oj&qru=/ta/job-code-high-client/question-ranking
 
 描述
 写出一个程序，接受一个字符串，然后输出该字符串反转后的字符串。（字符串长度不超过1000）
 示例1
 输入：
 "abcd"
 复制
 返回值：
 "dcba"
 复制

 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 反转字符串
     * @param str string字符串
     * @return string字符串
     */
    func solve ( _ str: String) -> String {
        if str.isEmpty {
            return str
        }
        
        var strings = Array(str)
        
        var left: Int = 0
        var right: Int = strings.count - 1
        
        while left < right {
            strings.swapAt(left, right)
            
            left += 1
            right -= 1
        }
        
        return strings.map { String($0) }.joined(separator: "")
    }
    
    func solve1 ( _ str: String) -> String {
            return String(str.reversed())
        }
}
