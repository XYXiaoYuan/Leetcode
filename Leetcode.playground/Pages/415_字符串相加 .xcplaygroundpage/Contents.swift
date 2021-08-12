/**
 https://leetcode-cn.com/problems/add-strings/
 
 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。

  

 提示：

 num1 和num2 的长度都小于 5100
 num1 和num2 都只包含数字 0-9
 num1 和num2 都不包含任何前导零
 你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var max = num1.count >= num2.count ? num1 : num2 //长的那个字符串
        var min = num1.count < num2.count ? num1 : num2 //短的那个字符串
        var sum = ""
        var flag = 0 //进位数
        let map = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]
        while max.count > 0 {
            let maxInt : Int = map[(String(max.last ?? "0"))] ?? 0
            var minInt = 0
            if min.count > 0 {
                minInt = map[(String(min.last ?? "0"))] ?? 0
                min.removeLast()
            }
            sum = String((maxInt + minInt + flag)%10) + sum
            if maxInt + minInt + flag > 9 {
                flag = (maxInt + minInt + flag)/10
            }else {
                flag = 0
            }
            max.removeLast()
        }
        if flag != 0 {
            sum = String(flag) + sum
        }
        sum = sum == "" ? "0" : sum

        return sum
    }
}

