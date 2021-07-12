/**
 https://leetcode-cn.com/problems/kth-smallest-element-in-a-sorted-matrix/
 
 给你一个 n x n 矩阵 matrix ，其中每行和每列元素均按升序排序，找到矩阵中第 k 小的元素。
 请注意，它是 排序后 的第 k 小元素，而不是第 k 个 不同 的元素。

  

 示例 1：

 输入：matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
 输出：13
 解释：矩阵中的元素为 [1,5,9,10,11,12,13,13,15]，第 8 小元素是 13
 示例 2：

 输入：matrix = [[-5]], k = 1
 输出：-5


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-smallest-element-in-a-sorted-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var flat = [Int]()
        for row in matrix {
            for cell in row {
                flat.append(cell)
            }
        }
        flat.sort()
        return flat[k - 1]
    }
}

let s = Solution()
let input1 =
[
    [1,5,9],
    [10,11,13],
    [12,13,15]
]
let input2 = [
    [-5]
]
let input3 = [
    [1,2],
    [1,3]
]

let result = s.kthSmallest(input1, 8)
print(result)

assert(s.kthSmallest(input1, 8) == 13)
assert(s.kthSmallest(input2, 1) == -5)
assert(s.kthSmallest(input3, 2) == 1)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

