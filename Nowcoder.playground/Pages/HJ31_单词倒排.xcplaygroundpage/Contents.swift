/**
 https://www.nowcoder.com/practice/81544a4989df4109b33c2d65037c5836?tpId=37&&tqId=38366&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 对字符串中的所有单词进行倒排。

 说明：

 1、构成单词的字符只有26个大写或小写英文字母；

 2、非构成单词的字符均视为单词间隔符；

 3、要求倒排后的单词间隔符以一个空格表示；如果原字符串中相邻单词间有多个间隔符时，倒排转换后也只允许出现一个空格间隔符；

 4、每个单词最长20个字母；

 输入描述：
 输入一行以空格来分隔的句子

 输出描述：
 输出句子的逆序

 示例1
 输入：
 I am a student
 复制
 输出：
 student a am I
 复制
 示例2
 输入：
 $bo*y gi!r#l
 复制
 输出：
 l r gi y bo

 */

import Foundation

while let line = readLine() {
    
    let array = line.components(separatedBy: " ").reversed()
    var res: [String] = [String]()
    for ele in array {
        var isNeedReverse: Bool = false
        var realEle: [String] = [String]()
        for e in ele {
            switch e {
            case "a"..."z", "A"..."Z":
                realEle.append(String(e))
            default:
                realEle.append(" ")
                isNeedReverse = true
            }
        }
        
        let resultEle = realEle.joined(separator: "").components(separatedBy: " ")
        
        let finalEle = isNeedReverse ? resultEle.reversed() : resultEle
        res.append(finalEle.joined(separator: " "))
    }
    
    print(res.joined(separator: " "))
}
