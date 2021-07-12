/**
 https://leetcode-cn.com/problems/count-of-smaller-numbers-after-self/
 
 给定一个整数数组 nums，按要求返回一个新数组 counts。数组 counts 有该性质： counts[i] 的值是  nums[i] 右侧小于 nums[i] 的元素的数量。

  

 示例：

 输入：nums = [5,2,6,1]
 输出：[2,1,1,0]
 解释：
 5 的右侧有 2 个更小的元素 (2 和 1)
 2 的右侧仅有 1 个更小的元素 (1)
 6 的右侧有 1 个更小的元素 (1)
 1 的右侧有 0 个更小的元素
  



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/count-of-smaller-numbers-after-self
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func getRangeSum(_ fenwickTree: inout[Int], _ i:Int) -> Int
    {
        var sum = 0
        var index = i + 1
        while index > 0
        {
            sum += fenwickTree[index]
            index = index - (index & -index)
        }
        return sum
    }
    
    func update(_ fenwickTree: inout [Int], _ rangeIndex:Int, _ val:Int)
    {
        var index = rangeIndex + 1
        while index < fenwickTree.count
        {
            fenwickTree[index] += val
            index = index + (index & -index)
        }
    }

    func countSmaller(_ nums: [Int]) -> [Int] {
        if nums.count == 0
        {
            return []
        }
        var sortCopy = nums.sorted(by:<)
        var indices:[Int:Int] = [:]
        for (index, num) in sortCopy.enumerated()
        {
            indices[num] = index
        }
        var fenwickTree = Array(repeating:0, count:nums.count + 1)
        
        var result:[Int] = []
        
        for i in stride(from:nums.count - 1, through:0, by:-1)
        {
            var rangeIndex = indices[nums[i]]!
            var rangeSum = getRangeSum(&fenwickTree, rangeIndex - 1)
            result.insert(rangeSum, at:0)
            update(&fenwickTree,rangeIndex, 1)
        }
        return result
    }
}
