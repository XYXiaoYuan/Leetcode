/**
 https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/
 
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

 示例:

 s = "abaccdeff"
 返回 "b"

 s = ""
 返回 " "
  

 限制：

 0 <= s 的长度 <= 50000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func firstUniqChar(_ s: String) -> Character {
        var dict: [String: Int] = [String: Int]()
        for c in s {
            let key = String(c)
            dict.updateValue((dict[key] ?? 0) + 1, forKey: key)
        }
        
        for c in s {
            if let val = dict[String(c)], val == 1 {
                return c
            }
        }
        
        return " "
    }
    
    
    /// 超时
    func firstUniqChar1(_ s: String) -> Character {
        var flag: Bool = true

        var key: Character = Character(" ")
        for c in s {
            var i = 0
            for b in s where c == b {
                i += 1
            }
            if 1 == i {
                key = c
                flag = false
                break
            }
        }
        
        if flag {
            return " "
        }
        return key
    }
}

let s = Solution()
let result = s.firstUniqChar("abaccdeff")
print(result)

assert(s.firstUniqChar("abaccdeff") == "b")

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

