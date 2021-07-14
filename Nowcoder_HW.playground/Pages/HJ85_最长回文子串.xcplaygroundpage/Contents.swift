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

func maxPalindromicLCSCount(_ s: String) -> Int {
    if s.isEmpty {
        return 0
    }
    let cs: [String] = s.map { "\($0)" }
    if cs.count <= 1 {
        return 1
    }
    
    // 最长回文子串的长度(至少是1)
    var maxLen: Int = 1
    // 最长回文子串的开始索引
    var begin: Int = 0
    
    var dp: [[Bool]] = Array.init(repeating: [Bool].init(repeating: false, count: cs.count), count: cs.count)
    
    // 从下到上(i由大到小)
    for i in stride(from: cs.count - 1, through: 0, by: -1) {
        // 从左到右(j由小到大)
        for j in 0..<cs.count {
            // cs[i, j]的长度
            let len = j - i + 1
            dp[i][j] = (cs[i] == cs[j]) && (len <= 2 || dp[i + 1][j - 1])
            
            if dp[i][j] && len > maxLen { // 说明cs[i, j]是回文串
                maxLen = len
                begin = i
            }
        }
    }
    
    return maxLen
    
    return 0
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str = "cdabbacc"
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

assert(maxPalindromicLCSCount("cdabbacc") == 4)

