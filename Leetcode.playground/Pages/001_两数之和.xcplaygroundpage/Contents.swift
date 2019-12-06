/**
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */

import Foundation

/**
 思路,哈希表
 用空间换时间
 first + second = target
 let first: Int = target - nums[i]
 以nums数组的value作为key,numbs数组的key,作为value,用一个字典存储所有hashMap
 当能以hashMap[first]取到对应的值时,说明匹配到了first,下标为hashMap[first],第二个数second下标为i
 那么就只需要返回[hashMap[first], i]就好了
 */

// t = O(N), s = O(N)
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap = [Int: Int]()
        var result = [Int]()

        for i in 0..<nums.count {
            let vaule = nums[i]
            let first: Int = target - vaule
            if let firstIndex = hashMap[first] {
                result.append(firstIndex)
                result.append(i)
                return result
            } else {
                hashMap[vaule] = i
            }
        }
        return result
    }
}

let s = Solution()
let result = s.twoSum([2, 5, 11, 7], 9)
print(result)
