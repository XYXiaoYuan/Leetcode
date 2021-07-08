/**
 https://www.nowcoder.com/practice/24e6243b9f0446b081b1d6d32f2aa3aa?tpId=37&&tqId=21326&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 Redraiment是走梅花桩的高手。Redraiment可以选择任意一个起点，从前到后，但只能从低处往高处的桩子走。他希望走的步数最多，你能替Redraiment研究他最多走的步数吗？

 本题含有多组样例输入


 输入描述：
 输入多组数据，1组有2行，第1行先输入数组的个数，第2行再输入梅花桩的高度

 输出描述：
 一组输出一个结果

 示例1
 输入：
 6
 2 5 1 5 4 5
 3
 3 2 1

 输出：
 3
 1

 说明：
 6个点的高度各为 2 5 1 5 4 5
 如从第1格开始走,最多为3步, 2 4 5
 从第2格开始走,最多只有1步,5
 而从第3格开始走最多有3步,1 4 5
 从第5格开始走最多有2步,4 5
 所以这个结果是3。
 
 */

import Foundation

func redraimentMoveWays(_ num: Int, _ heights: [Int]) -> Int {
    
    var dp: [Int] = [Int].init(repeating: 1, count: num)
    
    for i in 0..<num {
//        print("i = \(i)")
        for j in 0..<i {
//            print("j = \(j)")
            if heights[j] < heights[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
        
//        print("🐧 \n")
    }
            
    return dp.max() ?? 1
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let num = 6
    let heights: [Int] = [2, 5, 1, 5, 4, 5]
    let result = redraimentMoveWays(num, heights)
    print(result)
} else {
    while let line1 = readLine(), let num = Int(line1), let line2 = readLine() {
        let line2Arr: [String] = line2.components(separatedBy: " ")
        var heights: [Int] = [Int]()
        for item in line2Arr {
            if let num = Int(item) {
                heights.append(num)
            }
        }
        let result = redraimentMoveWays(num, heights)
        print(result)
    }
}

assert(redraimentMoveWays(6, [2, 5, 1, 5, 4, 5]) == 3)
assert(redraimentMoveWays(3, [3, 2, 1]) == 1)
assert(redraimentMoveWays(30, [186, 13, 322, 264, 328, 110, 120, 73, 20, 35, 240, 97, 150, 221, 284, 324, 46, 219, 239, 284, 128, 251, 298, 319, 304, 36, 144, 236, 163, 122]) == 10)
assert(redraimentMoveWays(98, [243, 277, 172, 222, 127, 70, 34, 1, 261, 277, 10, 151, 29, 159, 318, 16, 50, 41, 309, 315, 303, 47, 5, 257, 246, 32, 105, 96, 199, 304, 194, 7, 218, 158, 239, 244, 58, 9, 250, 326, 210, 194, 312, 281, 244, 79, 170, 316, 64, 291, 139, 178, 35, 299, 322, 21, 238, 54, 102, 105, 75, 17, 187, 55, 290, 115, 165, 51, 155, 107, 136, 112, 270, 164, 15, 26, 142, 158, 312, 31, 165, 262, 214, 1, 67, 213, 88, 283, 198, 95, 37, 317, 43, 301, 269, 25, 228, 321]) == 18)
