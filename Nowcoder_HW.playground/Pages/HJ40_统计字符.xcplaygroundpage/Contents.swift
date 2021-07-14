/**
 https://www.nowcoder.com/practice/539054b4c33b4776bc350155f7abd8f5?tpId=37&&tqId=21263&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一行字符，分别统计出包含英文字母、空格、数字和其它字符的个数。

 本题包含多组输入。


 输入描述：
 输入一行字符串，可以有空格

 输出描述：
 统计其中英文字符，空格字符，数字字符，其他字符的个数

 示例1
 输入：
 1qazxsw23 edcvfr45tgbn hy67uj m,ki89ol.\\/;p0-=\\][
 复制
 输出：
 26
 3
 10
 12
 复制

 */

import Foundation

while let line = readLine() {
    
    var letter: Int = 0
    var space: Int = 0
    var digit: Int = 0
    var other: Int = 0
    
    for s in line {
        switch s {
        case "a"..."z", "A"..."Z":
            letter += 1
        case " ":
            space += 1
        case "0"..."9":
            digit += 1
        default:
            other += 1
        }
    }
    
    print(letter)
    print(space)
    print(digit)
    print(other)
}

