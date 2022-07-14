/**
 https://leetcode-cn.com/problems/rectangle-overlap/
 
 矩形以列表 [x1, y1, x2, y2] 的形式表示，其中 (x1, y1) 为左下角的坐标，(x2, y2) 是右上角的坐标。矩形的上下边平行于 x 轴，左右边平行于 y 轴。

 如果相交的面积为 正 ，则称两矩形重叠。需要明确的是，只在角或边接触的两个矩形不构成重叠。

 给出两个矩形 rec1 和 rec2 。如果它们重叠，返回 true；否则，返回 false 。

  

 示例 1：

 输入：rec1 = [0,0,2,2], rec2 = [1,1,3,3]
 输出：true
 示例 2：

 输入：rec1 = [0,0,1,1], rec2 = [1,0,2,1]
 输出：false
 示例 3：

 输入：rec1 = [0,0,1,1], rec2 = [2,2,3,3]
 输出：false


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rectangle-overlap
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class _836_矩形重叠 {
//class Solution {
    public init() {}
    
    public func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        let xRange1 = rec1[0]..<rec1[2]
        let yRange1 = rec1[1]..<rec1[3]
        let xRange2 = rec2[0]..<rec2[2]
        let yRange2 = rec2[1]..<rec2[3]
        return xRange1.overlaps(xRange2) && yRange1.overlaps(yRange2)
    }
    
    func isRectangleOverlap1(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        return min(rec1[2], rec2[2]) - max(rec1[0], rec2[0]) > 0 && min(rec1[3], rec2[3]) - max(rec1[1], rec2[1]) > 0
    }
}

//let s = _836_矩形重叠()
//let result = s.isRectangleOverlap([0,0,2,2], [1,1,3,3])
//print(result)
//
//assert(s.isRectangleOverlap([0,0,2,2], [1,1,3,3]) == true)
//assert(s.isRectangleOverlap([0,0,1,1], [1,0,2,1]) == false)
//assert(s.isRectangleOverlap([0,0,1,1], [2,2,3,3]) == false)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

