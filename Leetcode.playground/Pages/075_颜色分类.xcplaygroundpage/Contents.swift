//: [Previous](@previous)

/// https://leetcode-cn.com/problems/sort-colors/

/**
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

  

 示例 1：

 输入：nums = [2,0,2,1,1,0]
 输出：[0,0,1,1,2,2]
 示例 2：

 输入：nums = [2,0,1]
 输出：[0,1,2]
 示例 3：

 输入：nums = [0]
 输出：[0]
 示例 4：

 输入：nums = [1]
 输出：[1]
  

 提示：

 n == nums.length
 1 <= n <= 300
 nums[i] 为 0、1 或 2
  

 进阶：

 你可以不使用代码库中的排序函数来解决这道题吗？
 你能想出一个仅使用常数空间的一趟扫描算法吗？


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-colors
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var i = 0
        var l = 0
        var r = nums.count - 1
        
        while i <= r {
            let v = nums[i]
            
            switch v {
            case 0:
                nums.swapAt(i, l)
                i += 1
                l += 1
            case 1:
                i += 1
            default:
                nums.swapAt(i, r)
                r -= 1
            }
        }
    }
}

let s = Solution()
var nums: [Int] = [2,0,2,1,1,0]
let result = s.sortColors(&nums)
print("结果result = \(result)")


//: [Next](@next)
