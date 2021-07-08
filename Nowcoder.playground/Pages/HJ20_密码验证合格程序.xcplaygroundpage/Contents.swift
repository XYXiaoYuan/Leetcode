/**
 https://www.nowcoder.com/practice/184edec193864f0985ad2684fbc86841?tpId=37&&tqId=21243&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 密码要求:

 1.长度超过8位

 2.包括大小写字母.数字.其它符号,以上四种至少三种

 3.不能有相同长度大于2的子串重复

 输入描述：
 一组或多组长度超过2的字符串。每组占一行

 输出描述：
 如果符合要求输出：OK，否则输出NG

 示例1
 输入：
 021Abc9000
 021Abc9Abc1
 021ABC9000
 021$bc9000

 输出：
 OK
 NG
 NG
 OK

*/

import Foundation

func isValidPassword(_ pwd: String) -> Bool {
    let n = pwd.count
    // 长度大于 8
    guard n > 8 else { return false }
    let chars = Array(pwd)
    var map = [0, 0, 0, 0]
    for char in chars {
        if let val = char.asciiValue {
            switch val {
            case 48...57:      // 数字
                map[0] = 1
            case 65...97:     // 大写字母
                map[1] = 1
            case 97...122:    // 小写字母
                map[2] = 1
            default:
                map[3] = 1
            }
        }
    }
    // 包括大小写字母.数字.其它符号,以上四种至少三种
    let sum = map.reduce(0) { $0 + $1 }
    guard sum >= 3 else { return false }
    // 不能有相同长度大于2的子串重复
    for i in 0..<(n - 2) {
        let chars1 = chars[i..<(i + 3)].map { "\($0)" }.joined(separator: "")
        let subStr1 = chars1
        for j in i + 2..<(n - 1) {
            let chars2 = chars[j..<n].map { "\($0)" }.joined(separator: "")
            let subStr2 = chars2
            if subStr2.contains(subStr1) {
                return false
            }
        }
    }
    
    return true
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let line: String = "021Abc9000"
    let isValid = isValidPassword(line)
    if isValid {
        print("OK")
    } else {
        print("NG")
    }
} else {
    while let line = readLine() {
        let isValid = isValidPassword(line)
        if isValid {
            print("OK")
        } else {
            print("NG")
        }
    }
}

assert(isValidPassword("021Abc9000") == true)
assert(isValidPassword("021Abc9Abc1") == false)
assert(isValidPassword("021ABC9000") == false)
assert(isValidPassword("021$bc9000") == true)
