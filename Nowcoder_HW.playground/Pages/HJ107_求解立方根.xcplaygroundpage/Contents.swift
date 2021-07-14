/**
 https://www.nowcoder.com/practice/caf35ae421194a1090c22fe223357dca?tpId=37&&tqId=21330&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 计算一个数字的立方根，不使用库函数。
 保留一位小数。


 输入描述：
 待求解参数，为double类型（一个实数）

 输出描述：
 输入参数的立方根。保留一位小数。

 示例1
 输入：
 216
 复制
 输出：
 6.0
 复制
 */

import Foundation

while let line = readLine(), let num = Double(line) {
    
    func cubert(n: Double) -> Double {
        var x: Double = 1.0
        let fang = x * x * x - n
        while abs(x * x * x - n) > 0.000001 {
            x = x - ((x * x * x - n) / (3 * x * x))
        }
        return x
    }
    
    let result = cubert(n: num)
    print(String.init(format: "%.1f", result))
}

