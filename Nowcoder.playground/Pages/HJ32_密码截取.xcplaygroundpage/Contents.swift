/**
 https://www.nowcoder.com/practice/3cd4621963e8454594f00199f4536bb1?tpId=37&&tqId=21255&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 Catcher是MCA国的情报员，他工作时发现敌国会用一些对称的密码进行通信，比如像这些ABBA，ABA，A，123321，但是他们有时会在开始或结束时加入一些无关的字符以防止别国破解。比如进行下列变化 ABBA->12ABBA,ABA->ABAKK,123321->51233214　。因为截获的串太长了，而且存在多种可能的情况（abaaab可看作是aba,或baaab的加密形式），Cathcer的工作量实在是太大了，他只能向电脑高手求助，你能帮Catcher找出最长的有效密码串吗？

 本题含有多组样例输入。

 输入描述：
 输入一个字符串

 输出描述：
 返回有效密码串的最大长度

 示例1
 输入：
 ABBA
 复制
 输出：
 4
 复制
 */

import Foundation

while let line = readLine() {
    let n = line.count
    var str = [String]()
    for i in line {
        str.append(String(i))
    }
    var res = 0
    var j = 0
    var k = 0
    for i in 0..<n {
        // 偶数回文串
        j = i
        k = i + 1
        while j >= 0 && k < n && str[j] == str[k] {
            res = max(k - j + 1, res)
            j -= 1
            k += 1
        }
        // 奇数回文串
        j = i
        k = i
        while j >= 0 && k < n && str[j] == str[k] {
            res = max(k - j + 1, res)
            j -= 1
            k += 1
        }
    }
    print(res)
}
