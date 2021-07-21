/**
 https://leetcode-cn.com/problems/n-queens/
 
 n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

 给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

 每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

  

 示例 1：


 输入：n = 4
 输出：[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
 解释：如上图所示，4 皇后问题存在两个不同的解法。
 示例 2：

 输入：n = 1
 输出：[["Q"]]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/n-queens
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    /// 下标是索引,对应的值是摆放皇后的列
    var cols: [Bool] = [Bool]()
    /// 从左下角到顶部的斜边
    var leftTop: [Bool] = [Bool]()
    /// 从右下角到顶部的斜边
    var rightTop: [Bool] = [Bool]()
    
    /// 放置的皇后位置
    var queens: [Int] = [Int]()
    
    /// 结果
    var result: [[String]] = [[String]]()

    func solveNQueens(_ n: Int) -> [[String]] {
        placeQueues(n)

        return result
    }
    
    private func placeQueues(_ n: Int) {
        /// 初始化数据
        cols = [Bool].init(repeating: false, count: n)
        leftTop = [Bool].init(repeating: false, count: (n << 1) - 1)
        rightTop = [Bool].init(repeating: false, count: leftTop.count)
        
        queens = [Int].init(repeating: 0, count: n)
        
        place(row: 0, n: n)
    }
    
    private func place(row: Int, n: Int) {
        if row == cols.count {
            var solution: [String] = [String]()
            
            for i in 0..<n {
                var temp: String = ""
                for j in 0..<cols.count {
                    if i == queens[j] {
                        temp.append("Q")
                    } else {
                        temp.append(".")
                    }
                }
                solution.append(temp)
            }
            
            result.append(solution)
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
            
            queens[row] = col
            
            cols[col] = true
            leftTop[ltIndex] = true
            rightTop[rtIndex] = true
            
            place(row: row + 1, n: n)
            
            cols[col] = false
            leftTop[ltIndex] = false
            rightTop[rtIndex] = false
        }
    }
}


class Solution1 {
    /// 下标是索引,对应的值是摆放皇后的列
    var cols: [Int] = [Int]()
    
    /// 结果
    var result: [[String]] = [[String]]()
    
    func solveNQueens(_ n: Int) -> [[String]] {
        placeQueues(n)
        
        return result
    }
    
    private func placeQueues(_ n: Int) {
        /// 初始化cols
        cols = [Int].init(repeating: 0, count: n)
                
        place(row: 0, n: n)
    }
    
    var count: Int = 0
    private func place(row: Int, n: Int) {
        count += 1
        
        if row == cols.count {
            var solution: [String] = [String]()
            
            for i in 0..<n {
                var temp: String = ""
                for j in 0..<cols.count {
                    if i == cols[j] {
                        temp.append("Q")
                    } else {
                        temp.append(".")
                    }
                }
                solution.append(temp)
            }
            
            result.append(solution)
            return
        }
        
        for col in 0..<cols.count where isValid(row: row, col: col) {
            /// 在第row行第col列摆放皇后
            cols[row] = col
            
            place(row: row + 1, n: n)
        }
        
        print("第 \(count) 次 place函数调用完毕 \n")
    }
    
    private func isValid(row: Int, col: Int) -> Bool {
        for i in 0..<row {
            /// 第col列已经有皇后了
            if cols[i] == col {
                print("🍓 [\(row)][\(col)] = false")
                return false
            }
            /// 第i行的皇后跟第row行第col列格子处在同一斜线上
            if row - i == abs(col - cols[i]) {
                print("🍓 [\(row)][\(col)] = false")
                return false
            }
        }
        print("🍏 [\(row)][\(col)] = true")
        return true
    }
}

let s = Solution()
let result = s.solveNQueens(4)
print(result)

assert(Solution().solveNQueens(1) == [["Q"]])
assert(Solution().solveNQueens(2) == [])
assert(Solution().solveNQueens(3) == [])
assert(Solution().solveNQueens(4) == [["..Q.", "Q...", "...Q", ".Q.."], [".Q..", "...Q", "Q...", "..Q."]])

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

