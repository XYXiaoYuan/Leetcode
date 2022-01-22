import Foundation

//public extension String {
//    /// 通过下标的方式获取字符串中某个下标的字符
//    subscript(_ i: Int) -> String {
//        let idx1 = index(startIndex, offsetBy: i)
//        let idx2 = index(idx1, offsetBy: 1)
//        return String(self[idx1..<idx2])
//    }
//
//    /// 通过闭区间的方式获取字符串中闭区间位置的字符
//    subscript (r: Range<Int>) -> String {
//        let start = index(startIndex, offsetBy: r.lowerBound)
//        let end = index(startIndex, offsetBy: r.upperBound)
//        return String(self[start ..< end])
//    }
//
//    /// 通过半开区间的方式获取字符串中半开区间位置的字符
//    subscript (r: CountableClosedRange<Int>) -> String {
//        let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
//        let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
//        return String(self[startIndex...endIndex])
//    }
//}
