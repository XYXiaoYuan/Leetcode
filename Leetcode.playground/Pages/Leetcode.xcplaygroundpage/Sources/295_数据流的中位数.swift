/**
 https://leetcode-cn.com/problems/find-median-from-data-stream/
 
 中位数是有序列表中间的数。如果列表长度是偶数，中位数则是中间两个数的平均值。

 例如，

 [2,3,4] 的中位数是 3

 [2,3] 的中位数是 (2 + 3) / 2 = 2.5

 设计一个支持以下两种操作的数据结构：

 void addNum(int num) - 从数据流中添加一个整数到数据结构中。
 double findMedian() - 返回目前所有元素的中位数。
 示例：

 addNum(1)
 addNum(2)
 findMedian() -> 1.5
 addNum(3)
 findMedian() -> 2
 进阶:

 如果数据流中所有整数都在 0 到 100 范围内，你将如何优化你的算法？
 如果数据流中 99% 的整数都在 0 到 100 范围内，你将如何优化你的算法？


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-median-from-data-stream
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _295_数据流的中位数 {
//class MedianFinder {

    
    public init() {
        self.nums = [Int]()
    }
    
    var nums: [Int]

    public func addNum(_ num: Int) {
        if nums.isEmpty {
            nums.append(num)
            return
        }
        
        var start = 0, end = nums.count - 1
        while start <= end {
            let mid = start + (end - start) / 2
            if num > nums[mid] {
                start = mid + 1
            } else if num < nums[mid] {
                end = mid - 1
            } else {
                start = mid
                break
            }
        }
        
        nums.insert(num, at: start)
    }
    
    func findMedian() -> Double {
        let count = nums.count
        var median: Double = 0
        if count & 1 == 0 {
            median = Double(nums[count / 2] + nums[(count - 1) / 2]) / 2
        } else {
            median = Double(nums[count / 2])
        }
        return median
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */


