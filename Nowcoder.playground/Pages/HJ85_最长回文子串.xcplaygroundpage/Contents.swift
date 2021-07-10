/**
 https://www.nowcoder.com/practice/12e081cd10ee4794a2bd70c7d68f5507?tpId=37&&tqId=21308&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 给定一个仅包含小写字母的字符串，求它的最长回文子串的长度。
 所谓回文串，指左右对称的字符串。
 所谓子串，指一个字符串删掉其部分前缀和后缀（也可以不删）的字符串
 （注意：记得加上while处理多个测试用例）

 输入描述：
 输入一个仅包含小写字母的字符串

 输出描述：
 返回最长回文子串的长度

 示例1
 输入：
 cdabbacc

 输出：
 4

 说明：
 abba为最长的回文子串
 */

import Foundation

func maxPalindromicLCSCount(_ str: String) -> Int {
    return 0
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str = "abcdefghijklmnop"
    let result = maxPalindromicLCSCount(str)
    print(result)
} else {
    while let line = readLine() {
        let result = maxPalindromicLCSCount(line)
        print(result)
    }
}

/// 全局打印,发布时不触发, isDebug == false时不打印
public func dprint<T>(_ msg: T,
                      line: Int = #line) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}

assert(maxPalindromicLCSCount("asdfas") == 6)

