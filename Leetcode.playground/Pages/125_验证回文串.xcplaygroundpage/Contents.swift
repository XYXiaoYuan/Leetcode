/**
 https://leetcode-cn.com/problems/valid-palindrome/
 
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。

 说明：本题中，我们将空字符串定义为有效的回文串。

  

 示例 1:

 输入: "A man, a plan, a canal: Panama"
 输出: true
 解释："amanaplanacanalpanama" 是回文串
 示例 2:

 输入: "race a car"
 输出: false
 解释："raceacar" 不是回文串
  

 提示：

 1 <= s.length <= 2 * 105
 字符串 s 由 ASCII 字符组成


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-palindrome
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    
    func isPalindrome(_ s: String) -> Bool {
        var real: String = ""
        for str in s {
            switch str {
            case "a"..."z", "A"..."Z", "0"..."9":
                real.append(String(str).lowercased())
            default:
                continue
            }
        }
        
        return real == String(real.reversed())
    }
}

let s = Solution()
let input1 = "A man, a plan, a canal: Panama"
let input2 = "race a car"
let result = s.isPalindrome(input1)
print(result)

assert(s.isPalindrome(input1) == true)
assert(s.isPalindrome(input2) == false)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

