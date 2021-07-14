/**
 https://www.nowcoder.com/practice/3350d379a5d44054b219de7af6708894?tpId=37&&tqId=21317&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 请实现一个计票统计系统。你会收到很多投票，其中有合法的也有不合法的，请统计每个候选人得票的数量以及不合法的票数。
 本题有多组样例输入。
 输入描述：
 输入候选人的人数n，第二行输入n个候选人的名字（均为大写字母的字符串），第三行输入投票人的人数，第四行输入投票。

 输出描述：
 按照输入的顺序，每行输出候选人的名字和得票数量，最后一行输出不合法的票数。

 示例1
 输入：
 4
 A B C D
 8
 A D E CF A GG A B
 复制
 输出：
 A : 3
 B : 1
 C : 0
 D : 1
 Invalid : 3
 复制

 */

import Foundation

typealias Tuple = (count: Int, index: Int)

func vote(_ str1: String, _ str2: String) -> String {
    let candidates = str1.split(separator: " ")
    let input = str2.split(separator: " ")
    
    var result: [String: Tuple] = [String: Tuple]()
    var invalid: Int = 0
    for (index, item) in candidates.enumerated() {
        result[String(item)] = (count: 0, index: index)
    }
    
    for ele in input {
        let key = String(ele)
        if var val = result[key] {
            val.count += 1
            result[key] = val
        } else {
            invalid += 1
        }
    }
    let res = result.sorted { (element1, element2) in
        return element1.value.index < element2.value.index
    }.map { "\($0.key) : \($0.value.count)" }.joined(separator: "\n")
    
    return res.appending("\nInvalid : \(invalid)")
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let candidate = "QZRLN NZJTUTJNNR KWEPEOKZOP H KLNFMTQH SQEJRPMY HKEIRJOLC POCUWG W MDBRLUDBL"
    let input = "H Z KWEPEOKZOP NZJTUTJNNR QZRLN NZJTUTJNNR Z Z H H NZJTUTJNNR KLNFMTQH MDBRLUDBL W Z MDBRLUDBL POCUWG SQEJRPMY Z NZJTUTJNNR H KLNFMTQH W KLNFMTQH W Z H MDBRLUDBL Z H KLNFMTQH KLNFMTQH QZRLN QZRLN QZRLN W KLNFMTQH KWEPEOKZOP QZRLN KWEPEOKZOP HKEIRJOLC SQEJRPMY H KWEPEOKZOP H HKEIRJOLC H SQEJRPMY Z KLNFMTQH H H POCUWG POCUWG W QZRLN W NZJTUTJNNR HKEIRJOLC H NZJTUTJNNR H HKEIRJOLC NZJTUTJNNR KWEPEOKZOP SQEJRPMY H NZJTUTJNNR NZJTUTJNNR HKEIRJOLC POCUWG QZRLN W"
    let result = vote(candidate, input)
    print(result)
} else {
    while let line1 = readLine(), let num = Int(line1),
          let line2 = readLine(),
          let line3 = readLine(),
          let line4 = readLine() {
//        var candidate: [Int] = [Int]()
        let result = vote(line2, line4)
        print(result)
    }
}

// 输入
"""
2
JSAGKLXB KARXHSRFA
59
KARXHSRFA JSAGKLXB Y Y Y KARXHSRFA JSAGKLXB Y KARXHSRFA JSAGKLXB Y Y JSAGKLXB KARXHSRFA KARXHSRFA JSAGKLXB Y Y KARXHSRFA JSAGKLXB JSAGKLXB JSAGKLXB JSAGKLXB Y KARXHSRFA Y Y Y JSAGKLXB KARXHSRFA JSAGKLXB KARXHSRFA JSAGKLXB Y JSAGKLXB Y KARXHSRFA Y Y KARXHSRFA KARXHSRFA KARXHSRFA KARXHSRFA KARXHSRFA JSAGKLXB Y JSAGKLXB Y Y Y Y JSAGKLXB Y JSAGKLXB Y KARXHSRFA Y Y Y


10
QZRLN NZJTUTJNNR KWEPEOKZOP H KLNFMTQH SQEJRPMY HKEIRJOLC POCUWG W MDBRLUDBL
73
H Z KWEPEOKZOP NZJTUTJNNR QZRLN NZJTUTJNNR Z Z H H NZJTUTJNNR KLNFMTQH MDBRLUDBL W Z MDBRLUDBL POCUWG SQEJRPMY Z NZJTUTJNNR H KLNFMTQH W KLNFMTQH W Z H MDBRLUDBL Z H KLNFMTQH KLNFMTQH QZRLN QZRLN QZRLN W KLNFMTQH KWEPEOKZOP QZRLN KWEPEOKZOP HKEIRJOLC SQEJRPMY H KWEPEOKZOP H HKEIRJOLC H SQEJRPMY Z KLNFMTQH H H POCUWG POCUWG W QZRLN W NZJTUTJNNR HKEIRJOLC H NZJTUTJNNR H HKEIRJOLC NZJTUTJNNR KWEPEOKZOP SQEJRPMY H NZJTUTJNNR NZJTUTJNNR HKEIRJOLC POCUWG QZRLN W
"""

// 结果
"""
JSAGKLXB : 17
KARXHSRFA : 16
Invalid : 26


QZRLN : 7
NZJTUTJNNR : 9
KWEPEOKZOP : 5
H : 14
KLNFMTQH : 7
SQEJRPMY : 4
HKEIRJOLC : 5
POCUWG : 4
W : 7
MDBRLUDBL : 3
Invalid : 8
"""

//H : 14
//HKEIRJOLC : 5
//KLNFMTQH : 7
//KWEPEOKZOP : 5
//MDBRLUDBL : 3
//NZJTUTJNNR : 9
//POCUWG : 4
//QZRLN : 7
//SQEJRPMY : 4
//W : 7
//Invalid : 8
