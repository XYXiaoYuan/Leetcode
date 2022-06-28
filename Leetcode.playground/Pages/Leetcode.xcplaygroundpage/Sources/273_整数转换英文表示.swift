/**
 https://leetcode.cn/problems/integer-to-english-words/
 
 将非负整数 num 转换为其对应的英文表示。
 
  
 
 示例 1：
 
 输入：num = 123
 输出："One Hundred Twenty Three"
 示例 2：
 
 输入：num = 12345
 输出："Twelve Thousand Three Hundred Forty Five"
 示例 3：
 
 输入：num = 1234567
 输出："One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
  
 
 提示：
 
 0 <= num <= 231 - 1
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/integer-to-english-words
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _273_整数转换英文表示 {
    public init() {}

    //class Solution {
    // one digit
    private func one(_ num: Int) -> String {
        switch num {
        case 0: return ""
        case 1: return "One"
        case 2: return "Two"
        case 3: return "Three"
        case 4: return "Four"
        case 5: return "Five"
        case 6: return "Six"
        case 7: return "Seven"
        case 8: return "Eight"
        case 9: return "Nine"
        default: return "wrong"
        }
    }
    
    // two digit but < 20
    private func underTwenty(_ num: Int) -> String {
        switch num {
        case 0: return "Ten"
        case 1: return "Eleven"
        case 2: return "Twelve"
        case 3: return "Thirteen"
        case 4: return "Fourteen"
        case 5: return "Fifteen"
        case 6: return "Sixteen"
        case 7: return "Seventeen"
        case 8: return "Eighteen"
        case 9: return "Nineteen"
        default: return "wrong"
        }
    }
    
    // two digit but >= 20
    private func two(_ num: Int) -> String {
        switch num {
        case 2: return "Twenty"
        case 3: return "Thirty"
        case 4: return "Forty"
        case 5: return "Fifty"
        case 6: return "Sixty"
        case 7: return "Seventy"
        case 8: return "Eighty"
        case 9: return "Ninety"
        default: return "wrong"
        }
    }
    
    private func format(_ num: Int) -> String? {
        if num <= 0 { return nil }
        
        let hundred = num / 100
        let tens = (num - hundred * 100) / 10
        let rest = (num - hundred * 100 - tens * 10)
        
        var ans: [String] = []
        if hundred > 0 {
            ans.append("\(one(hundred)) Hundred")
        }
        
        if tens == 1 {
            // for case 115
            ans.append(underTwenty(rest))
        } else {
            // for case 125
            if tens > 0 {
                ans.append(two(tens))
            }
            if rest > 0 {
                ans.append(one(rest))
            }
        }
        return ans.joined(separator: " ")
    }
    
    public func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        let billion = num / 1_000_000_000
        let million = (num - billion * 1_000_000_000) / 1_000_000
        let thousand = (num - billion * 1_000_000_000 - million * 1_000_000) / 1_000
        let hundred = (num - billion * 1_000_000_000 - million * 1_000_000 - thousand * 1_000) / 100
        let rest = num - billion * 1_000_000_000 - million * 1_000_000 - thousand * 1_000 - hundred * 100
        
        var ans: [String] = []
        if let text = format(billion) {
            ans.append("\(text) Billion")
        }
        if let text = format(million) {
            ans.append("\(text) Million")
        }
        if let text = format(thousand) {
            ans.append("\(text) Thousand")
        }
        if let text = format(hundred) {
            ans.append("\(text) Hundred")
        }
        if let text = format(rest) {
            ans.append("\(text)")
        }
        return ans.joined(separator: " ")
    }
}

//do {
//    let s = _273_整数转换英文表示()
//    let result = s.numberToWords(25)
//    print(result)
//}

