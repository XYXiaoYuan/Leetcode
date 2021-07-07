/**
 https://www.nowcoder.com/practice/1364723563ab43c99f3d38b5abef83bc?tpId=37&&tqId=21265&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 Jessi初学英语，为了快速读出一串数字，编写程序将数字转换成英文：

 如22：twenty two，123：one hundred and twenty three。


 说明：

 数字为正整数，长度不超过九位，不考虑小数，转化结果为英文小写；

 输出格式为twenty two；

 非法数据请返回“error”；

 关键字提示：and，billion，million，thousand，hundred。


 本题含有多组输入数据。


 输入描述：
 输入一个long型整数

 输出描述：
 输出相应的英文写法

 示例1
 输入：
 2356
 
 输出：
 two thousand three hundred and fifty six

 */

import Foundation

/// 分解一个数的每位数
/// - Parameter number: 传进来的数字
/// - Returns: 一个数的 每位数 逆序数字数组
func itoa(_ number: Int) -> [Int] {
    var n = number
    
    var result: [Int] = [Int]()
    if n < 0 {
        n = abs(n)
    }
    while n >= 10 {
        result.append(n % 10)
        n /= 10
    }
    result.append(n)
    
    return result
}

public let unitsDigitDict: [Int: String] = [
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirten",
    14: "fourten",
    15: "fifteen",
    16: "sixten",
    17: "seventen",
    18: "eighten",
    19: "nineten"
]

public let tensDigitDict: [Int: String] = [
    2: "twenty",
    3: "thirty",
    4: "forty",
    5: "fifty",
    6: "sixty",
    7: "seventy",
    8: "eighty",
    9: "ninety"
]


/// 分解大数字
/// - Parameters:
///   - num: 数字
///   - modNumber: 被mod的数
///   - units: 单位
///   - isHundred: 是否是过百的数
/// - Returns: 对应对应的英文描述
func parasBig(_ num: Int, modNumber: Int, units: String, isHundred: Bool = false) -> String {
    let x = num / modNumber;
    let y = num % modNumber;
    if y != 0 {
        return parse(x) + " \(units) " + (isHundred ? "and " : "") + parse(y);
    } else {
        return parse(x) + " \(units)";
    }
}

/// 分解
/// - Parameter num: 数字
/// - Returns: 数字对应的英文
func parse(_ num: Int) -> String {
    if num > 0, num < 20 {
        return unitsDigitDict[num]!
    }
    else if num >= 20, num < 100 {
        let x = num / 10
        let y = num % 10
        if y != 0 {
            return "\(tensDigitDict[x]!) " + parse(y)
        } else {
            return tensDigitDict[x]!
        }
    }
    else if num >= 100, num < 1000 {
        return parasBig(num, modNumber: 100, units: "hundred", isHundred: true)
    }
    else if num >= 1000, num < 100_0000 {
        return parasBig(num, modNumber: 1000, units: "thousand")
    }
    else if num >= 100_0000, num < 1_0000_0000 {
        return parasBig(num, modNumber: 100_0000, units: "million")
    }
    else {
        let delta = 10_0000 * 10000
        return parasBig(num, modNumber: delta, units: "billion")
    }
}

func learnEnglish(_ num: Int) -> String {
    let result = parse(num)
    return result
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let num = 2356
    let result = learnEnglish(num)
    print(result)
} else {
    while let line = readLine(), let num = Int(line) {
        let result = learnEnglish(num)
        print(result)
    }
}

assert(learnEnglish(2356) == "two thousand three hundred and fifty six")
