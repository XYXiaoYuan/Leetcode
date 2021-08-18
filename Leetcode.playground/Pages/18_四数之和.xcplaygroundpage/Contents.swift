/**
 https://leetcode-cn.com/problems/4sum/
 
 给你一个由 n 个整数组成的数组 nums ，和一个目标值 target 。请你找出并返回满足下述全部条件且不重复的四元组 [nums[a], nums[b], nums[c], nums[d]] ：

 0 <= a, b, c, d < n
 a、b、c 和 d 互不相同
 nums[a] + nums[b] + nums[c] + nums[d] == target
 你可以按 任意顺序 返回答案 。

  

 示例 1：

 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 示例 2：

 输入：nums = [2,2,2,2,2], target = 8
 输出：[[2,2,2,2]]
  

 提示：

 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/4sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var quadruplets: [[Int]] = [[Int]]()
        if nums.isEmpty || nums.count < 4 {
            return quadruplets
        }

        let nums = nums.sorted()
        let count = nums.count
        for i in 0..<(count - 3) {
            if i > 0, nums[i] == nums[i - 1] {
                continue
            }

            if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target {
                break
            }

            if nums[i] + nums[count - 3] + nums[count - 2] + nums[count - 1] < target {
                continue
            }

            for j in (i + 1)..<(count - 2) {
                if j > i + 1, nums[j] == nums[j - 1] {
                    continue
                }

                if nums[i] + nums[j] + nums[j + 1] + nums[j + 2] > target {
                    break
                }

                if nums[i] + nums[j] + nums[count - 2] + nums[count - 1] < target {
                    continue
                }

                var left = j + 1
                var right = count - 1
                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if sum == target {
                        quadruplets.append([nums[i], nums[j], nums[left], nums[right]])

                        while left < right, nums[left] == nums[left + 1] {
                            left += 1
                        }
                        left += 1
                        while left < right, nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        right -= 1
                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }

        return quadruplets
    }
}

let s = Solution()
let result = s.fourSum([1,0,-1,0,-2,2], 0)
print(result)

//assert(s.fourSum([1,0,-1,0,-2,2], 0) == [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]])
//assert(s.fourSum([2,2,2,2,2], 8) == [[2,2,2,2]])

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

