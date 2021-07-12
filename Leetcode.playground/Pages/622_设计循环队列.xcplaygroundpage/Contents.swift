/**
 https://leetcode-cn.com/problems/design-circular-queue/
 
 设计你的循环队列实现。 循环队列是一种线性数据结构，其操作表现基于 FIFO（先进先出）原则并且队尾被连接在队首之后以形成一个循环。它也被称为“环形缓冲器”。

 循环队列的一个好处是我们可以利用这个队列之前用过的空间。在一个普通队列里，一旦一个队列满了，我们就不能插入下一个元素，即使在队列前面仍有空间。但是使用循环队列，我们能使用这些空间去存储新的值。

 你的实现应该支持如下操作：

 MyCircularQueue(k): 构造器，设置队列长度为 k 。
 Front: 从队首获取元素。如果队列为空，返回 -1 。
 Rear: 获取队尾元素。如果队列为空，返回 -1 。
 enQueue(value): 向循环队列插入一个元素。如果成功插入则返回真。
 deQueue(): 从循环队列中删除一个元素。如果成功删除则返回真。
 isEmpty(): 检查循环队列是否为空。
 isFull(): 检查循环队列是否已满。
  

 示例：

 MyCircularQueue circularQueue = new MyCircularQueue(3); // 设置长度为 3
 circularQueue.enQueue(1);  // 返回 true
 circularQueue.enQueue(2);  // 返回 true
 circularQueue.enQueue(3);  // 返回 true
 circularQueue.enQueue(4);  // 返回 false，队列已满
 circularQueue.Rear();  // 返回 3
 circularQueue.isFull();  // 返回 true
 circularQueue.deQueue();  // 返回 true
 circularQueue.enQueue(4);  // 返回 true
 circularQueue.Rear();  // 返回 4
  

 提示：

 所有的值都在 0 至 1000 的范围内；
 操作数将在 1 至 1000 的范围内；
 请不要使用内置的队列库。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/design-circular-queue
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class MyCircularQueue {
    
    private var values: [Int]
    private var capacity: Int
    private var head: Int
    private var tail: Int
    
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        values = [Int](repeating: -1, count: k)
        capacity = 0
        head = -1
        tail = -1
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        tail = nextIndex(value: tail)
        values[tail] = value
        
        if isEmpty() {
           head = tail
        }
        
        capacity += 1
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        head = nextIndex(value: head)
        capacity -= 1
        return true
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        guard !isEmpty() else { return -1 }
        return values[head]
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        guard !isEmpty() else { return -1 }
        return values[tail]
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return capacity == 0
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return capacity >= values.count
    }
    
    private func nextIndex(value: Int) -> Int {
        if value >= (values.count - 1) {
            return 0
        }
        return (value + 1)
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
