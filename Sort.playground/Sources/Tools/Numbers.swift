import Foundation

extension Int {
    /// 随机数字
    /// - Parameters:
    ///   - count: 个数
    ///   - min: 最小值
    ///   - max: 最大值
    /// - Returns: 生成一个随机数数组
    public static func random(count: Int, min: Int, max: Int) -> [Int] {
        if count <= 0 || min > max {
            return []
        }
        
        var array: [Int] = [Int].init(repeating: 0, count: count)
        let delta = max - min + 1
        for i in 0..<count {
            array[i] = min + Int(Double.random(in: 0.0...1.0) * Double(delta))
        }
        
        return array
    }
}

extension Int {
    /// 把两个数组的数据合并到一个数组中
    /// - Parameters:
    ///   - array1: 数组1
    ///   - array2: 数组2
    /// - Returns: 合并后的数组
    public static func combine(array1: [Int], array2: [Int]) -> [Int] {
        if array1.isEmpty || array2.isEmpty {
            return []
        }
        
        var array: [Int] = [Int].init(repeating: 0, count: array1.count + array2.count)
        for i in 0..<array1.count {
            array[i] = array1[i]
        }
        for j in 0..<array2.count {
            array[j + array1.count] = array2[j]
        }
        
        return array
    }
}

extension Int {
    /// 升序
    public static func ascOrder(min: Int, max: Int) -> [Int] {
        if min > max {
            return []
        }
        var min = min
        
        var array: [Int] = [Int].init(repeating: 0, count: max - min + 1)
        for i in 0..<array.count {
            array[i] = min
            min += 1
        }
        
        return array
    }
    
    /// 降序
    public static func descOrder(min: Int, max: Int) -> [Int] {
        if min > max {
            return []
        }
        var max = max
        
        var array: [Int] = [Int].init(repeating: 0, count: max - min + 1)
        for i in 0..<array.count {
            array[i] = max
            max -= 1
        }
        
        return array
    }
}

extension Int {
    /// 头尾升序
    public static func headTailAscOrder(min: Int, max: Int, disorderCount: Int) -> [Int] {
        var array = ascOrder(min: min, max: max)
        if disorderCount > array.count {
            return array
        }
        
        let begin = (array.count - disorderCount) >> 1
        reverse(array: &array, begin: begin, end: begin + disorderCount)
        return array
    }
    
    /// 中间升序
    public static func centerAscOrder(min: Int, max: Int, disorderCount: Int) -> [Int] {
        var array = ascOrder(min: min, max: max)
        if disorderCount > array.count {
            return array
        }
        
        let left = disorderCount >> 1
        reverse(array: &array, begin: 0, end: left)
        
        let right = disorderCount - left
        reverse(array: &array, begin: array.count - right, end: array.count)
        
        return array
    }
    
    /// 头升序
    public static func headAscOrder(min: Int, max: Int, disorderCount: Int) -> [Int] {
        var array = ascOrder(min: min, max: max)
        if disorderCount > array.count {
            return array
        }
        
        reverse(array: &array, begin: array.count - disorderCount, end: array.count)
        return array
    }
    
    /// 尾升序
    public static func tailAscOrder(min: Int, max: Int, disorderCount: Int) -> [Int] {
        var array = ascOrder(min: min, max: max)
        if disorderCount > array.count {
            return array
        }
        
        reverse(array: &array, begin: 0, end: disorderCount)
        return array
    }
}

extension Int {
    public static func copy(array: [Int]) -> [Int] {
        var copiedArray = [Int]()
        for element in array {
            copiedArray.append(element)
        }
        return copiedArray
    }
    
    public static func isAscOrder(array: [Int]) -> Bool {
        if array.isEmpty {
            return false
        }
        for i in 1..<array.count where array[i - 1] > array[i] {
            return false
        }
        return true
    }
}

extension Int {
    fileprivate static func reverse(array: inout [Int], begin: Int, end: Int) {
        let count: Int = (end - begin) >> 1
        let sum: Int = begin + end - 1
        for i in begin..<(begin + count) {
            let j = sum - i
            let temp = array[i]
            array[i] = array[j]
            array[j] = temp
        }
    }
}

