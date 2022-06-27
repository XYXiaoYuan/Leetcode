/**
 https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof/
 
 给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

  

 例如，在下面的 3×4 的矩阵中包含单词 "ABCCED"（单词中的字母已标出）。



  

 示例 1：

 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 示例 2：

 输入：board = [["a","b"],["c","d"]], word = "abcd"
 输出：false
  

 提示：

 1 <= board.length <= 200
 1 <= board[i].length <= 200
 board 和 word 仅由大小写英文字母组成
  

 注意：本题与主站 79 题相同：https://leetcode-cn.com/problems/word-search/



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _剑指Offer12_矩阵中的路径 {
//class Solution {
    public init() {}
    
    public func exist(_ board: [[Character]], _ word: String) -> Bool {
        let maxY = board.count
        let chars: [Character] = Array(word)
        
        guard let maxX = board.first?.count, maxY > 0, maxX > 0 else {
            return false
        }
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: maxX), count: maxY)
        
        var pathLength = 0
        
        for y in 0..<maxY {
            for x in 0..<maxX {
                if hasPathCore(board, chars, maxX: maxX, maxY: maxY, pathLength: &pathLength, x: x, y: y, visted: &visited) {
                    return true
                }
            }
        }
        
        return false
    }

    private func hasPathCore(_ board: [[Character]], _ chars: [Character], maxX: Int, maxY: Int, pathLength: inout Int, x: Int, y: Int, visted: inout [[Bool]]) -> Bool {
        if pathLength == chars.count {
            return true
        }
        
        var result = false
        if x >= 0, y >= 0,
            x < maxX, y < maxY,
            visted[y][x] == false,
            board[y][x] == chars[pathLength]
        {
            pathLength += 1
            visted[y][x] = true
            
            result =
                hasPathCore(board, chars, maxX: maxX, maxY: maxY, pathLength: &pathLength, x: x - 1, y: y, visted: &visted) ||
                hasPathCore(board, chars, maxX: maxX, maxY: maxY, pathLength: &pathLength, x: x + 1, y: y, visted: &visted) ||
                hasPathCore(board, chars, maxX: maxX, maxY: maxY, pathLength: &pathLength, x: x, y: y - 1, visted: &visted) ||
                hasPathCore(board, chars, maxX: maxX, maxY: maxY, pathLength: &pathLength, x: x, y: y + 1, visted: &visted)
            
            if result == false {
                pathLength -= 1
                visted[y][x] = false
            }
        }
        
        return result
    }

}
