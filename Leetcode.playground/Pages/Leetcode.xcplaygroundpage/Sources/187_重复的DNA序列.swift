/**
 https://leetcode-cn.com/problems/repeated-dna-sequences/
 
 所有 DNA 都由一系列缩写为 'A'，'C'，'G' 和 'T' 的核苷酸组成，例如："ACGAATTCCG"。在研究 DNA 时，识别 DNA 中的重复序列有时会对研究非常有帮助。

 编写一个函数来找出所有目标子串，目标子串的长度为 10，且在 DNA 字符串 s 中出现次数超过一次。

  

 示例 1：

 输入：s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 输出：["AAAAACCCCC","CCCCCAAAAA"]
 示例 2：

 输入：s = "AAAAAAAAAAAAA"
 输出：["AAAAAAAAAA"]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/repeated-dna-sequences
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _187_重复的DNA序列 {
//class Solution {
    public init() {}
    
    public func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else {
            return []
        }
        var dict : [String : Int] = [:], final : [String] = []
        let s = Array(s)
        for i in 0..<s.count - 9{
            if dict[String(s[i..<i+10])] == nil{
                dict[String(s[i..<i+10])] = 1
            }
            else if dict[String(s[i..<i+10])] == 1{
                final.append(String(s[i..<i+10]))
                dict[String(s[i..<i+10])]! += 1
            }
        }
        return final
    }
    
    public func findRepeatedDnaSequences2(_ s: String) -> [String] {
        var dict: [String: Bool] = [:]
        var start = 0, end = 9
        let s = Array(s)
        var result: [String] = []
        
        while end < s.count {
            let string = String(s[start ... end])
            
            if let value = dict[string] {
                if value == false {
                    result.append(string)
                }
                
                dict[string] = true
            } else {
                dict[string] = false
            }
            
            start += 1
            end += 1
        }
        
        return result
    }
    
    /// 结果数组的顺序不能保证
    public func findRepeatedDnaSequences1(_ s: String) -> [String] {
        
        if s.count <= 10 { return []}
        
        var sets = Set<String>(), ans = Set<String>()
        let chars = Array(s)
        var curChars = [Character]()
        for i in 0..<10 {
            curChars.append(chars[i])
            sets.insert(String(curChars))
        }
        
        
        for i in 10..<chars.count {
            curChars.remove(at: 0)
            curChars.append(chars[i])
            let str = String(curChars)
            
            if ans.contains(str) {
                continue
            } else if sets.contains(str) {
                ans.insert(str)
            } else {
                sets.insert(str)
            }
        }
        return Array(ans)
    }
}

//let s = _187_重复的DNA序列()
//let result = s.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")
//print(result)
//
//assert(s.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT") == ["AAAAACCCCC", "CCCCCAAAAA"])
//assert(s.findRepeatedDnaSequences("AAAAAAAAAAAAA") == ["AAAAAAAAAAAAA"])
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

