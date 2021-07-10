/**
 https://www.nowcoder.com/practice/dbace3a5b3c4480e86ee3277f3fe1e85?tpId=37&&tqId=21299&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 验证尼科彻斯定理，即：任何一个整数m的立方都可以写成m个连续奇数之和。

 例如：

 1^3=1

 2^3=3+5

 3^3=7+9+11

 4^3=13+15+17+19

 输入一个正整数m（m≤100），将m的立方写成m个连续奇数之和的形式输出。
 本题含有多组输入数据。

 输入描述：
 输入一个int整数

 输出描述：
 输出分解后的string

 示例1
 输入：
 6
 复制
 输出：
 31+33+35+37+39+41

 */

import Foundation

while let line = readLine(), let number = Int(line) {
    
    let firstNum = number * (number - 1) + 1
    
    var res: [String] = [String]()
    for i in 0..<number {
        res.append(String(firstNum + i * 2))
    }
    let result = res.joined(separator: "+")
    print(result)
}
