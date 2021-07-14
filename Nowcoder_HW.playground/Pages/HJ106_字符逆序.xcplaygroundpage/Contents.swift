/**
 https://www.nowcoder.com/practice/cc57022cb4194697ac30bcb566aeb47b?tpId=37&&tqId=21329&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 将一个字符串str的内容颠倒过来，并输出。str的长度不超过100个字符。


 输入描述：
 输入一个字符串，可以有空格

 输出描述：
 输出逆序的字符串

 示例1
 输入：
 I am a student
 复制
 输出：
 tneduts a ma I
 复制

 
 */

import Foundation
 
while let line = readLine() {
    let result = line.reversed()
    print(String(result))
}


