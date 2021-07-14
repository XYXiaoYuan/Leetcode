/**
 
 
 */

import Foundation

enum Operation: String {
    case add = "+"
    case jian = "-"
    case chen = "*"
    
    func compute(lhs: Int, rhs: Int) -> Int {
        var res: Int = 0
        switch self {
        case .add:
            res = lhs + rhs
        case .jian:
            res = lhs - rhs
        case .chen:
            res = lhs * rhs
        }
        return res
    }
}

func longestExCompute(_ string: String) -> Int {
    
    var line: String = ""
    for str in string {
        switch str {
        case "0"..."9", "+", "-", "*":
            line.append(str)
        default:
            continue
        }
    }
    
    var numStack: Stack<Int> = Stack<Int>()
    var opStack: Stack<Operation> = Stack<Operation>()
    
    for str in line {
        switch str {
        case "0"..."9":
            if str == "0", let top = numStack.top {
                numStack.pop()
                if let val = Int(String(str)) {
                    let number = top * 10 + val
                    numStack.push(number)
                }
            } else {
                if let val = Int(String(str)) {
                    numStack.push(val)
                }
            }
        case "+", "-", "*":
            if let op = Operation(rawValue: String(str)) {
                opStack.push(op)
            }
        default:
            continue
        }
    }
        
    var res: Int = 0
    while !opStack.isEmpty {
        if let opertaion = opStack.pop() {
            let rhs = numStack.pop() ?? 0
            let lhs = numStack.pop() ?? 0
            res += opertaion.compute(lhs: lhs, rhs: rhs)
            numStack.push(res)
        }
    }
    
    return res
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let line = "1-2abcd"
    let result = longestExCompute(line)
    print(result)
} else {
    while let line = readLine() {
        let result = longestExCompute(line)
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

//assert(longestExCompute("1-2abcd") == -1)


/// 栈
public struct Stack<T> {
    
    /// Datastructure consisting of a generic item.
    fileprivate var array = [T]()
    
    /// The number of items in the stack.
    public var count: Int {
        return array.count
    }
    
    /// Verifies if the stack is empty.
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    /// Remove all elements
    public mutating func removeAll() {
        array.removeAll()
    }
    
    /**
     Pushes an item to the top of the stack.
     
     - Parameter element: The item being pushed.
     */
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    /**
     Removes and returns the item at the top of the stack.
     
     - Returns: The item at the top of the stack.
     */
    @discardableResult
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    /// Returns the item at the top of the stack.
    public var top: T? {
        return array.last
    }
}

