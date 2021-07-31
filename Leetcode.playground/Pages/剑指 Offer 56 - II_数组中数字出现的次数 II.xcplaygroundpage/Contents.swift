/**
 https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/
 
 在一个数组 nums 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。

  

 示例 1：

 输入：nums = [3,4,3,3]
 输出：4
 示例 2：

 输入：nums = [9,1,7,9,7,9,7]
 输出：1
  

 限制：

 1 <= nums.length <= 10000
 1 <= nums[i] < 2^31


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [Int: Int]()

        for i in nums {
            if let val = dict[i] {
                dict[i] = val + 1
            } else {
                dict[i] = 1
            }
        }

        return dict.filter { $0.value == 1 }.first?.key ?? 0
    }
}

let s = Solution()
let input1 = [3,4,3,3]
let input2 = [9,1,7,9,7,9,7]
let result = s.singleNumber(input1)
print(result)

assert(s.singleNumber(input1) == 4)
assert(s.singleNumber(input2) == 1)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

