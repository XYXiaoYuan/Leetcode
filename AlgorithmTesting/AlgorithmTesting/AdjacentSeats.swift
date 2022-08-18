
import Foundation
import Darwin
// import XCTest

extension AdjacentSeats.Direction: CustomStringConvertible {
    public var description: String {
        switch self {
        case .top:
            return "☝️"
        case .left:
            return "👈"
        case .bottom:
            return "👇"
        case .right:
            return "👉"
        }
    }
}

extension AdjacentSeats.Seat: CustomStringConvertible {
    public var description: String {
        return "[\(index)]"
//        return "\(direction)-[\(index)]"
    }
}

extension AdjacentSeats.Seat: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.direction == rhs.direction
    }
}

extension AdjacentSeats {
    public func print(_ ans: [Seat], _ cur: Int) -> String {
        guard !ans.isEmpty else { return "🈚️" }
        
        var result = ""
        let space = "   "
        let directions = ans.map { $0.direction }
        if directions.contains(.top) {
            var leftAns = ""
            if directions.contains(.left) {
                let leftRes = ans.filter { $0.direction == .left }.first!
                leftAns = " [\(leftRes.index)]👈"
            }
            let leftEmpty = String.init(repeating: " ", count: leftAns.count)

            result += "\(leftEmpty)\(space)\(ans.filter { $0.direction == .top }.first!)\(space)"
            result += "\n\(leftEmpty)\(space) ☝️\(space)\n"
        }
                
        var leftAns = ""
        if directions.contains(.left) {
            let leftRes = ans.filter { $0.direction == .left }.first!
            leftAns = "  [\(leftRes.index)]👈"
            result += "\(leftRes)👈"
        }
        
        result += "\(space)〈\(cur)〉\(space)"
        
        if directions.contains(.right) {
            result += "👉\(ans.filter { $0.direction == .right }.first!)"
        }
                
        if directions.contains(.bottom) {
            var leftEmpty = String.init(repeating: " ", count: leftAns.count)
            leftEmpty = leftEmpty.isEmpty ? "  " : leftEmpty
            result += "\n\(leftEmpty)\(space)👇\(space)\n"
            result += "\(leftEmpty)\(space)\(ans.filter { $0.direction == .bottom }.first!)\(space)"
        }
        
        result += "\n"

        return result
    }
}

public class AdjacentSeats {
    public enum Direction {
        case top
        case left
        case bottom
        case right
    }
    
    public struct Seat  {
        var index: Int
        var direction: Direction
    }
    
    public init() {}
    
    /// 处理当前坐席相邻的坐席号
    /// - Parameters:
    ///   - seatIndex: 当前坐席号
    ///   - maxRowSeats: 一行多少个坐席
    ///   - seats: 总坐席序号[0...n]
    /// - Returns: 当前坐席相邻的坐席号
    public func adjacentSeats(_ seatIndex: Int,
                              _ maxRowSeats: Int = 4,
                              _ seats: [Int] = [0,1,2,3,4,5,6,7]) -> [Seat] {
        guard seatIndex < seats.count else { return [Seat]() }

        var ans = [Seat]()
        
        /// 顶部
        let top = seatIndex - maxRowSeats
        if top >= 0 {
            ans.append(Seat(index: seats[top], direction: .top))
        }
        
        /// 左边
        let left = seatIndex - 1
        if seatIndex % maxRowSeats > 0 {
            ans.append(Seat(index: seats[left], direction: .left))
        }

        /// 底部
        let bottom = seatIndex + maxRowSeats
        if bottom < seats.count {
            ans.append(Seat(index: seats[bottom], direction: .bottom))
        }

        /// 右边
        let right = seatIndex + 1
        if seatIndex % maxRowSeats < (maxRowSeats - 1) {
            ans.append(Seat(index: seats[right], direction: .right))
        }
        
        return ans
    }
}

//do {
//    let s = AdjacentSeats()
//
//    for i in 0..<8 {
//        let seats = s.adjacentSeats(i)
//        print("第〈\(i)〉位坐席的 相邻坐席有\n\n \(s.print(seats, i))")
//    }
//
//    print("\n----------------------------------- \n")
//
//    for i in 0..<10 {
//        let seats = s.adjacentSeats(i, 5, [0,1,2,3,4,5,6,7,8,9])
//        print("第〈\(i)〉位坐席的 相邻坐席有\n\n \(s.print(seats, i))")
//    }
//
//    print("\n----------------------------------- \n")
//
//    for i in 0..<10 {
//        let seats = s.adjacentSeats(i, 3, [0,1,2,3,4,5,6,7,8])
//        print("第〈\(i)〉位坐席的 相邻坐席有\n\n \(s.print(seats, i))")
//    }
//}
