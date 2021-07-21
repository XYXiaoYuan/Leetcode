/**
 https://leetcode-cn.com/problems/russian-doll-envelopes/
 
 给你一个二维整数数组 envelopes ，其中 envelopes[i] = [wi, hi] ，表示第 i 个信封的宽度和高度。

 当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。

 请计算 最多能有多少个 信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。

 注意：不允许旋转信封。

  
 示例 1：

 输入：envelopes = [[5,4],[6,4],[6,7],[2,3]]
 输出：3
 解释：最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。
 示例 2：

 输入：envelopes = [[1,1],[1,1],[1,1]]
 输出：1
  

 提示：

 1 <= envelopes.length <= 5000
 envelopes[i].length == 2
 1 <= wi, hi <= 104


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/russian-doll-envelopes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 1 else { return envelopes.count }
        
        let list = envelopes.sorted(by: {
            if $0[0] == $1[0] { return $0[1] > $1[1] }
            return $0[0] < $1[0]
        })
        
        var result = 0
        
        var l = 0
        var r = result
        var mid: Int
        
        var heights = [Int](repeating: 0, count: envelopes.count)
        
        for p in list {
            l = 0
            r = result
            while l < r {
                mid = l + (r - l) / 2
                if heights[mid] < p[1] {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            heights[l] = p[1]
            if l == result { result += 1 }
        }
        return result
    }
}
