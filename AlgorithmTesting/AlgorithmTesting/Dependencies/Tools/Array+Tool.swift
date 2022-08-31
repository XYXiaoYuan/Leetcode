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

extension Array {
    /// 二分查找数组中某个数，在不在数组中
    /// - Parameters:
    ///   - sortedArr: 数组
    ///   - target: 目标数值
    /// - Returns: 数是否要数组中
    static func exist(_ sortedArr: [Int], _ target: Int) -> Bool {
        var L = 0, mid = 0, R = sortedArr.count - 1
        
        while L < R {
            mid = L + ((R - L) >> 1)
            
            if sortedArr[mid] == target {
                return true
            } else if sortedArr[mid] > target {
                R = mid - 1
            } else {
                L = mid + 1
            }
        }
        
        return sortedArr[L] == target
    }
}
