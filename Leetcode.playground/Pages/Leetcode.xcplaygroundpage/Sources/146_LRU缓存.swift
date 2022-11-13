/**
 https://leetcode.cn/problems/lru-cache/
 
 请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。
 实现 LRUCache 类：
 LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存
 int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
 void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。
 函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。

  

 示例：

 输入
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 输出
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 解释
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // 缓存是 {1=1}
 lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 lRUCache.get(1);    // 返回 1
 lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 lRUCache.get(2);    // 返回 -1 (未找到)
 lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 lRUCache.get(1);    // 返回 -1 (未找到)
 lRUCache.get(3);    // 返回 3
 lRUCache.get(4);    // 返回 4
  

 提示：

 1 <= capacity <= 3000
 0 <= key <= 10000
 0 <= value <= 105
 最多调用 2 * 105 次 get 和 put


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

import Foundation
import Darwin
// import XCTest

public class _146_LRU缓存 {
    //class Solution {
    public init() {}
    
    /// 双向链表节点
    final class LRUNode {
        /// 键
        var key: Int
        /// 存储的元素
        var val: Int
        /// 上一个节点
        var prev: LRUNode?
        /// 下一个节点
        var next: LRUNode?
        
        /// 构造方法
        init(key: Int = 0, val: Int = 0, prev: LRUNode? = nil, next: LRUNode? = nil) {
            self.key = key
            self.val = val
            self.prev = prev
            self.next = next
        }
        
        /// 构造方法
        init(key: Int, val: Int) {
            self.key = key
            self.val = val
            self.prev = nil
            self.next = nil
        }
    }
    
    class LRUCache {
        /// 节点Map
        private var map: [Int: LRUNode]?
        /// 容量
        private var capacity = 0
        /// 虚拟头结点
        private var first: LRUNode?
        /// 虚拟尾结点
        private var last: LRUNode?
        
        init(_ capacity: Int) {
            map = [Int: LRUNode].init(minimumCapacity: capacity)
            self.capacity = capacity
            first = LRUNode()
            last = LRUNode()
            first?.next = last
            last?.prev = first
        }
        
        func get(_ key: Int) -> Int {
            let node = map?[key]
            guard let newNode = node else { return -1 }
            
            removeNode(node)
            addAfterFirst(node)
            
            return newNode.val
        }
        
        func put(_ key: Int, _ value: Int) {
            var node = map?[key]
            if let node = node {
                node.val = value
                removeNode(node)
            } else { /// 添加一对新的key-value
                if map?.count == capacity, let removeKey = last?.prev?.key {
                    /// 淘汰最近最少使用的node
                    removeNode(map?.removeValue(forKey: removeKey))
                }
                node = LRUNode(key: key, val: value)
                map?[key] = node
            }
            addAfterFirst(node)
        }
        
        /// node 从双向链表中删除node节点
        private func removeNode(_ node: LRUNode?) {
            node?.next?.prev = node?.prev
            node?.prev?.next = node?.next
        }
        
        /// node 将node节点插入到first节点的后面
        private func addAfterFirst(_ node: LRUNode?) {
            // node与first.next
            node?.next = first?.next
            first?.next?.prev = node

            // node与first
            first?.next = node
            node?.prev = first
        }
    }
}

//: [Next](@next)
