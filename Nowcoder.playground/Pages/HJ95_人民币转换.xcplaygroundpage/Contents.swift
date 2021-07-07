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

func rmbTransfer(_ money: Double) -> String {
    return "人民币"
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let money: Double = 151121.15
    let result = rmbTransfer(money)
    print(result)
} else {
    while let line = readLine(), let money = Double(line) {
        let result = rmbTransfer(money)
        print(result)
    }
}

assert(rmbTransfer(151121.15) == "人民币拾伍万壹仟壹佰贰拾壹元壹角伍分")
assert(rmbTransfer(10012.02) == "人民币壹万零拾贰元贰分")
