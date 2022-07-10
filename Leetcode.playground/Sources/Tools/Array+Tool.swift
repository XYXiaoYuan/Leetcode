import Foundation

extension Array {
    /// 判断左右两个数组是否相等
    /// - Parameters:
    ///   - lhs: 左边数组
    ///   - rhs: 右边数组
    /// - Returns: 两个数组是否相等
    public func isEqual(_ other: [Int]) -> Bool {
        if (self.isEmpty && !other.isEmpty) || (!self.isEmpty && other.isEmpty) {
            return false
        }
        
        if self.isEmpty && other.isEmpty {
            return true
        }
        
        if self.count != other.count {
            return false
        }
        
        for (i, num) in self.enumerated() {
            let otherVal = other[i]
            if let value = (num as? Int), value != otherVal {
                return false
            }
        }
        
        return true
    }
}

extension Array {
    public func printArray() {
        if self.isEmpty {
            return
        }
        for i in 0..<self.count {
            print("\(self[i]) ")
        }
    }
}

extension Array {
    /// 根据原数组拷贝一个数组
    /// - Parameter array: 原数组
    /// - Returns: 拷贝的数组
    public static func copy(_ array: [Int]) -> [Int] {
        var copiedArray = [Int]()
        for element in array {
            copiedArray.append(element)
        }
        return copiedArray
    }
}
