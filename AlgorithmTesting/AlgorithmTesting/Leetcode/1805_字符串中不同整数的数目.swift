/**
 https://leetcode-cn.com/problems/number-of-different-integers-in-a-string/
 
 给你一个字符串 word ，该字符串由数字和小写英文字母组成。

 请你用空格替换每个不是数字的字符。例如，"a123bc34d8ef34" 将会变成 " 123  34 8  34" 。注意，剩下的这些整数为（相邻彼此至少有一个空格隔开）："123"、"34"、"8" 和 "34" 。

 返回对 word 完成替换后形成的 不同 整数的数目。

 只有当两个整数的 不含前导零 的十进制表示不同， 才认为这两个整数也不同。

  

 示例 1：

 输入：word = "a123bc34d8ef34"
 输出：3
 解释：不同的整数有 "123"、"34" 和 "8" 。注意，"34" 只计数一次。
 示例 2：

 输入：word = "leet1234code234"
 输出：2
 示例 3：

 输入：word = "a1b01c001"
 输出：1
 解释："1"、"01" 和 "001" 视为同一个整数的十进制表示，因为在比较十进制值时会忽略前导零的存在。
  

 提示：

 1 <= word.length <= 1000
 word 由数字和小写英文字母组成


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-different-integers-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Darwin

public class _1805_字符串中不同整数的数目 {
//class Solution {
    public init() {}

    public func numDifferentIntegers(_ word: String) -> Int {
        let letters = word.map { "\($0)" }
        var set: Set<String> = Set<String>()
        var mystack: Stack<String> = Stack<String>()
        
        for letter in letters {
            if isDigital(letter) {
                if let first = mystack.first, first == "0", !mystack.isEmpty {
                    mystack.pop()
                }
                mystack.push(letter)
            }
            
            if !isDigital(letter), !mystack.isEmpty {
                set.insert(mystack.toString())
                mystack.removeAll()
            }
        }

        if !mystack.isEmpty, mystack.toString() != "" {
            set.insert(mystack.toString())
        }
        
        return set.count
    }
    
    private func isDigital(_ s: String) -> Bool {
        guard let _ = Int(s) else { return false }
        return true
    }
}

//do {
//    let s = _1805_字符串中不同整数的数目()
//    let result = s.numDifferentIntegers("a123bc34d8ef34")
//    print(result)
//    assert(result == 3)
//}
//
//do {
//    let s = _1805_字符串中不同整数的数目()
//    let result = s.numDifferentIntegers("leet1234code234")
//    print(result)
//    assert(result == 2)
//}
//
//do {
//    let s = _1805_字符串中不同整数的数目()
//    let result = s.numDifferentIntegers("a1b01c001")
//    print(result)
//    assert(result == 1)
//}
