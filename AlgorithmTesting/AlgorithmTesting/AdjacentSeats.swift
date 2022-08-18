
import Foundation
import Darwin
// import XCTest

public class AdjacentSeats {
    //class Solution {
    public init() {}
    
//    // 8个坐席
//    private let seats = [
//        0,1,2,3,4,5,6,7
//    ]
//
//    /// 一行最多显示的坐席数
//    private let maxRowSeats: Int = 4
        
    
    /// 处理当前坐席相邻的坐席号
    /// - Parameters:
    ///   - seatIndex: 当前坐席号
    ///   - maxRowSeats: 一行多少个坐席
    ///   - seats: 总坐席序号[0...n]
    /// - Returns: 当前坐席相邻的坐席号
    public func adjacentSeats(_ seatIndex: Int,
                              _ maxRowSeats: Int = 4,
                              _ seats: [Int] = [0,1,2,3,4,5,6,7]) -> [Int] {
        guard seatIndex < seats.count else { return [Int]() }

        var res = [Int]()
        
        /// 顶部
        let top = seatIndex - maxRowSeats
        if top >= 0 {
            res.append(seats[top])
        }
        
        /// 底部
        let bottom = seatIndex + maxRowSeats
        if bottom < seats.count {
            res.append(seats[bottom])
        }

        /// 左边
        let left = seatIndex - 1
        if seatIndex % maxRowSeats > 0 {
            res.append(seats[left])
        }

        /// 右边
        let right = seatIndex + 1
        if seatIndex % maxRowSeats < (maxRowSeats - 1) {
            res.append(seats[right])
        }
        
        return res.sorted()
    }
    
}

//do {
//    let s = AdjacentSeats()
//    
//    for i in 0..<8 {
//        let seats = s.adjacentSeats(i)
//        print("第\(i)位坐席的 相邻坐席有 \(seats)")
//    }
//    
//    print("--------------- \n")
//    
//    for i in 0..<10 {
//        let seats = s.adjacentSeats(i, 5, [0,1,2,3,4,5,6,7,8,9])
//        print("第\(i)位坐席的 相邻坐席有 \(seats)")
//    }
//    
//    print("--------------- \n")
//    
//    for i in 0..<10 {
//        let seats = s.adjacentSeats(i, 3, [0,1,2,3,4,5,6,7,8])
//        print("第\(i)位坐席的 相邻坐席有 \(seats)")
//    }
//}

//: [Next](@next)
