/**
 https://www.nowcoder.com/practice/2aa32b378a024755a3f251e75cbf233a?tpId=37&&tqId=21252&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 1、对输入的字符串进行加解密，并输出。

 2、加密方法为：

 当内容是英文字母时则用该英文字母的后一个字母替换，同时字母变换大小写,如字母a时则替换为B；字母Z时则替换为a；

 当内容是数字时则把该数字加1，如0替换1，1替换2，9替换0；

 其他字符不做变化。

 3、解密方法为加密的逆过程。


 本题含有多组样例输入。
 输入描述：
 输入说明
 输入一串要加密的密码
 输入一串加过密的密码

 输出描述：
 输出说明
 输出加密后的字符
 输出解密后的字符

 示例1
 输入：
 abcdefg
 BCDEFGH

 输出：
 BCDEFGH
 abcdefg
 */

import Foundation

/// 加密字典
public let encryptDict: [Character: Character] = [
    "0": "1", "1": "2", "2": "3", "3": "4", "4": "5", "5": "6", "6": "7", "7": "8", "8": "9", "9": "0", "A": "b", "B": "c", "C": "d", "D": "e", "E": "f", "F": "g", "G": "h", "H": "i", "I": "j", "J": "k", "K": "l", "L": "m", "M": "n", "N": "o", "O": "p", "P": "q", "Q": "r", "R": "s", "S": "t", "T": "u", "U": "v", "V": "w", "W": "x", "X": "y", "Y": "z", "Z": "a", "a": "B", "b": "C", "c": "D", "d": "E", "e": "F", "f": "G", "g": "H", "h": "I", "i": "J", "j": "K", "k": "L", "l": "M", "m": "N", "n": "O", "o": "P", "p": "Q", "q": "R", "r": "S", "s": "T", "t": "U", "u": "V", "v": "W", "w": "X", "x": "Y", "y": "Z", "z": "A"
]

/// 解密字典
public let decodeDict: [Character: Character] = [
    "0": "9", "1": "0", "2": "1", "3": "2", "4": "3", "5": "4", "6": "5", "7": "6", "8": "7", "9": "8", "A": "z", "B": "a", "C": "b", "D": "c", "E": "d", "F": "e", "G": "f", "H": "g", "I": "h", "J": "i", "K": "j", "L": "k", "M": "l", "N": "m", "O": "n", "P": "o", "Q": "p", "R": "q", "S": "r", "T": "s", "U": "t", "V": "u", "W": "v", "X": "w", "Y": "x", "Z": "y", "a": "Z", "b": "A", "c": "B", "d": "C", "e": "D", "f": "E", "g": "F", "h": "G", "i": "H", "j": "I", "k": "J", "l": "K", "m": "L", "n": "M", "o": "N", "p": "O", "q": "P", "r": "Q", "s": "R", "t": "S", "u": "T", "v": "U", "w": "V", "x": "W", "y": "X", "z": "Y"
]

func encrypt(_ str: String) -> String {
    var pwd: String = ""
    for s in str {
        let val = encryptDict[s]
        if let v = val {
            pwd.append(String(v))
        }
    }
    return pwd
}

func decode(_ str: String) -> String {
    var pwd: String = ""
    for s in str {
        let val = decodeDict[s]
        if let v = val {
            pwd.append(String(v))
        }
    }
    return pwd
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let preEncrypt = "abcdefg"
    let preDecode = "BCDEFGH"
    print(encrypt(preEncrypt))
    print(decode(preDecode))
} else {
    while let preEncrypt = readLine(), let preDecode = readLine() {
        print(encrypt(preEncrypt))
        print(decode(preDecode))
    }
}

assert(encrypt("abcdefg") == "BCDEFGH")
assert(decode("BCDEFGH") == "abcdefg")
