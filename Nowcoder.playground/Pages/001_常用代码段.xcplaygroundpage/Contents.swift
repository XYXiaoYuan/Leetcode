// NOIP NOI IOI ACM

/// 开平方根
/// - Parameter num: 传进来的数
/// - Returns: 开平方根后的数
func sqrtNumber(_ num: Double) -> Double {
    var low: Double = 0
    var high = num
    let fixedNum: Double = 0.000001
    var mid = (low + high) / 2 // 中间值
    while (high - low) > fixedNum {
        if mid * mid > num {
            // 如果大于num，说明平方根在low--mid之间  把mid赋值给high
            high = mid
        } else {
            // 如果小于num，说明平方根在mid--high之间  把midz赋值给low
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


/// 分解一个数,由他的质数因子相乘的形式
/// - Parameter number: 这个数
/// - Returns: 一个数由质数因子相乘的表达式,如180 = 2 x 2 x 3 x 3 x 5
func getPrimeFactors(_ number: Int) -> String {
    var num = number
    var i = 2
        
    var res: [String] = [String]()
    res.append("\(num) =")
    while i * i <= num {
        if 0 == num % i {
            res.append(" \(i) x")
            num /= i
            i -= 1
        }
        i += 1
    }
    res.append(" \(num)")

    return res.joined(separator: "")
}


/// number数以内有多少个完全数
/// - Parameter number: 数字
/// - Returns: number数以内完全数的个数和对应的完全数数字
func perfectNumber(_ number: Int) -> (count: Int, perfectNumbers: [Int]) {
    var count: Int = 0
    var perfectNumbers: [Int] = [Int]()
    
    for i in 1...number {
        var list: [Int] = [Int]()
        for j in 1..<i where i % j == 0 {
            list.append(j)
        }
        
        let sum = list.reduce(0, { $0 + $1 })
        if sum == i {
            perfectNumbers.append(i)
            count += 1
        }
    }
    
    return (count: count, perfectNumbers: perfectNumbers)
}

/// 分解一个数的每位数
/// - Parameter number: 传进来的数字
/// - Returns: 一个数的 每位数 逆序数字数组
func itoa(_ number: Int) -> [Int] {
    var n = number
    
    var result: [Int] = [Int]()
    if n < 0 {
        n = abs(n)
    }
    while n >= 10 {
        result.append(n % 10)
        n /= 10
    }
    result.append(n)
    
    return result
}

print(itoa(198))
