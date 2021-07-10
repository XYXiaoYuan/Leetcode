/**
 https://www.nowcoder.com/practice/d3d8e23870584782b3dd48f26cb39c8f?tpId=37&&tqId=21253&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 按照指定规则对输入的字符串进行处理。

 详细描述：

 将输入的两个字符串合并。

 对合并后的字符串进行排序，要求为：下标为奇数的字符和下标为偶数的字符分别从小到大排序。这里的下标意思是字符在字符串中的位置。

 对排序后的字符串进行操作，如果字符为‘0’——‘9’或者‘A’——‘F’或者‘a’——‘f’，则对他们所代表的16进制的数进行BIT倒序的操作，并转换为相应的大写字符。如字符为‘4’，为0100b，则翻转后为0010b，也就是2。转换后的字符为‘2’； 如字符为‘7’，为0111b，则翻转后为1110b，也就是e。转换后的字符为大写‘E’。


 举例：输入str1为"dec"，str2为"fab"，合并为“decfab”，分别对“dca”和“efb”进行排序，排序后为“abcedf”，转换后为“5D37BF”

 注意本题含有多组样例输入


 输入描述：
 本题含有多组样例输入。每组样例输入两个字符串，用空格隔开。

 输出描述：
 输出转化后的结果。每组样例输出一行。

 示例1
 输入：
 dec fab
 复制
 输出：
 5D37BF
 复制
 */

import Foundation

while let line = readLine() {
    let parts = line.split(separator: " ")
    var str1 = [String]()
    for i in parts[0] {
        str1.append(String(i))
    }
    var str2 = [String]()
    for i in parts[1] {
        str2.append(String(i))
    }
    var ji = [String]()
    var ou = [String]()
    var totalStr = str1 + str2
    for i in 0..<totalStr.count {
        let s = totalStr[i]
        if i & 1 == 0 {
            ou.append(s)
        } else {
            ji.append(s)
        }
    }
    // 1.下标为奇数的字符和下标为偶数的字符分别从小到大排序
    ji.sort()
    ou.sort()
    // 偶数
    var o = 0
    // 奇数
    var j = 0
    for i in 0..<totalStr.count {
        if i & 1 == 0 {
            totalStr[i] = ou[o]
            o += 1
        } else {
            totalStr[i] = ji[j]
            j += 1
        }
    }
    var res = ""
    for i in totalStr {
        if isVaild(i) {
            // 2.十六进制字符转成十进制
            var num = Int(i, radix: 16)!
            // 3.十进制转成二进制字符，再反转
            var numStr = String(String(num, radix: 2).reversed())
            // 不够4位的补0
            while numStr.count < 4 {
                numStr += "0"
            }
            // 4.二进制字符串转成十进制数
            num = Int(numStr, radix: 2)!
            // 5.十进制再转回十六进制字符
            numStr = String(num, radix: 16).uppercased()
            res += numStr
        } else {
            res += i
        }
    }
    print(res)
}

func isVaild(_ s: String) -> Bool {
    return (s >= "0" && s <= "9") || (s >= "a" && s <= "f") || (s >= "A" && s <= "F")
}
