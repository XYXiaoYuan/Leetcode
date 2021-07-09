/**
 https://www.nowcoder.com/practice/9af744a3517440508dbeb297020aca86?tpId=37&&tqId=21316&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入int型数组，询问该数组能否分成两组，使得两组中各元素加起来的和相等，并且，所有5的倍数必须在其中一个组中，所有3的倍数在另一个组中（不包括5的倍数），能满足以上条件，输出true；不满足时输出false。
 本题含有多组样例输入。
 输入描述：
 第一行是数据个数，第二行是输入的数据

 输出描述：
 返回true或者false

 示例1
 输入：
 4
 1 5 -5 1
 3
 3 5 8

 输出：
 true
 false

 说明：
 第一个样例：
 第一组：5 -5 1
 第二组：1
 第二个样例：由于3和5不能放在同一组，所以不存在一种分法。
 
*/

import Foundation

func arrayGroup(_ line: String) -> Bool {
    let items = line.split(separator: " ")
    var nums: [Int] = [Int]()
    for ele in items {
        if let val = Int(ele) {
            nums.append(val)
        }
    }
    
    var sum: Int = 0
    
    var sum5: Int = 0
    var sum3: Int = 0
    var list: [Int] = [Int]()
    for cur in nums {
        if cur % 5 == 0 {
            sum5 += cur
        } else if cur % 3 == 0 {
            sum3 += cur
        } else {
            list.append(cur)
        }
        sum += cur
    }
    
    if sum & 1 == 1 {
        return false
    }
        
    let target = sum / 2 - sum5
    print("list = \(list) -- target = \(target)")
    
    return helper(left: 0, list: list, target: target)
}

func helper(left: Int, list: [Int], target: Int) -> Bool {
    if left == list.count { return target == 0 }
    return helper(left: left + 1, list: list, target: target - list[left]) ||
           helper(left: left + 1, list: list, target: target)
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let line = "5, -5"
    let result = arrayGroup(line)
    print(result)
} else {
    while let line1 = readLine(), let _ = Int(line1), let line2 = readLine() {
        let result = arrayGroup(line2)
        print(result)
    }
}

assert(arrayGroup("5 -5") == true)
assert(arrayGroup("-2 2") == true)
assert(arrayGroup("1 5 -5 1") == true)
assert(arrayGroup("3 8 8 5 14") == true)
assert(arrayGroup("3 4 5 7 8 17") == true)
assert(arrayGroup("1 -5 5 3 2 1 -2 -5 -2") == true)
assert(arrayGroup("-2 0 -3 3 -3 -4 -3 1 3 3 -2 0 3 2 2 -5 1 -2 -3 -5") == true)
assert(arrayGroup("3 0 1 3 -2 -1 4 -2 -1 5 0 -2 -2") == true)
assert(arrayGroup("3 5 8") == false)
assert(arrayGroup("3 5 -1 -7") == false)
assert(arrayGroup("2 -3 5 5 -4 -4 5") == false)
//let items = "2 -3 5 5 -4 -4 5 ".split(separator: " ")
//var nums: [Int] = [Int]()
//for i in 0..<7 {
//    if let val = Int(items[i") {
//        nums.append(val)
//    }
//}
//print(nums)
