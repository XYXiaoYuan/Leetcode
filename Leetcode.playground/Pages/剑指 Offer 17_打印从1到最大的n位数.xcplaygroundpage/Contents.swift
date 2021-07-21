/**
 https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/
 
 输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。

 示例 1:

 输入: n = 1
 输出: [1,2,3,4,5,6,7,8,9]
  

 说明：

 用返回一个整数列表来代替打印
 n 为正整数


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    //初始化字符串等元素
    let chars = "0123456789"
    func printNumbers(_ n: Int) -> [Int] {
        // n位字符串代表n位数字
        var str = [Character](repeating: "0", count: n)
        // n位数字顺序存入的数组中
        var numberArray: [Int] = []
        
        // 调用递归
        addNumChar(&str, &numberArray, 0)
        // 删除开头的数字0
        numberArray.removeFirst()
        
        return numberArray
    }
    
    //进入递归循环
    func addNumChar(_ str: inout [Character], _ numberArray: inout [Int], _ index: Int) {
        for ch in chars {
            str[index] = ch //当前下标从0-9赋值
            if index < str.count - 1 {
                addNumChar(&str, &numberArray, index + 1)
            } else {        //将n位字符串转为n位数字
                if let val = Int(String(str)) {
                    numberArray.append(val)
                }
            }
        }
    }
    
//    func printNumbers1(_ n: Int) -> [Int] {
//        return [Int](1 ..< Int(pow(10, Double(n))))
    
//        var result = [Int]()
//
//        let max = pow(10, n)
//        for i in 1..<max {
//            result.append(i)
//        }
//
//        return result
//    }
}

let s = Solution()
let result = s.printNumbers(2)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

