/**
 https://www.nowcoder.com/practice/05182d328eb848dda7fdd5e029a56da9?tpId=37&&tqId=21246&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 实现删除字符串中出现次数最少的字符，若多个字符出现次数一样，则都删除。输出删除这些单词后的字符串，字符串中其它字符保持原来的顺序。
 注意每个输入文件有多组输入，即多个字符串用回车隔开
 输入描述：
 字符串只包含小写英文字母, 不考虑非法输入，输入的字符串长度小于等于20个字节。

 输出描述：
 删除字符串中出现次数最少的字符后的字符串。

 示例1
 输入：
 abcdd
 aabcddd
 复制
 输出：
 dd
 aaddd
 复制

 */

import Foundation

while let line = readLine() {
    var res: String = ""
    
    let chars = Array(line)
    var map: [Character: Int] = [Character: Int]()
    for char in chars {
        map[char, default: 0] += 1
    }
    
    var minCount = Int.max
    for count in map.values {
        minCount = min(minCount, count)
    }
    
    for char in chars {
        if let count = map[char], count == minCount {
            continue
        }
        res += String(char)
    }
    
    print(res)
}
