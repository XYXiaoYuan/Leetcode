/**
 https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/
 
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

  

 示例 1：

 输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 示例 2：

 输入：
 ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
 [[],[],[5],[2],[],[]]
 输出：[null,-1,null,null,5,2]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class _剑指Offer09_用两个栈实现队列 {
//class CQueue {
    
    private lazy var inStack: Stack<Int> = Stack<Int>()
    private lazy var outStack: Stack<Int> = Stack<Int>()

    public init() {

    }
    
    func appendTail(_ value: Int) {
        inStack.push(value)
    }
    
    func deleteHead() -> Int {
        checkOutStack()
        return outStack.pop() ?? 0
    }
    
    private func checkOutStack() {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.push(inStack.pop() ?? 0)
            }
        }
    }
}
