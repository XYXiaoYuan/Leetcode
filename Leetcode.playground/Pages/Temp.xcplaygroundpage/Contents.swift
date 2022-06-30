import Darwin
/**
 https://leetcode.cn/problems/decode-string/
 
 给定一个经过编码的字符串，返回它解码后的字符串。

 编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。

 你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

 此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。

  

 示例 1：

 输入：s = "3[a]2[bc]"
 输出："aaabcbc"
 示例 2：

 输入：s = "3[a2[c]]"
 输出："accaccacc"
 示例 3：

 输入：s = "2[abc]3[cd]ef"
 输出："abcabccdcdcdef"
 示例 4：

 输入：s = "abc3[cd]xyz"
 输出："abccdcdcdxyz"
  

 提示：

 1 <= s.length <= 30
 s 由小写英文字母、数字和方括号 '[]' 组成
 s 保证是一个 有效 的输入。
 s 中所有整数的取值范围为 [1, 300]


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/decode-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _394_字符串解码 {
    public init() {}
    //class Solution class Solution {
    
    public func decodeString(_ s: String) -> String {
        let array = Array(s)
        
        return ""
    }
    
    private func repeatCountString(_ count: Int, _ string: String) -> String {
        var result: String = ""
        for _ in 0..<count {
            result.append(string)
        }
        return result
    }
    
    func myAtoi(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var chars = s.trimmingCharacters(in: .whitespaces)
        
        var isNegative = false
        if let first = chars.first, first == Character("+") || first == Character("-") {
            if first == Character("-")  {
                isNegative = true
            }
            chars.removeFirst()
        }
        
        var totalNumber: Double = 0
        while let char = chars.first, let number = Double(String(char)) {
            totalNumber *= 10
            
            chars.removeFirst()
            
            totalNumber += number
        }
        
        if totalNumber > Double(Int32.max) || totalNumber < Double(Int32.min) {
            return isNegative ? Int(Int32.min) : Int(Int32.max)
        } else {
            let num = Int(totalNumber)
            return isNegative ? num * -1 : num
        }
    }
}
do {
    let s = _394_字符串解码()
    print(s.myAtoi("42"))
    print(s.myAtoi("   -42"))
    print(s.myAtoi("4193 with words"))
    print(s.myAtoi("words and 987"))
}
    
do {
    let s = _394_字符串解码()
    let result = s.decodeString("3[a]2[bc]")
    print(result)
}

