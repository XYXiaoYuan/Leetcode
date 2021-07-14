/**
 https://www.nowcoder.com/practice/9566499a2e1546c0a257e885dfdbf30d?tpId=37&&tqId=21277&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 给定一个字符串描述的算术表达式，计算出结果值。

 输入字符串长度不超过100，合法的字符包括”+, -, *, /, (, )”，”0-9”，字符串内容的合法性及表达式语法的合法性由做题者检查。本题目只涉及整型计算。

 输入描述：
 输入算术表达式

 输出描述：
 计算出结果值

 示例1
 输入：
 400+5
 复制
 输出：
 405
 复制
 */

var pos: Int = 0

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

while let input = readLine() {
    pos = 0
    let res = calculate(input)
    print("\(res)")
}
