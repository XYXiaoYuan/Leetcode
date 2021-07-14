/**
 https://www.nowcoder.com/practice/74c493f094304ea2bda37d0dc40dc85b?tpId=37&&tqId=21295&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 
 描述
 公元前五世纪，我国古代数学家张丘建在《算经》一书中提出了“百鸡问题”：鸡翁一值钱五，鸡母一值钱三，鸡雏三值钱一。百钱买百鸡，问鸡翁、鸡母、鸡雏各几何？

 详细描述：

 接口说明

 原型：

 int GetResult(vector &list)

 输入参数：

         无

 输出参数（指针指向的内存区域保证有效）：

     list  鸡翁、鸡母、鸡雏组合的列表

 返回值：

      -1 失败

      0 成功

  

  

 输入描述：
 输入任何一个整数，即可运行程序。

 输出描述：
  

 示例1
 输入：
 1

 输出：
 0 25 75
 4 18 78
 8 11 81
 12 4 84
 */

import Foundation

/**
 解题思路：
 最多100只，
 鸡翁值5，设鸡翁i只，最多20只
 鸡母值3，设鸡母j只，最多33只
 鸡雏值1/3，设鸡雏k只，k = 100 - i - j
 判断条件：i*5 + j*3 + k/3 = 100，满足条件输出
 */

func hundredMoneyBuyChicken() -> String {
    
    var result: [String] = [String]()
    /// 公鸡最多20只
    for i in 0...20 {
        /// 母鸡最多33只
        for j in 0...33 {
            /// 小鸡的数量 100 - i - j
            let k = 100 - i - j
            if (i * 5 + j * 3 + k / 3) == 100, k % 3 == 0 {
                result.append("\(i) \(j) \(k)")
            }
        }
    }
    
    return result.joined(separator: "\n")
}

/**
 解题思路：
 最多100只，
 鸡翁值5，设鸡翁i只，取值0，1，2，……100-k
 鸡母值3，设鸡母j只，j = 100-k-i
 鸡雏值1/3，设鸡雏k只，取值0，3，6，9，……100，
 判断条件：i*5 + j*3 + k/3 = 100，满足条件输出
 */
func hundredMoneyBuyChicken1() -> String {
    
    var result: [String] = [String]()
    for k in stride(from: 0, through: 100, by: 3) {
        let ij = 100 - k
        for i in 0..<(ij + 1) {
            let j = ij - i
            if i * 5 + j * 3 + k / 3 == 100 {
                result.append("\(i) \(j) \(k)")
            }
        }
    }
    
    return result.joined(separator: "\n")
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let result = hundredMoneyBuyChicken()
    print(result)
} else {
    while let line = readLine(), let _ = Int(line) {
        let result = hundredMoneyBuyChicken()
        print(result)
    }
}
