
import Foundation

func minSum(_ line: String) -> Int {
    var array: [Int] = [Int]()
    
    var negativeNumers: [Int] = [Int]()
    
    /// 当前连续出现的多少个负号
    var negetiveCount: Int = 0
    
    /// 是否为负数
    var isNegative: Bool = false
    
    
    var isCon: Bool = false
    
    var negativeTemp: String = ""
    for str in line {
        switch str {
        case "0"..."9":
            if isNegative {
                if negetiveCount > 1, isCon == false {
                    if let val = Int(String(negativeTemp)) {
                        negativeNumers.append(val * (-1))
                        negativeTemp = ""
                        isCon = true
                        
                        negetiveCount -= 1
                    }
                }
            } else {
                dprint("xxx \(str)")
                if let val = Int(String(str)) {
                    array.append(val)
                }
            }
            negativeTemp.append(str)
        case "-":
            negetiveCount += 1
            isNegative = true
        default:
            negetiveCount = 0
            
            if let val = Int(String(negativeTemp)) {
                negativeNumers.append(val * (-1))
                negativeTemp = ""
                isNegative = false
                isCon = false
            }
        }
    }
    
    dprint(array)
    dprint(negativeNumers)
    
    let postiveSum = array.reduce(0, { $0 + $1 })
    
    var result: Int = 0
    if negativeNumers.isEmpty {
        result = postiveSum
    } else {
        let temp = negativeNumers.reduce(0, { $0 + $1 })
        result = postiveSum + temp
    }
    
    return result
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let num = "bb12-1-99aa"
    let result = minSum(num)
    print(result)
} else {
    while let line = readLine() {
        let result = minSum(line)
        print(result)
    }
}

/// 全局打印,发布时不触发, isDebug == false时不打印
public func dprint<T>(_ msg: T,
                      line: Int = #line) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}

//assert(minSum("bb1234aa") == 10)
//assert(minSum("bb12-34aa") == -31)
//assert(minSum("bb12-1-99aa") == -97)
//assert(minSum("-10bb10") == -9)
