/**
 https://www.nowcoder.com/practice/00ffd656b9604d1998e966d555005a4b?tpId=37&&tqId=21318&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 考试题目和要点：

 1、中文大写金额数字前应标明“人民币”字样。中文大写金额数字应用壹、贰、叁、肆、伍、陆、柒、捌、玖、拾、佰、仟、万、亿、元、角、分、零、整等字样填写。

 2、中文大写金额数字到“元”为止的，在“元”之后，应写“整字，如532.00应写成“人民币伍佰叁拾贰元整”。在”角“和”分“后面不写”整字。

 3、阿拉伯数字中间有“0”时，中文大写要写“零”字，阿拉伯数字中间连续有几个“0”时，中文大写金额中间只写一个“零”字，如6007.14，应写成“人民币陆仟零柒元壹角肆分“。
 4、10应写作“拾”，100应写作“壹佰”。例如，1010.00应写作“人民币壹仟零拾元整”，110.00应写作“人民币壹佰拾元整”
 5、十万以上的数字接千不用加“零”，例如，30105000.00应写作“人民币叁仟零拾万伍仟元整”

 本题含有多组样例输入。

 输入描述：
 输入一个double数

 输出描述：
 输出人民币格式

 示例1
 输入：
 151121.15
 10012.02

 输出：
 人民币拾伍万壹仟壹佰贰拾壹元壹角伍分
 人民币壹万零拾贰元贰分

 */

import Foundation

public let unitsDigitDict: [Int: String] = [
    0: "零",
    1: "壹",
    2: "贰",
    3: "参",
    4: "肆",
    5: "伍",
    6: "陆",
    7: "柒",
    8: "捌",
    9: "玖",
    10: "拾",
]

public let bigUnitArray: [String] = ["","拾","佰","仟","万","拾","佰","仟","亿"]

///// 分解大数字
///// - Parameters:
/////   - num: 数字
/////   - modNumber: 被mod的数
/////   - units: 单位
/////   - isHundred: 是否是过百的数
///// - Returns: 对应对应的英文描述
//func parasBig(_ num: Int, modNumber: Int, units: String, isHundred: Bool = false) -> String {
//    let x = num / modNumber;
//    let y = num % modNumber;
//    if y != 0 {
//        return parse(x) + " \(units) " + (isHundred ? "and " : "") + parse(y);
//    } else {
//        return parse(x) + " \(units)";
//    }
//}
//
///// 分解
///// - Parameter num: 数字
///// - Returns: 数字对应的英文
//func parse(_ num: Int) -> String {
//    if num > 0, num < 20 {
//        return unitsDigitDict[num]!
//    }
//    else if num >= 20, num < 100 {
//        let x = num / 10
//        let y = num % 10
//        if y != 0 {
//            return "\(tensDigitDict[x]!) " + parse(y)
//        } else {
//            return tensDigitDict[x]!
//        }
//    }
//    else if num >= 100, num < 1000 {
//        return parasBig(num, modNumber: 100, units: "hundred", isHundred: true)
//    }
//    else if num >= 1000, num < 100_0000 {
//        return parasBig(num, modNumber: 1000, units: "thousand")
//    }
//    else if num >= 100_0000, num < 1_0000_0000 {
//        return parasBig(num, modNumber: 100_0000, units: "million")
//    }
//    else {
//        let delta = 10_0000 * 10000
//        return parasBig(num, modNumber: delta, units: "billion")
//    }
//}

func printBigMoney(_ moneyLInt: Int, _ moneyRArray: [String]) -> String {
    
    return ""
}

func printJiaoFen(_ zeros: [Int]) -> String {
    guard let jiao = zeros.first, let fen = zeros.last else {
        return ""
    }
    
    switch (jiao, fen) {
    case (0, 0):
        return "整"
    case (_, 0):
        if let j = unitsDigitDict[jiao] {
            return "\(j)角"
        }
    case (0, _):
        if let f = unitsDigitDict[fen] {
            return "\(f)分"
        }
    case (_, _):
        if let j = unitsDigitDict[jiao], let f = unitsDigitDict[fen] {
            return "\(j)角\(f)分"
        }
    }
    return ""
}

func rmbTransfer(_ money: String) -> String {
    let temp = money.split(separator: ".")
    
    guard let intValue = temp.first, let bigValue = Int(intValue),
          let zeroValue = temp.last else {
        return ""
    }
    
    print(String(bigValue))
    var ints: [String] = String(bigValue).map { unitsDigitDict[Int(String($0))!] ?? "" }
    
    let bigMoney: String = ""
    
    var zeros: [Int] = [Int]()
    for zero in zeroValue.map({ "\($0)" }) {
        if let value = Int(zero) {
            zeros.append(value)
        }
    }
    let jiaoFen = printJiaoFen(zeros)
    
    return "人民币" + bigMoney + jiaoFen
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let money: String = "151121.15"
    let result = rmbTransfer(money)
    print(result)
} else {
    while let line = readLine(), let _ = Double(line) {
        let result = rmbTransfer(line)
        print(result)
    }
}

//assert(rmbTransfer("151121.15") == "人民币拾伍万壹仟壹佰贰拾壹元壹角伍分")
//assert(rmbTransfer("10012.02") == "人民币壹万零拾贰元贰分")
assert(rmbTransfer("10.00") == "拾元")
assert(rmbTransfer("100.00") == "壹佰")
