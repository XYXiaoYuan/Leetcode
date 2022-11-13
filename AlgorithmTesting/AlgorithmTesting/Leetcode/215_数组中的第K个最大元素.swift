/**
 https://leetcode.cn/problems/kth-largest-element-in-an-array/
 
 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。

 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

 你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。

  

 示例 1:

 输入: [3,2,1,5,6,4], k = 2
 输出: 5
 示例 2:

 输入: [3,2,3,1,2,4,5,5,6], k = 4
 输出: 4
  

 提示：

 1 <= k <= nums.length <= 105
 -104 <= nums[i] <= 104


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/kth-largest-element-in-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _215_数组中的第K个最大元素 {
    //class Solution {
    public init() {}
    
    public func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 小顶堆，堆顶是最小元素
        var pq = PriorityQueue<Int>()
        for e in nums {
            // 每个元素都要过一遍二叉堆
            pq.push(e);
            // 堆中元素多于 k 个时，删除堆顶元素
            if (pq.count > k) {
                pq.pop()
            }
        }
        // pq 中剩下的是 nums 中 k 个最大元素，
        // 堆顶是最小的那个，即第 k 个最大元素
        return pq.peek() ?? 0
    }
}

//do {
//    let s = _215_数组中的第K个最大元素()
//
//    let result1 = s.findKthLargest([3,2,1,5,6,4], 2)
//    assert(result1 == 5)
//    print(result1)
//
//    let result2 = s.findKthLargest([3,2,3,1,2,4,5,5,6], 4)
//    assert(result2 == 4)
//    print(result2)
//}

//: [Next](@next)
