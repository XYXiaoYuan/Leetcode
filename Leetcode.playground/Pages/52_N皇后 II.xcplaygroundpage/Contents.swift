/**
 https://leetcode-cn.com/problems/n-queens-ii/
 
 n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

 给你一个整数 n ，返回 n 皇后问题 不同的解决方案的数量。

  

 示例 1：


 输入：n = 4
 输出：2
 解释：如上图所示，4 皇后问题存在两个不同的解法。
 示例 2：

 输入：n = 1
 输出：1
  

 提示：

 1 <= n <= 9
 皇后彼此不能相互攻击，也就是说：任何两个皇后都不能处于同一条横行、纵行或斜线上。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/n-queens-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    /// n皇后的摆放的摆法有多少种
    var ways: Int = 0
    
    /// 下标是索引,对应的值是摆放皇后的列
    var cols: [Bool] = [Bool]()
    /// 从左下角到顶部的斜边
    var leftTop: [Bool] = [Bool]()
    /// 从右下角到顶部的斜边
    var rightTop: [Bool] = [Bool]()
    
    
    func totalNQueens(_ n: Int) -> Int {
//        let answers = [1, 0, 0, 2, 10, 4, 40, 92, 352]
//        return answers[n - 1]
        placeQueues(n)
        return ways
    }
    
    private func placeQueues(_ n: Int) {
        /// 初始化数据
        cols = [Bool].init(repeating: false, count: n)
        leftTop = [Bool].init(repeating: false, count: (n << 1) - 1)
        rightTop = [Bool].init(repeating: false, count: leftTop.count)
        
        place(row: 0)
    }
    
    private func place(row: Int) {
        if row == cols.count {
            ways += 1
            return
        }
        
        for col in 0..<cols.count {
            if cols[col] {
                continue
            }
            let ltIndex = row - col + cols.count - 1
            if leftTop[ltIndex] {
                continue
            }
            let rtIndex = row + col
            if rightTop[rtIndex] {
                continue
            }
            
            cols[col] = true
            leftTop[ltIndex] = true
            rightTop[rtIndex] = true
            
            place(row: row + 1)
            
            cols[col] = false
            leftTop[ltIndex] = false
            rightTop[rtIndex] = false
        }
    }
}

class Solution1 {
    /// n皇后的摆放的摆法有多少种
    var ways: Int = 0
    
    /// 下标是索引,对应的值是摆放皇后的列
    var cols: [Int] = [Int]()
    
    func totalNQueens(_ n: Int) -> Int {
//        let answers = [1, 0, 0, 2, 10, 4, 40, 92, 352]
//        return answers[n - 1]
        placeQueues(n)
        return ways
    }
    
    private func placeQueues(_ n: Int) {
        /// 初始化cols
        cols = [Int].init(repeating: -1, count: n)
        
        place(row: 0)
    }
    
    private func place(row: Int) {
        if row == cols.count {
            ways += 1
            return
        }
        
        for col in 0..<cols.count where isValid(row: row, col: col) {
            // 在第row行第col列摆放皇后
            cols[row] = col
            
            place(row: row + 1)
        }
    }
    
    private func isValid(row: Int, col: Int) -> Bool {
        for i in 0..<row {
            /// 第col列已经有皇后了
            if cols[i] == col {
                return false
            }
            /// 第i行的皇后跟第row行第col列格子处在同一斜线上
            if row - i == abs(col - cols[i]) {
                return false
            }
        }
        return true
    }
}

//var res: [Int] = [Int]()
//for i in 1...9 {
//    let s = Solution()
//    let result = s.totalNQueens(i)
//    res.append(result)
//}
//print(res)

let s = Solution()
let result = s.totalNQueens(8)
print(result)

assert(Solution().totalNQueens(4) == 2)
assert(Solution().totalNQueens(8) == 92)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

