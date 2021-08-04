/**
 https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/
 
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。

  

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

  

 示例 1:

 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2
  

 限制：

 1 <= 数组长度 <= 50000

  

 注意：本题与主站 169 题相同：https://leetcode-cn.com/problems/majority-element/

  



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [Int: Int]()
        for i in 0..<nums.count {
            let val = nums[i]
            dict.updateValue((dict[val] ?? 0) + 1, forKey: val)
        }

        let count = nums.count / 2
        return dict.filter { $0.value > count }.first?.key ?? 0
    }
}

let s = Solution()
let result = s.majorityElement([1, 2, 3, 2, 2, 2, 5, 4, 2])
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

