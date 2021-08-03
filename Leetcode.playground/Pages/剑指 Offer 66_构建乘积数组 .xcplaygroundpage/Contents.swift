/**
 https://leetcode-cn.com/problems/gou-jian-cheng-ji-shu-zu-lcof/
 
 给定一个数组 A[0,1,…,n-1]，请构建一个数组 B[0,1,…,n-1]，其中 B[i] 的值是数组 A 中除了下标 i 以外的元素的积, 即 B[i]=A[0]×A[1]×…×A[i-1]×A[i+1]×…×A[n-1]。不能使用除法。

  

 示例:

 输入: [1,2,3,4,5]
 输出: [120,60,40,30,24]
  

 提示：

 所有元素乘积之和不会溢出 32 位整数
 a.length <= 100000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/gou-jian-cheng-ji-shu-zu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func constructArr(_ a: [Int]) -> [Int] {
        let len = a.count
        if len == 0 {
            return []
        }
        
        var b = [Int].init(repeating: 0, count: len)
        b[0] = 1
        
        for i in 1..<len {
            b[i] = b[i - 1] * a[i - 1]
        }
        
        var tmp = 1
        for j in stride(from: len - 2, through: 0, by: -1) {
            tmp *= a[j + 1]
            b[j] *= tmp
        }
        
        return b
    }
    
    func constructArr1(_ a: [Int]) -> [Int] {
        let product = a.reduce(1, { $0 * $1 })

        var result = [Int]()
        for (i, num) in a.enumerated() {
            if num != 0 {
                let val = product / num
                result.append(val)
            } else {
                var nums = a
                let _ = nums.remove(at: i)
                let val = nums.reduce(1, { $0 * $1 })
                result.append(val)
            }
        }

        return result
    }
}

let s = Solution()
let input1 = [1, 2, 3, 4, 5]
let input2 = [1, 2, 0, 4, 5]
let input3 = [1, 2, 0, 4, 0]
let result = s.constructArr(input3)
print(result)

assert(s.constructArr(input1) == [120,60,40,30,24])

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

