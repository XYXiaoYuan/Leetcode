/**
 https://www.nowcoder.com/practice/dd0c6b26c9e541f5b935047ff4156309?tpId=37&&tqId=21324&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入整型数组和排序标识，对其元素按照升序或降序进行排序（一组测试用例可能会有多组数据）

 本题有多组输入，请使用while(cin>>)处理

 输入描述：
 第一行输入数组元素个数
 第二行输入待排序的数组，每个数用空格隔开
 第三行输入一个整数0或1。0代表升序排序，1代表降序排序

 输出描述：
 输出排好序的数字

 示例1
 输入：
 8
 1 2 4 9 3 55 64 25
 0
 5
 1 2 3 4 5
 1
 复制
 输出：
 1 2 3 4 9 25 55 64
 5 4 3 2 1
 复制

 */

import Foundation

func sortArray(_ nums: [Int], _ isDesc: Bool) -> String {
    
    let result = nums.sorted {
        if isDesc {
            return $0 > $1
        } else {
            return $0 < $1
        }
    }
    
    return result.map { "\($0)" }.joined(separator: " ")
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let line2 = "1 2 4 9 3 55 64 25"
    let temp = line2.split(separator: " ")
    var nums: [Int] = [Int]()
    for t in temp {
        if let val = Int(t) {
            nums.append(val)
        }
    }
    let result = sortArray(nums, false)
    print(result)
} else {
    while let line1 = readLine(), let _ = Int(line1),
          let line2 = readLine(),
          let line3 = readLine(), let isDesc = Bool(line3) {
        let temp = line2.split(separator: " ")
        var nums: [Int] = [Int]()
        for t in temp {
            if let val = Int(t) {
                nums.append(val)
            }
        }
        let result = sortArray(nums, isDesc)
        print(result)
    }
}
