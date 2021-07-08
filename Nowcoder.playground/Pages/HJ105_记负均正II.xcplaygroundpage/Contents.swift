/**
 https://www.nowcoder.com/practice/64f6f222499c4c94b338e588592b6a62?tpId=37&&tqId=21328&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 从输入任意个整型数，统计其中的负数个数并求所有非负数的平均值，结果保留一位小数，如果没有非负数，则平均值为0
 本题有多组输入数据，输入到文件末尾，请使用while(cin>>)读入
 数据范围小于1e6
 输入描述：
 输入任意个整数，每行输入一个。

 输出描述：
 输出负数个数以及所有非负数的平均值

 示例1
 输入：
 -13
 -4
 -7
 复制
 输出：
 3
 0.0
 复制

 */

import Foundation

typealias Tuple = (negativeCount: Int, average: String)

func statisticsNegativeCountAndGetPostiveAverage(_ nums: [Int]) -> Tuple {
    
    var postives: [Int] = [Int]()
    var negativeCount: Int = 0
    for num in nums {
        if num > 0 {
            postives.append(num)
        } else {
            negativeCount += 1
        }
    }
    
    var average: Double = 0
    if postives.isEmpty == false {
        average = Double(postives.reduce(0, { $0 + $1 })) / Double(postives.count)
    }
    let avaerageStr = String(format: "%.1f", average)

    return (negativeCount: negativeCount, average: avaerageStr)
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let nums: [Int] = [
        -13,
        -4,
        -7
    ]
    let (negativeCount, average) = statisticsNegativeCountAndGetPostiveAverage(nums)
    print("\(negativeCount) \n\(average)")
} else {
    var nums: [Int] = [Int]()
    while let line = readLine(), let num = Int(line) {
        nums.append(num)
    }
    let (negativeCount, average) = statisticsNegativeCountAndGetPostiveAverage(nums)
    print("\(negativeCount) \n\(average)")
}

assert(statisticsNegativeCountAndGetPostiveAverage([
    -13,
    -4,
    -7
]) == (negativeCount: 3, average: "0.0"))

