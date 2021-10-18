/**
 https://leetcode-cn.com/problems/restore-ip-addresses/
 
 给定一个只包含数字的字符串，用以表示一个 IP 地址，返回所有可能从 s 获得的 有效 IP 地址 。你可以按任何顺序返回答案。

 有效 IP 地址 正好由四个整数（每个整数位于 0 到 255 之间组成，且不能含有前导 0），整数之间用 '.' 分隔。

 例如："0.1.2.201" 和 "192.168.1.1" 是 有效 IP 地址，但是 "0.011.255.245"、"192.168.1.312" 和 "192.168@1.1" 是 无效 IP 地址。

  

 示例 1：

 输入：s = "25525511135"
 输出：["255.255.11.135","255.255.111.35"]
 示例 2：

 输入：s = "0000"
 输出：["0.0.0.0"]
 示例 3：

 输入：s = "1111"
 输出：["1.1.1.1"]
 示例 4：

 输入：s = "010010"
 输出：["0.10.0.10","0.100.1.0"]
 示例 5：

 输入：s = "101023"
 输出：["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
  

 提示：

 0 <= s.length <= 3000
 s 仅由数字组成


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/restore-ip-addresses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _093_复原IP地址 {
//class Solution {
    public init() {}
    public func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 || s.count > 12 {
            return []
        }
        
        let characters = Array(s)
        var result = [String]()
        var candidate = [String]()
        
        backtracking(characters, 0, &candidate, &result)
        
        return result
    }
    
    private func backtracking(_ characters: [Character], _ pos: Int, _ candidate: inout [String], _ result: inout [String]) {
        if candidate.count == 4 {
            result.append(candidate.joined(separator: "."))
            return
        }
        
        let charsLeft = characters.count - pos
        let groupsLeft = 4 - candidate.count
        let minLen = groupsLeft == 1 ? charsLeft - groupsLeft + 1 : 1
        let maxLen = characters[pos] == "0" ? 1 : min(3, charsLeft - groupsLeft + 1)
        
        if minLen > maxLen {
            return
        }

        for len in minLen...maxLen {
            let num = String(characters[pos..<(pos + len)])
            if Int(num)! > 255 {
                continue
            }
            candidate.append(num)
            backtracking(characters, pos + len, &candidate, &result)
            candidate.removeLast()
        }
    }
}
