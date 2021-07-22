/**
 https://www.nowcoder.com/practice/9999764a61484d819056f807d2a91f1e?tpId=37&&tqId=21273&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一个表达式（用字符串表示），求这个表达式的值。
 保证字符串中的有效字符包括[‘0’-‘9’],‘+’,‘-’, ‘*’,‘/’ ,‘(’， ‘)’,‘[’, ‘]’,‘{’ ,‘}’。且表达式一定合法。



 输入描述：
 输入一个算术表达式

 输出描述：
 得到计算结果

 示例1
 输入：
 3+2*{1+2*[-4/(8-6)+7]}
 复制
 输出：
 25
 复制
 */

import Foundation

fileprivate func isOperator(_ str: String) -> Bool {
    let operators = ["{", "}", "[", "]", "(", ")", "+", "-", "*", "/"]
    for op in operators where str == op {
        return true
    }
    return false
}

fileprivate func isDigital(_ str: String) -> Bool {
    let digitals = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    for digital in digitals where str == digital {
        return true
    }
    return false
}


func calculate(_ input: String) -> Int {
    let data = input.map {$0}
    let leng = input.count
    var stack: [Int] = Array(repeating: 0, count: 1000)
    var top = -1
    var flag = "+"
    var num = 0
    while (pos < leng) {
        if data[pos] == "{" || data[pos] == "[" || data[pos] == "(" {
            pos+=1
            num = calculate(input)
        }
        
        while (pos < leng && data[pos].isNumber) {
            let tmp = String(data[pos])
            num = num * 10 + (Int(tmp) ?? 0) - 0
            pos+=1
        }
        switch (flag) {
        case "+":
            top+=1
            stack[top] = num
        case "-":
            top+=1
            stack[top] = -num
        case "*":
            stack[top] *= num
        case "/":
            stack[top] /= num
        default:
            break
        }
        num = 0
        if pos >= leng {
            break
        }
        flag = String(data[pos])
        if data[pos] == "}" || data[pos] == "]" || data[pos] == ")" {
            pos+=1
            break
        }
        pos+=1
    }
    
    var res: Int = 0
    for i in 0...top {
        res += stack[i]
    }
    
    return res
}

/// 是否是Debug模式
var isDebug: Bool = true

var pos: Int = 0

if isDebug {
    pos = 0
    let input = "3+2*{1+2*[-4/(8-6)+7]}"
    let result = calculate(input)
    print(result)
} else {
    pos = 0
    while let input = readLine() {
        let result = calculate(input)
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

assert(calculate("3+2*{1+2*[-4/(8-6)+7]}") == 25)

