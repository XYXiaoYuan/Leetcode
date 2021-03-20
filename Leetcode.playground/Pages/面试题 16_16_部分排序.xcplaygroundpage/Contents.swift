//: [Previous](@previous)

/// https://leetcode-cn.com/problems/sub-sort-lcci/

/**
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。

 示例：

 输入： [1,2,4,7,10,11,7,12,6,7,16,18,19]
 输出： [3,9]
 提示：

 0 <= len(array) <= 1000000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sub-sort-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/// 数组问题,双指针,三指针解决

class Solution {
    func subSort(_ array: [Int]) -> [Int] {
        // 从左扫描到右寻找逆序对(正序:逐渐变大)
        var max = array[0]
        // 用来记录最右的那个逆序对位置
        var r = -1
        for i in 1..<array.count {
            let v = array[i]
            if v >= max {
                max = v
            } else {
                r = i
            }
        }

        // 从右扫描到左寻找逆序对(序:逐渐变小)
        var min = array[array.count - 1]
        // 用来记录最右的那个逆序对位置
        var l = -1
        for i in stride(from: array.count - 2, to: 0, by: -1) {
            let v = array[i]
            if v <= min {
                min = v
            } else {
                l = i
            }
        }

        return [l, r]
    }
}

let s = Solution()
let result = s.subSort([1,2,4,7,10,11,7,12,6,7,16,18,19])
print("结果result = \(result)")


//: [Next](@next)
