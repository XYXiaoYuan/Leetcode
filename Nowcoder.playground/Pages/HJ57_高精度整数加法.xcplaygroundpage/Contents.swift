import Foundation

/**
 https://www.nowcoder.com/practice/49e772ab08994a96980f9618892e55b6?tpId=37&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 
 描述
 输入两个用字符串表示的整数，求它们所表示的数之和。
 字符串的长度不超过10000。
 本题含有多组样例输入。
 输入描述：
 输入两个字符串。保证字符串只含有'0'~'9'字符

 输出描述：
 输出求和后的结果

 示例1
 输入：
 9876543210
 1234567890
 输出：
 11111111100
 */

/// 倒序法
/// - Parameters:
///   - line1: 第一个字符串
///   - line2: 第二个字符串
/// - Returns: 结果字符串
func highPrecisionSum(_ line1: String, _ line2: String) -> String {
    let string1 = line1.reversed()
    let string2 = line2.reversed()
    
    var num1: [Int] = [Int]()
    for s in string1 {
        if let v = Int(String(s)) {
            num1.append(v)
        }
    }
    var num2: [Int] = [Int]()
    for s in string2 {
        if let v = Int(String(s)) {
            num2.append(v)
        }
    }
    
    let length: Int
    if num1.count == num2.count {
        length = num1.count + 1
    } else {
        length = max(num1.count, num2.count)
    }
    var result: [Int] = [Int].init(repeating: 0, count: length)
    
    for i in 0..<result.count {
        let prev = result[i]
        var temp = prev
        let n1 = num1.count > i ? num1[i] : 0
        let n2 = num2.count > i ? num2[i] : 0
        temp = n1 + n2
                
        let mod = temp + prev
        let number = mod % 10
        result[i] = number
        if mod >= 10 {
            result[i + 1] = 1
        }
    }
    
    var res: String = ""
    var findFirst: Bool = false
    for i in stride(from: result.count - 1, through: 0, by: -1) {
        if findFirst == false {
            findFirst = true
            // 用于跳过结果数组末尾的0
            if result[i] == 0 {
                continue
            }
        }
        res.append("\(result[i])")
    }
    
    return res
}

/// 正序法
/// - Parameters:
///   - line1: 第一个字符串
///   - line2: 第二个字符串
/// - Returns: 结果字符串
func highPrecisionSum1(_ line1: String, _ line2: String) -> String {
    var num1: [Int] = [Int]()
    for s in line1 {
        if let v = Int(String(s)) {
            num1.append(v)
        }
    }
    var num2: [Int] = [Int]()
    for s in line2 {
        if let v = Int(String(s)) {
            num2.append(v)
        }
    }

    let length: Int
    if num1.count == num2.count {
        length = num1.count + 1
    } else {
        length = max(num1.count, num2.count)
    }
    var result: [Int] = [Int].init(repeating: 0, count: length)
    
        
    for i in stride(from: result.count - 1, through: 0, by: -1) {
        let prev = result[i]
        var temp = prev
        
        let n1Last = result.count - num1.count
        let n2Last = result.count - num2.count
        let n1 = i >= n1Last ? num1[i - n1Last] : 0
        let n2 = i >= n2Last ? num2[i - n2Last] : 0
        temp = n1 + n2
                
        let mod = temp + prev
        let number = mod % 10
        result[i] = number
        if mod >= 10 {
            result[i - 1] = 1
        }
    }
    
    if let first = result.first, first == 0 {
        result.remove(at: 0)
        return result.map { "\($0)" }.joined(separator: "")
    }
    
    return result.map { "\($0)" }.joined(separator: "")
}



/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let string1: String? = "9876543210"
    let string2: String? = "1234567890"
    if let line1 = string1, let line2 = string2 {
        let result = highPrecisionSum(line1, line2)
        print(result)
    }
} else {
    while let line1 = readLine(), let line2 = readLine() {
        let result = highPrecisionSum(line1, line2)
        print(result)
    }
}

/// 一些测试用例的断言
assert(highPrecisionSum("9876543210", "1234567890") == "11111111100", "11111111100")
assert(highPrecisionSum("630222", "6450") == "636672")
assert(highPrecisionSum("623192091", "14426202982932") == "14426826175023")
assert(highPrecisionSum("0", "0") == "0")
assert(highPrecisionSum("1", "1") == "2")
assert(highPrecisionSum("12", "155") == "167")
assert(highPrecisionSum("199", "1") == "200")

