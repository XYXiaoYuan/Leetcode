/**
 https://www.nowcoder.com/practice/09fbfb16140b40499951f55113f2166c?tpId=196&&tqId=37068&rp=1&ru=/activity/oj&qru=/ta/job-code-total/question-ranking
 
 描述
 实现函数 int sqrt(int x).
 计算并返回x的平方根（向下取整）
 示例1
 输入：
 2
 复制
 返回值：
 1
 复制

 */

public class NC32_求平方根 {
//class Solution {
    public init() {}

    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param x int整型
     * @return int整型
     */
    func sqrt ( _ x: Int) -> Int {
        if x == 1 {
            return 1
        }
        var low: Double = 0
        var high: Double = Double(x)
        let fixedNum: Double = 0.000001
        var mid = (low + high) / 2 //中间值
        while (high - low) > fixedNum {
            if mid * mid > Double(x) {
                //如果大于num，说明平方根在low--mid之间  把mid赋值给high
                high = mid
            } else {
                //如果小于num，说明平方根在mid--high之间  把midz赋值给low
                low = mid
            }
            mid = (low + high) / 2
        }
        return Int(mid)
    }
}
