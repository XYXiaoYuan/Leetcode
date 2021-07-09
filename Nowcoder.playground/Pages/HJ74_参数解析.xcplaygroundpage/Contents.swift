/**
 https://www.nowcoder.com/practice/668603dc307e4ef4bb07bcd0615ea677?tpId=37&&tqId=21297&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 在命令行输入如下命令：

 xcopy /s c:\ d:\，

 各个参数如下：

 参数1：命令字xcopy

 参数2：字符串/s

 参数3：字符串c:\

 参数4: 字符串d:\

 请编写一个参数解析程序，实现将命令行各个参数解析出来。


 解析规则：

 1.参数分隔符为空格
 2.对于用""包含起来的参数，如果中间有空格，不能解析为多个参数。比如在命令行输入xcopy /s "C:\program files" "d:\"时，参数仍然是4个，第3个参数应该是字符串C:\program files，而不是C:\program，注意输出参数时，需要将""去掉，引号不存在嵌套情况。
 3.参数不定长
 4.输入由用例保证，不会出现不符合要求的输入


 输入描述：
 输入一行字符串，可以有空格

 输出描述：
 输出参数个数，分解后的参数，每个参数都独占一行

 示例1
 输入：
 xcopy /s c:\\ d:\\
 
 输出：
 4
 xcopy
 /s
 c:\\
 d:\\
 
 */

import Foundation

func parseParameter(_ str: String) -> String {
    
    var sb: String = ""
    var count: Int = 1
    var tagLeft: Bool = false
    for s in str {
        if s == "\"", tagLeft == false {
            tagLeft = true
            continue
        }
        
        if s == "\"", tagLeft == true {
            tagLeft = false
            continue
        }
        
        if tagLeft {
            sb.append(s)
            continue
        } else {
            if s == " " {
                sb.append("\n")
                count += 1
                continue
            }
            sb.append(s)
        }
        
    }
    
    return "\(count)\n" + sb
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str = "xcopy /s c:\\ d:\\"
    let result = parseParameter(str)
    print(result)
} else {
    while let line = readLine() {
        let result = parseParameter(line)
        print(result)
    }
}

