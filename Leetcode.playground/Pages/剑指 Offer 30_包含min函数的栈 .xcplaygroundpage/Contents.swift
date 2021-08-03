/**
 https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof/
 
 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。

  

 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.min();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.min();   --> 返回 -2.
  

 提示：

 各函数的调用总次数不超过 20000 次


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class MinStack {
    /// Datastructure consisting of a generic item.
    fileprivate var array = [Int]()
    
    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {
        array.append(x)
    }
    
    func pop() {
        array.popLast()
    }
    
    func top() -> Int {
        return array.last ?? 0
    }
    
    func min() -> Int {
       return array.min() ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.min()
 */
