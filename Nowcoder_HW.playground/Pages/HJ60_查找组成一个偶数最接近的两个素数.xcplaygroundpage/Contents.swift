/**
 https://www.nowcoder.com/practice/f8538f9ae3f1484fb137789dec6eedb9?tpId=37&&tqId=21283&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 任意一个偶数（大于2）都可以由2个素数组成，组成偶数的2个素数有很多种情况，本题目要求输出组成指定偶数的两个素数差值最小的素数对。
 本题含有多组样例输入。
 输入描述：
 输入一个偶数

 输出描述：
 输出两个素数

 示例1
 输入：
 20
 复制
 输出：
 7
 13
 复制

 
 */

import Foundation

while let line = readLine(), let number = Int(line), number > 2 {
        
    /// 开平方根
    /// - Parameter num: 传进来的数
    /// - Returns: 开平方根后的数
    func sqrtNumber(_ num: Double) -> Double {
        var low: Double = 0
        var high = num
        let fixedNum: Double = 0.000001
        var mid = (low + high) / 2 //中间值
        while (high - low) > fixedNum {
              if mid * mid > num {
                  //如果大于num，说明平方根在low--mid之间  把mid赋值给high
                  high = mid
              } else {
                  //如果小于num，说明平方根在mid--high之间  把midz赋值给low
                  low = mid
              }
              mid = (low + high) / 2
          }
          return mid
     }
    
    /// 判断一个数是否为质数(素数)
    /// - Parameter num: 传进来的数
    /// - Returns: 是否为质数(素数)
    func isPrime(_ num: Int) -> Bool {
        // 两个较小数另外处理
        if (num <= 3) {
            return num > 1;
        }
        // 不在6的倍数两侧的一定不是质数
        if (num % 6 != 1 && num % 6 != 5) {
            return false;
        }

        let sqrt = Int(sqrtNumber(Double(num)))

        // 在6的倍数两侧的也可能不是质数
        for i in stride(from: 5, through: sqrt, by: 6) {
            if (num % i == 0 || num % (i + 2) == 0) {
                return false;
            }
        }
        
        // 排除所有，剩余的是质数
        return true
    }
    
    for i in stride(from: number / 2, through: 2, by: -1) {
        if isPrime(i), isPrime(number - i) {
            print(i)
            print(number - i)
            break
        }
    }
}
