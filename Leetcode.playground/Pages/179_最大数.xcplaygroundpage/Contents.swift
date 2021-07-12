/**
 https://leetcode-cn.com/problems/largest-number/
 
 给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。

 注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。

  

 示例 1：

 输入：nums = [10,2]
 输出："210"
 示例 2：

 输入：nums = [3,30,34,5,9]
 输出："9534330"
 示例 3：

 输入：nums = [1]
 输出："1"
 示例 4：

 输入：nums = [10]
 输出："10"


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/largest-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        guard !nums.isEmpty else { return "" }
        var strNums = [String]()
        
        //Convert Int to String
        for num in nums {
            strNums.append(String(num))
        }
        
        // Concatenate to one another and sort
        strNums.sort { (a, b) -> Bool in
            return a + b > b + a
        }
        
        // Check for leading 0's
        return strNums.first == "0" ? "0" : strNums.joined()
    }
    
    func largestNumber1(_ nums: [Int]) -> String {
        let strings = nums.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
        print(strings)
        if nums.reduce(into: Bool(false), { $0 = $0 || $1 > 0 }) {
            return strings.joined()
        } else {
            return "0"
        }
    }
}

let s = Solution()
let result = s.largestNumber([10,2])
print(result)

assert(s.largestNumber([10,2]) == "210")
assert(s.largestNumber([3,30,34,5,9]) == "9534330")
assert(s.largestNumber([1]) == "1")
assert(s.largestNumber([10]) == "10")

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

