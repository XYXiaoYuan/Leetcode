import UIKit

/// Mems一些测试
do {
    showInt()
    showEnum()
    showStruct()
    showClass()
    showArray()
    showString()
    showByteFormat()
}

class Solution {
    func smallestDifference(_ a: [Int], _ b: [Int]) -> Int {
        let aCount = a.count, bCount = b.count
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: bCount), count: aCount)
        
        for i in 0..<aCount {
            for j in 0..<bCount {
                dp[i][j] = min(abs(a[i] - b[j]), dp[i][j])
            }
        }

        print(dp[aCount - 1][bCount - 1])

        return 0
    }
}
