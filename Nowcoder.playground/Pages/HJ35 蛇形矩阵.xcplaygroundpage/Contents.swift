
/**
 描述
 蛇形矩阵是由1开始的自然数依次排列成的一个矩阵上三角形。

 例如，当输入5时，应该输出的三角形为：

 1 3 6 10 15

 2 5 9 14

 4 8 13

 7 12

 11


 请注意本题含有多组样例输入。

 输入描述：
 输入正整数N（N不大于100）

 输出描述：
 输出一个N行的蛇形矩阵。

 示例1
 输入：
 4
 
 输出：
 1 3 6 10
 2 5 9
 4 8
 7

 */
import Foundation

func snackMatrix(_ num: Int) -> String {
    var res: String = ""
    for i in 1...num {
        for j in 1..<(num - (i - 1)) {
            let n = j + i
            let val = ((n - 1) * (n - 1) + n - 1) / 2 - (i - 1)
            res.append("\(val) ")
//            print("val=\(val) --- res=\(res)")
        }
        let v = ((num * num) + num) / 2 - (i - 1)
        res.append("\(v) \n")
//        print("v=\(v) --- res=\(res)")
    }
    
    return res
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let num = 5
    let result = snackMatrix(num)
    print(result)
} else {
    while let line = readLine(), let num = Int(line) {
        let result = snackMatrix(num)
        print(result)
    }
}

assert(snackMatrix(4) == """
1 3 6 10
2 5 9
4 8
7
"""
)

assert(snackMatrix(5) == """
1 3 6 10 15
2 5 9 14
4 8 13
7 12
11
"""
)
