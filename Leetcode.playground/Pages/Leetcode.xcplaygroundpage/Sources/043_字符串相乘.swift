/**
 https://leetcode-cn.com/problems/add-two-numbers/
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

  

 示例 1：


 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _043_字符串相乘 {
//class Solution {
    public init() {}

    public func multiply(_ num1: String, _ num2: String) -> String {
        let m = num1.count, n = num2.count;
        /// 结果最多为 m + n 位数
        var result: [Int] = [Int].init(repeating: 0, count: m + n);
        /// 从个位数开始逐位相乘
        let zeroAsciiValue = Int(Character("0").unicodeScalars.first?.value ?? 0)
        for i in stride(from: m - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                let num1Value = Int(Character(num1[i]).unicodeScalars.first?.value ?? 0) - zeroAsciiValue
                let num2Value = Int(Character(num2[j]).unicodeScalars.first?.value ?? 0) - zeroAsciiValue
                let mul = num1Value * num2Value
                /// 乘积在 res 对应的索引位置
                let p1 = i + j, p2 = i + j + 1;
                /// 叠加到 res 上
                let sum = mul + result[p2]
                result[p2] = sum % 10;
                result[p1] += sum / 10;
            }
        }
                
        var res = ""
        var flag = false
        for num in result {
            if num != 0 {
                res += String(num)
                flag = true
            } else if flag {
                res += String(num)
            }
        }
        
        return res.isEmpty ? "0" : res
    }
}

//public extension String {
//    /// 通过下标的方式获取字符串中某个下标的字符
//    subscript(_ i: Int) -> String {
//        let idx1 = index(startIndex, offsetBy: i)
//        let idx2 = index(idx1, offsetBy: 1)
//        return String(self[idx1..<idx2])
//    }
//}

//let s = _043_字符串相乘()
//let result = s.multiply("0", "0")
//print(result)

