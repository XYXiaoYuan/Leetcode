/**
 https://www.nowcoder.com/practice/88ddd31618f04514ae3a689e83f3ab8e?tpId=37&&tqId=21322&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 自守数是指一个数的平方的尾数等于该数自身的自然数。例如：25^2 = 625，76^2 = 5776，9376^2 = 87909376。请求出n以内的自守数的个数


 接口说明


 /*
 功能: 求出n以内的自守数的个数


 输入参数：
 int n

 返回值：
 n以内自守数的数量。
 */


 public static int CalcAutomorphicNumbers( int n)
 {
 /*在这里实现功能*/

 return 0;
 }
 本题有多组输入数据，请使用while(cin>>)等方式处理


 输入描述：
 int型整数

 输出描述：
 n以内自守数的数量。

 示例1
 输入：
 2000

 输出：
 8
 */

import Foundation


func calcAutomorphicNumbers(_ num: Int) -> Int {
    
    var count: Int = 0
    var q: Int = 10

    for i in 0...num {
        if q <= i {
            q *= 10
        }
        
        if i * i % q == i {
            count += 1
        }
    }
    
    return count
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let num = 5
    let result = calcAutomorphicNumbers(num)
    print(result)
} else {
    while let line = readLine(), let num = Int(line) {
        let result = calcAutomorphicNumbers(num)
        print(result)
    }
}

assert(calcAutomorphicNumbers(2) == 2)
assert(calcAutomorphicNumbers(5) == 3)
assert(calcAutomorphicNumbers(7) == 4)
assert(calcAutomorphicNumbers(10) == 4)
assert(calcAutomorphicNumbers(2000) == 8)
assert(calcAutomorphicNumbers(10000) == 9)
