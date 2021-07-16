/**
 https://leetcode-cn.com/problems/rotate-array/
 
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

  

 进阶：

 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
  

 示例 1:

 输入: nums = [1,2,3,4,5,6,7], k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 示例 2:

 输入：nums = [-1,-100,3,99], k = 2
 输出：[3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
  

 提示：

 1 <= nums.length <= 2 * 104
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func rotate1(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        var newArr = [Int].init(repeating: 0, count: n)
        
        for i in 0..<n {
            newArr[(i + k) % n] = nums[i]
        }
    }
    
    func rotate2(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n
        
        // 翻转全部
        reverse(&nums, 0, n - 1);
        // 翻转调到前面的那部分
        reverse(&nums, 0, k - 1);
        // 翻转后面顺延的部分
        reverse(&nums, k, n - 1);

        func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
            var start = start
            var end = end
            // 双指针做法
            while start < end {
                let temp = nums[start]
                nums[start] = nums[end]
                nums[end] = temp
                start += 1
                end -= 1
            }
        }
    }
    
    func rotate3(_ nums: inout [Int], _ k: Int) {
        let len = nums.count
        let k = k % len
        
        // 记录交换位置的次数，n个同学一共需要换n次
        var count = 0;
        for i in 0..<len {
            // 从0开始换
            var cur = i
            // 目前要换的数
            var pre = nums[cur]
            repeat {
                // 下一个的位置
                let next = (cur + k) % len
                // 暂存数据
                let temp = nums[next]
                // 放入下一个位置
                nums[next] = pre
                // 更新后移
                pre = temp
                cur = next
                // 记录交换次数
                count += 1
            } while(i != cur)
            // 回到起始位置时，循环结束，起始位置准备后移
        }
    }
}
