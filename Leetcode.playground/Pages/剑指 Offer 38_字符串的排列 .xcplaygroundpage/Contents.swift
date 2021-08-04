/**
 https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/
 
 输入一个字符串，打印出该字符串中字符的所有排列。

  

 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

  

 示例:

 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]
  

 限制：

 1 <= s 的长度 <= 8



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    // 1. 创建两个用来保存结果和中间选择过程的值。创建一个viseted数组来进行判断是否已经访问过
    var paths: [String] = []
    var path: String = ""

    func permutation(_ s: String) -> [String] {
        // visited变量无法定义在外部，因为如果要定义在外部就需要对S进行一次遍历，浪费效率。
        var visited: [Bool] = [Bool].init(repeating: false, count: s.count)

        // 因为需要进行重复查询，所以将字符串进行排序
        // 同时也需要将字符串转为数组
        // 因为在Swift里面String.sorted方法的返回值正好为[Character]类型，所以不需要重新再进转变
        let sArray = s.sorted()
       
        // 2. 实现回溯算法
        backtrack(sArray, &visited)
        return paths
    }

    func backtrack(_ s: [Character], _ visited: inout [Bool]) {
        // 3. 判断结束条件
        if path.count == s.count {
            paths.append(String(path))
        }

        for i in 0..<s.count {
            // 4. 排除不合法选择
            if visited[i] == true {
                continue
            }

            if i > 0 && s[i] == s[i - 1] && visited[i - 1] == true {
                continue
            }

            // 5. 做出选择
            visited[i] = true
            path.append("\(s[i])")

            // 6. 进行深层次选择
            backtrack(s, &visited)
            
            // 7. 撤销选择
            path.removeLast()
            visited[i] = false
        }
    }
}

let s = Solution()
let result = s.permutation("abc")
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

