/**
 https://leetcode-cn.com/problems/compress-string-lcci/
 
 
 字符串压缩。利用字符重复出现的次数，编写一种方法，实现基本的字符串压缩功能。比如，字符串aabcccccaaa会变为a2b1c5a3。若“压缩”后的字符串没有变短，则返回原先的字符串。你可以假设字符串中只包含大小写英文字母（a至z）。

 示例1:

  输入："aabcccccaaa"
  输出："a2b1c5a3"
 示例2:

  输入："abbccd"
  输出："abbccd"
  解释："abbccd"压缩后为"a1b2c2d1"，比原字符串长度更长。
 提示：

 字符串长度在[0, 50000]范围内。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/compress-string-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func compressString(_ S: String) -> String {
        if S.count <= 1 {
            return S
        }
        
        let array: [String] = S.map { "\($0)" }
        
        var prev: String = String(S.prefix(1))
        var res = prev
        var count: Int = 1
        for index in 1..<array.count {
            let val = array[index]
            if val == prev {
                count += 1
            } else {
                res.append("\(count)")
                res.append(val)
                count = 1
                prev = val
            }
            
            if index == S.count - 1 {
                res.append("\(count)")
            }
        }
        
        if res.count < S.count {
            return res
        }
                
        return S
    }
}

let s = Solution()
let result = s.compressString("aabcccccaaa")
//print(result)

assert(s.compressString("aabcccccaaa") == "a2b1c5a3")
assert(s.compressString("abbccd") == "abbccd")

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

