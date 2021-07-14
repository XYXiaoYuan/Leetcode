/**
 https://www.nowcoder.com/practice/a35ce98431874e3a820dbe4b2d0508b1?tpId=37&&tqId=21225&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 写出一个程序，接受一个由字母、数字和空格组成的字符串，和一个字母，然后输出输入字符串中该字母的出现次数。不区分大小写，字符串长度小于500。

 输入描述：
 第一行输入一个由字母和数字以及空格组成的字符串，第二行输入一个字母。

 输出描述：
 输出输入字符串中含有该字符的个数。

 示例1
 输入：
 ABCabc
 A
 复制
 输出：
 2
 复制
 */

import Foundation

let str = (readLine() ?? "").lowercased()
let key = (readLine() ?? "").lowercased()

var count: Int = 0

for c in str {
    if String(c) == key {
        count += 1
    }
}

print(count)
