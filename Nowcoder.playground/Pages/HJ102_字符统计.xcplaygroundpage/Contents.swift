/**
 https://www.nowcoder.com/practice/c1f9561de1e240099bdb904765da9ad0?tpId=37&&tqId=21325&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一个只包含小写英文字母和数字的字符串，按照不同字符统计个数由多到少输出统计结果，如果统计的个数相同，则按照ASCII码由小到大排序输出。
 本题含有多组样例输入

 输入描述：
 一个只包含小写英文字母和数字的字符串。

 输出描述：
 一个字符串，为不同字母出现次数的降序表示。若出现次数相同，则按ASCII码的升序输出。

 示例1
 输入：
 aaddccdc
 1b1bbbbbbbbb

 输出：
 cda
 b1

 说明：
 第一个样例里，c和d出现3次，a出现2次，但c的ASCII码比d小，所以先输出c，再输出d，最后输出a.
   
 */
import Foundation

typealias Tuple = (key: Character, count: Int)

func statisticsStringCount(_ str: String) -> String {
    
    var dict: [Character: Int] = [Character: Int]()
    for s in str {
        if var value = dict[s] {
            value += 1
            dict[s] = value
        } else {
            dict[s] = 1
        }
    }
    
    print(dict)
    let result = dict.sorted(by: {
        switch ($0.value, $1.value) {
        case let (lhs, rhs) where lhs == rhs:
            return $0.key < $1.key
        case let (lhs, rhs):
            return lhs > rhs
        }
    })
    print(result)
    
    return result.map { String($0.key) }.joined(separator: "")
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let line = "1b1bbbbbbbbb"
    let result = statisticsStringCount(line)
    print(result)
} else {
    while let line = readLine() {
        let result = statisticsStringCount(line)
        print(result)
    }
}

assert(statisticsStringCount("aaddccdc") == "cda")
assert(statisticsStringCount("1b1bbbbbbbbb") == "bl")
