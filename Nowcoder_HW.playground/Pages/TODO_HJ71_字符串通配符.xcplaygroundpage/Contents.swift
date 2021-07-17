/**
 描述
 问题描述：在计算机中，通配符一种特殊语法，广泛应用于文件搜索、数据库、正则表达式等领域。现要求各位实现字符串通配符的算法。
 要求：
 实现如下2个通配符：
 *：匹配0个或以上的字符（字符由英文字母和数字0-9组成，下同）
 ？：匹配1个字符

 注意：匹配时不区分大小写。

 输入：
 通配符表达式；
 一组字符串。
 输出：

 返回不区分大小写的匹配结果，匹配成功输出true，匹配失败输出false

 本题含有多组样例输入！
 输入描述：
 先输入一个带有通配符的字符串，再输入一个需要匹配的字符串

 输出描述：
 返回不区分大小写的匹配结果，匹配成功输出true，匹配失败输出false

 示例1
 输入：
 te?t*.*
 txt12.xls
 
 输出：
 false
 
 示例2
 输入：
 z
 zz
 
 输出：
 false
 
 示例3
 输入：
 pq
 pppq
 
 输出：
 false
 
 示例4
 输入：
 **Z
 0QZz
 
 输出：
 true
 
 示例5
 输入：
 ?*Bc*?
 abcd
 
 输出：
 true
 
 示例6
 输入：
 p*p*qp**pq*p**p***ppq
 pppppppqppqqppqppppqqqppqppqpqqqppqpqpppqpppqpqqqpqqp
 
 输出：
 false
 
 */

import Foundation

func stringMatch(_ regex: String, _ target: String) -> Bool {
    if target.count == 0 {
        return regex.count == 0
    }
    var matchRes = [[Bool]](repeating: [Bool](repeating: false, count: target.count + 1), count:regex.count + 1)
    matchRes[0][0] = true
    
    let s = Array(regex)
    let p = Array(target)
    
    for i in 1...p.count where p[i - 1] == "*" {
        matchRes[0][i] = matchRes[0][i - 1]
    }
    
    if String(s) == "" {
        return matchRes[0][p.count]
    }
    
    for i in 1...s.count {
        for j in 1...p.count {
            if p[j - 1] == "*" {
                matchRes[i][j] = matchRes[i][j - 1] || matchRes[i - 1][j]
            }
            else if s[i - 1] == p[j - 1] || p[j - 1] == "?" {
                matchRes[i][j] = matchRes[i - 1][j - 1]
            }
            
        }
    }
    return matchRes[s.count][p.count]
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let regex = "te?t*.*"
    let target = "txt12.xls"
    let result = stringMatch(regex.lowercased(), target.lowercased())
    print(result)
} else {
    while let regex = readLine(), let target = readLine() {
        let result = stringMatch(regex.lowercased(), target.lowercased())
        print(result)
    }
}

// assert(stringMatch("te?t*.*", "txt12.xls") == false)
// assert(stringMatch("Abc?123*d", "Abc3123we") == false)
// assert(stringMatch("te?t*123", "text1234") == false)
// assert(stringMatch("123*1235*", "1231234555555") == false)
// assert(stringMatch("*123", "13") == false)
// assert(stringMatch("t?t*1*.*", "txt12.xls") == true)
// assert(stringMatch("?*Bc*?", "abcd") == true)
// assert(stringMatch("a*?*c", "a@c") == false)
// assert(stringMatch("ab", "cab") == false)


