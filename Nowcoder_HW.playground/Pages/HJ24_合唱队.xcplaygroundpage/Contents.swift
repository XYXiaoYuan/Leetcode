/**
 https://www.nowcoder.com/practice/6d9d69e3898f45169a441632b325c7b4?tpId=37&&tqId=21247&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 计算最少出列多少位同学，使得剩下的同学排成合唱队形

 说明：

 N位同学站成一排，音乐老师要请其中的(N-K)位同学出列，使得剩下的K位同学排成合唱队形。
 合唱队形是指这样的一种队形：设K位同学从左到右依次编号为1，2…，K，他们的身高分别为T1，T2，…，TK，   则他们的身高满足存在i（1<=i<=K）使得T1<T2<......<Ti-1<Ti>Ti+1>......>TK。

 你的任务是，已知所有N位同学的身高，计算最少需要几位同学出列，可以使得剩下的同学排成合唱队形。


 注意：不允许改变队列元素的先后顺序 且 不要求最高同学左右人数必须相等
 请注意处理多组输入输出！

 备注：
 1<=N<=3000
 输入描述：
 有多组用例，每组都包含两行数据，第一行是同学的总数N，第二行是N位同学的身高，以空格隔开

 输出描述：
 最少需要几位同学出列

 示例1
 输入：
 8
 186 186 150 200 160 130 197 200
 复制
 输出：
 4
 复制
 说明：
 由于不允许改变队列元素的先后顺序，所以最终剩下的队列应该为186 200 160 130或150 200 160 130
 */

import Foundation

while let line = readLine(), let personHeightLine = readLine() {
    let n: Int = Int(line)!
    
    let inputArr: [Int] = personHeightLine.components(separatedBy: " ").map { Int($0)! }
    var arr: [Int] = [Int]()
    for i in 0..<n {
        arr.append(inputArr[i])
    }
    
    var arr1: [Int] = [Int].init(repeating: 0, count: n)
    var arr2: [Int] = [Int].init(repeating: 0, count: n)

    arr1[0] = 1
    arr2[n - 1] = 1
    
    for i in 0..<n {
        arr1[i] = 1
        for j in 0..<i where arr[i] > arr[j] {
            arr1[i] = max(arr1[j] + 1, arr1[i])
        }
    }
    
    for i in stride(from: n - 1, through: 0, by: -1) {
        arr2[i] = 1
        for j in stride(from: n - 1, through: i, by: -1) where arr[i] > arr[j] {
            arr2[i] = max(arr2[j] + 1, arr2[i])
        }
    }
    
    var res: [Int] = [Int].init(repeating: 0, count: n)
    for i in 0..<res.count {
        res[i] = arr1[i] + arr2[i] - 1
    }
    
    var max: Int = 1
    for i in 0..<n where res[i] > max {
        max = res[i]
    }
    
    let result = n - max
    print(result)
}
