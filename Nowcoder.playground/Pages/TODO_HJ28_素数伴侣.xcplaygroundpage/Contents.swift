/**
 描述
 题目描述
 若两个正整数的和为素数，则这两个正整数称之为“素数伴侣”，如2和5、6和13，它们能应用于通信加密。现在密码学会请你设计一个程序，从已有的N（N为偶数）个正整数中挑选出若干对组成“素数伴侣”，挑选方案多种多样，例如有4个正整数：2，5，6，13，如果将5和6分为一组中只能得到一组“素数伴侣”，而将2和5、6和13编组将得到两组“素数伴侣”，能组成“素数伴侣”最多的方案称为“最佳方案”，当然密码学会希望你寻找出“最佳方案”。

 输入:

 有一个正偶数N（N≤100），表示待挑选的自然数的个数。后面给出具体的数字，范围为[2,30000]。

 输出:

 输出一个整数K，表示你求得的“最佳方案”组成“素数伴侣”的对数。


 输入描述：
 输入说明
 1 输入一个正偶数n
 2 输入n个整数
 注意：数据可能有多组

 输出描述：
 求得的“最佳方案”组成“素数伴侣”的对数。

 示例1
 输入：
 4
 2 5 6 13
 2
 3 6

 输出：
 2
 0
 */


import Foundation

/// 开平方根
/// - Parameter num: 传进来的数
/// - Returns: 开平方根后的数
func sqrtNumber(_ num: Double) -> Double {
    var low: Double = 0
    var high = num
    let fixedNum: Double = 0.0001
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
    /// 最直观，但效率最低的写法
//    if num <= 3 {
//        return num > 1
//    }
//    for i in 2..<num where num % i == 0 {
//        return false
//    }
//    return true
    // 两个较小数另外处理
    if (num <= 3) {
        return num > 1;
    }
    // 不在6的倍数两侧的一定不是质数
    if (num % 6 != 1 && num % 6 != 5) {
        return false;
    }

    let sqrt: Int = Int(sqrtNumber(Double(num)))

    // 在6的倍数两侧的也可能不是质数
    for i in stride(from: 5, through: sqrt, by: 6) {
        if (num % i == 0 || num % (i + 2) == 0) {
            return false;
        }
    }

    // 排除所有，剩余的是质数
    return true
}

/// 匈牙利算法，为某一个目标奇数找到它的素数伴侣（偶数）,皆以下标表示
/// - Parameters:
///   - odd: 目标奇数
///   - evens: 偶数数组
///   - used: 已访问的数
///   - evensMatch: 匹配到的偶数数组
/// - Returns: 是否找到了一个奇数匹配偶数,相加为素数(质数)
func find(odd: Int, evens: [Int], used: inout [Int], evensMatch: inout [Int]) -> Bool {
    // 遍历偶数
    // 去检查当前传入的奇数能否与偶数哪些数匹配
    for i in 0..<evens.count {
        //如果当前偶数与传入的奇数匹配，并且当前偶数位还没有匹配过奇数
        if(isPrime(odd + evens[i]) && used[i] == 0) {
            // 设置当前偶数位匹配为true，也就是 1
            used[i] = 1;
            // 如果第i个偶数没有伴侣
            // 或者第i个偶数原来有伴侣，并且该伴侣能够重新找到伴侣的话(这里有递归调用)
            // 则奇数x可以设置为第i个偶数的伴侣
            // 这里采用了匈牙利算法，能让则让
            if(evensMatch[i] == 0 || find(odd: evensMatch[i], evens: evens, used: &used, evensMatch: &evensMatch)) {
                evensMatch[i] = odd;
                return true;
            }
        }
    }
    //遍历完偶数都没有可以与传入奇数做伴侣的，该奇数只能孤独终老了
    return false;
}

func primeParter(_ n: Int, numbers: [Int]) -> String {

    // 偶数
    var evens: [Int] = [Int]()
    // 奇数
    var odds: [Int] = [Int]()
    for i in 0..<n {
        let val = numbers[i]
        if val & 1 == 0 {
            evens.append(val)
        } else {
            odds.append(val)
        }
    }
    
    // 用于标记那个奇数匹配了偶数,直接记录奇数的值，而不是奇数在奇数数组中的下标
    var evensMatch: [Int] = [Int].init(repeating: 0, count: evens.count)
    
    var resCount: Int = 0
    // 遍历奇数去匹配偶数
    for i in 0..<odds.count {
        // 每一步重新创建，也就是相当于清空
        // used数组用于标记某个某数位置是否
        var used: [Int] = [Int].init(repeating: 0, count: evens.count)
        // 这里采用了匈牙利算法，先到先得
        if(find(odd: evensMatch[i], evens: evens, used: &used, evensMatch: &evensMatch)) {
            resCount += 1;
        }
    }
    
    return "\(resCount)"
}



/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let n: Int = 62
    let test3: String = "9360 2272 15078 15571 4734 18667 10392 17796 12207 14591 8380 10126 11627 1288 24523 568 15754 8400 11280 20964 15482 28433 26109 11147 9628 12296 8500 21628 22561 5532 8830 13253 3231 15580 27278 4824 19217 16038 10091 21071 19587 10243 8786 15529 23644 13228 21503 22706 13546 2937 24488 19924 16138 13815 22460 4122 26823 2987 25011 25469 27224 16237"

    let numbers: [Int] = test3.components(separatedBy: " ").map { Int($0)! }
    
    let result = primeParter(n, numbers: numbers)
    print(result)
} else {
    while let line = readLine(), let input = readLine() {
        let n: Int = Int(line)!
        let numbers: [Int] = input.components(separatedBy: " ").map { Int($0)! }
        
        let result = primeParter(n, numbers: numbers)
        print(result)
    }
}

/// 一些测试用例的断言
assert(primeParter(4, numbers: [2, 5, 6, 13]) == "2")
assert(primeParter(2, numbers: [3, 6]) == "0")

//let test3: String = "9360 2272 15078 15571 4734 18667 10392 17796 12207 14591 8380 10126 11627 1288 24523 568 15754 8400 11280 20964 15482 28433 26109 11147 9628 12296 8500 21628 22561 5532 8830 13253 3231 15580 27278 4824 19217 16038 10091 21071 19587 10243 8786 15529 23644 13228 21503 22706 13546 2937 24488 19924 16138 13815 22460 4122 26823 2987 25011 25469 27224 16237"
//
//assert(primeParter(62, numbers: test3.components(separatedBy: " ").map { Int($0)! }) == "26")

//let test4: String = "621 10618 19556 29534 25791 11133 5713 26642 25994 16095 6618 11447 29386 24436 22551 21467 2633 25704 29460 24325 8964 4087 10560 6478 9615 5119 1114 6773 9409 21549 15336 18995 2151 27404 6296 21066 3147 27037 6177 5650 16224 14352 8999 991 3012 16447 17799 16265 27163 24118 9766 15355 6161 3909 19451 16838 9113 10877"
//assert(primeParter(58, numbers: test4.components(separatedBy: " ").map { Int($0)! }) == "25")
