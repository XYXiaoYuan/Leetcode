/**
 https://leetcode-cn.com/problems/SNJvJP/
 
 某乐团的演出场地可视作 num * num 的二维矩阵 grid（左上角坐标为 [0,0])，每个位置站有一位成员。乐团共有 9 种乐器，乐器编号为 1~9，每位成员持有 1 个乐器。

 为保证声乐混合效果，成员站位规则为：自 grid 左上角开始顺时针螺旋形向内循环以 1，2，...，9 循环重复排列。例如当 num = 5 时，站位如图所示



 请返回位于场地坐标 [Xpos,Ypos] 的成员所持乐器编号。

 示例 1：

 输入：num = 3, Xpos = 0, Ypos = 2

 输出：3

 解释：


 示例 2：

 输入：num = 4, Xpos = 1, Ypos = 2

 输出：5

 解释：


 提示：

 1 <= num <= 10^9
 0 <= Xpos, Ypos < num


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/SNJvJP
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func orchestraLayout(_ num: Int, _ xPos: Int, _ yPos: Int) -> Int {
        /// 第几圈
        let layer = min(min(yPos, xPos), min(num - xPos - 1, num - yPos - 1)) + 1
        /// 总面积
        let area = num * num
        /// 当前所在圈面积
        var curArea = (num - 2 * (layer - 1))
        curArea *= curArea

        /// 求差 +1 得到当前圈左上角编号
        var index = (area - curArea) % 9 + 1
        /// 右边界
        let right = num - layer
        /// 左边界
        let left = layer - 1
        if xPos == left {
            //在 --- 上
            index += yPos - left;
        } else if yPos == right {
            //在   |上
            index += right - left;
            index += xPos - left;
        } else if xPos == right {
            //在 __ 上
            index += 2 * (right - left);
            index += right - yPos;
        } else {
            //在 |  上
            index += 3 * (right - left);
            index += right - xPos;
        }

        return (index % 9 == 0 ? 9 : index % 9)
    }
}

let s = Solution()
let result = s.orchestraLayout(3, 0, 2)
print(result)

assert(s.orchestraLayout(3, 0, 2) == 3)
assert(s.orchestraLayout(4, 1, 2) == 5)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

