/**
 https://leetcode-cn.com/problems/intersection-of-two-arrays-ii/
 
 给定两个数组，编写一个函数来计算它们的交集。

  

 示例 1：

 输入：nums1 = [1,2,2,1], nums2 = [2,2]
 输出：[2,2]
 示例 2:

 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出：[4,9]
  

 说明：

 输出结果中每个元素出现的次数，应与元素在两个数组中出现次数的最小值一致。
 我们可以不考虑输出结果的顺序。
 进阶：

 如果给定的数组已经排好序呢？你将如何优化你的算法？
 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
 如果 nums2 的元素存储在磁盘上，内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/intersection-of-two-arrays-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        var nums = nums2
        for num in nums1 {
            if nums.contains(num) {
                result.append(num)
                nums.remove(at: nums.firstIndex(of: num)!)
            }
        }
        
        return result
    }
    
    func intersect1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let small, big: [Int]
        if nums1.count > nums2.count {
            big = nums1
            small = nums2
        } else {
            big = nums2
            small = nums1
        }
        var dictionary = [Int: Int]()
        for item in small {
            if let value = dictionary[item] {
                dictionary[item] = value + 1
            } else {
                dictionary[item] = 1
            }
            
        }
        
        var result = [Int]()
        for item in big {
            if let value = dictionary[item] {
                result.append(item)
                if value == 1 {
                    dictionary[item] = nil
                    if dictionary.isEmpty {
                        break
                    }
                } else {
                    dictionary[item] = value - 1
                }
            }
        }
        return result
    }
}
