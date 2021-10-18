/**
 https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof/
 
 请定义一个队列并实现函数 max_value 得到队列里的最大值，要求函数max_value、push_back 和 pop_front 的均摊时间复杂度都是O(1)。

 若队列为空，pop_front 和 max_value 需要返回 -1

 示例 1：

 输入:
 ["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
 [[],[1],[2],[],[],[]]
 输出: [null,null,null,2,1,2]
 示例 2：

 输入:
 ["MaxQueue","pop_front","max_value"]
 [[],[],[]]
 输出: [null,-1,-1]
  

 限制：

 1 <= push_back,pop_front,max_value的总操作数 <= 10000
 1 <= value <= 10^5


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer59_II_队列的最大值 {
//class MaxQueue {    
    var queue = [Int]()
    var maxQueue = [Int]()

    public init() {}
    
    func max_value() -> Int {
        if !maxQueue.isEmpty {
            return maxQueue.first!
        }
        return -1
    }
    
    func push_back(_ value: Int) {
        while !maxQueue.isEmpty && maxQueue.last! < value {
            maxQueue.removeLast()
        }
        maxQueue.append(value)
        queue.append(value)

    }
    
    func pop_front() -> Int {
        if !queue.isEmpty {
            var popValue = queue.removeFirst()

            if popValue == maxQueue.first! {
                maxQueue.removeFirst()
            }
            return popValue
        }

        return -1
    }
}

/**
 * Your MaxQueue object will be instantiated and called as such:
 * let obj = MaxQueue()
 * let ret_1: Int = obj.max_value()
 * obj.push_back(value)
 * let ret_3: Int = obj.pop_front()
 */
