/**
 https://www.nowcoder.com/practice/f792cb014ed0474fb8f53389e7d9c07f?tpId=37&&tqId=21323&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 功能:等差数列 2，5，8，11，14。。。。

 输入:正整数N >0

 输出:求等差数列前N项和

 本题为多组输入，请使用while(cin>>)等形式读取数据

 输入描述：
 输入一个正整数。

 输出描述：
 输出一个相加后的整数。

 示例1
 输入：
 2

 输出：
 7

 */

import Foundation

/// 通项公式
func foo(_ n: Int) -> Int {
    return 2 + (n - 1) * 3
}

func arithmeticProgression(_ n: Int) -> Int {
    
    let result = n * 2 + 3 * n * (n - 1) / 2

    return result
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let num = 2
    let result = arithmeticProgression(num)
    print(result)
} else {
    while let line = readLine(), let num = Int(line) {
        let result = arithmeticProgression(num)
        print(result)
    }
}

assert(arithmeticProgression(2) == 7)
