/**
 描述
 找出字符串中第一个只出现一次的字符





 输入描述：
 输入几个非空字符串

 输出描述：
 输出第一个只出现一次的字符，如果不存在输出-1

 示例1
 输入：
 asdfasdfo
 aabb

 输出：
 o
 -1

 
 */

import Foundation

func findFirstAppearOnce(_ line: String) -> String {
    
    let array: [String] = Array(line).map { "\($0)" }
    var flag: Bool = true

    var key: String = ""
    for a in array {
        var i = 0
        for b in array where a == b {
            i += 1
        }
        if 1 == i {
            key = String(a)
            flag = false
            break
        }
    }
    
    if flag {
        return "-1"
    }
    return key
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let line: String = "lbrnsepcfjzcpfgzqdiujo"
    
    let result = findFirstAppearOnce(line)
    print(result)
} else {
    while let line = readLine() {
        
        let result = findFirstAppearOnce(line)
        print(result)
    }
}

/// 一些测试用例的断言
assert(findFirstAppearOnce("asdfasdfo") == "o")
assert(findFirstAppearOnce("aabb") == "-1")
assert(findFirstAppearOnce("lbrnsepcfjzcpfgzqdiujo") == "l")
assert(findFirstAppearOnce("aabbccddeeff") == "-1")
