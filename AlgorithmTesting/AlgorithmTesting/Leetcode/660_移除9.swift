import Foundation

public class _660_移除9 {
    public init() {}
    
    public func newInteger1(_ n: Int) -> Int {
        var ans = ""
        
        var n = n
        while n != 0 {
            ans = String(n % 9) + ans
            n /= 9
        }

        return Int(ans) ?? 0
    }
    
    public func newInteger(_ n: Int) -> Int {
        return n != 0 ? newInteger(n / 9) * 10 + n % 9 : 0
    }
}

//let s = _660_移除9()
//let result = s.newInteger(9)
//print("\(s) --- \(result)")
//
//assert(s.newInteger(9) == 10)
