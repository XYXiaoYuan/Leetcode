/**
 数羊，给定一个初始数N，第一次数的数为N，第二次为2N，依次类推，直到kN，那么求当0-9的数全部都出现的时候的k值
 */

public enum Digits: Int, CaseIterable {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
}

/// 结果集
public struct Result {
    public var k: Int
    public var numbers: [Int]
}

public extension 数羊 {
    /// 分解一个数的每位数
    /// - Parameter number: 传进来的数字
    /// - Returns: 一个数的 每位数 逆序数字数组
    private func itoa(_ number: Int) -> [Int] {
        var n = number
        
        var result: [Int] = [Int]()
        while n >= 10 {
            result.append(n % 10)
            n /= 10
        }
        result.append(n)
        
        return result
    }
}

public class 数羊 {
    public init() {}

    /// 是否包含了 0-9 这10个字数
    /// - Parameters:
    ///   - num: 当前用来统计的数字
    ///   - count: 当前已经有 0-9中的个数
    ///   - digitDict: 0-9数字字典
    /// - Returns: 是否包含了 0-9 这10个字数
    private func isContainAllDigits(_ num: Int, _ count: inout Int, _ digitDict: inout [Digits: Bool]) -> Bool {
        let digitals = itoa(num)
        for digtal in digitals {
            if let myNum = Digits(rawValue: digtal), digitDict[myNum] == false {
                digitDict[myNum] = true
                count += 1
            }
        }
            
        return count >= 10
    }

    /// 数羊
    /// - Parameter n: 初始数N
    /// - Returns: 当0-9的数全部都出现的时候的结果集
    public func sheepCount(_ n: Int) -> Result {
        /// 结果数组
        var numbers: [Int] = [Int]()
        /// 0-9的个数
        var count: Int = 0
        /// 0-9的字典
        var digitDict: [Digits: Bool] = Digits.allCases.reduce(into: [Digits: Bool]()) { $0[$1] = false }
        
        /// 每次用于计算的数
        var res: Int = n
        // 结果,需要多少个k
        var k: Int = 1
        
        repeat {
            res = k * n
            numbers.append(res)
            k += 1
        } while isContainAllDigits(res, &count, &digitDict) == false
        
        return Result(k: k - 1, numbers: numbers)
    }
}


