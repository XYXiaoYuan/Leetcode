/**
 https://leetcode.cn/problems/validate-stack-sequences/
 
 给定 pushed 和 popped 两个序列，每个序列中的 值都不重复，只有当它们可能是在最初空栈上进行的推入 push 和弹出 pop 操作序列的结果时，返回 true；否则，返回 false 。

  

 示例 1：

 输入：pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
 输出：true
 解释：我们可以按以下顺序执行：
 push(1), push(2), push(3), push(4), pop() -> 4,
 push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
 示例 2：

 输入：pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
 输出：false
 解释：1 不能在 2 之前弹出。
  

 提示：

 1 <= pushed.length <= 1000
 0 <= pushed[i] <= 1000
 pushed 的所有元素 互不相同
 popped.length == pushed.length
 popped 是 pushed 的一个排列


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/validate-stack-sequences
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class _946_验证栈序列 {
    //class Solution {
    public init() {}
        
    public func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var i = 0
        var result = [Int]()
        for element in pushed {
            result.append(element)
            
            while !result.isEmpty, let last = result.last, last == popped[i] {
                result.removeLast()
                i += 1
            }
        }
        
        return result.count == 0
    }
    
    public func validateStackSequences1(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var poppedIterator = popped.makeIterator()

        var sampleStack = [Int]()
        var currentPoped: Int? = poppedIterator.next()
        for pushedItem in pushed {
            if pushedItem != currentPoped {
                sampleStack.append(pushedItem)
            } else {
                currentPoped = poppedIterator.next()

                while currentPoped != nil, sampleStack.last == currentPoped {
                    currentPoped = poppedIterator.next()
                    _ = sampleStack.popLast()
                }
            }
        }

        return sampleStack.isEmpty && poppedIterator.next() == nil
    }
}

extension _946_验证栈序列 {
    public func test() {
        let testTime = 100
        var isSucceed = true
        let min = 1
        let max = 10
        for _ in 0..<testTime {
            let count = Int.random(in: min...max)
            let pushed = Int.randomSet(count: count, min: min, max: max)
            
            /// 生成 一个下标set
            var set = Set<Int>()
            while set.count < pushed.count {
                let index = Int.random(in: 0..<pushed.count)
                set.insert(index)
            }
            
            /// 根据pushed数组生成一个乱序的popped数组
            var popped = [Int]()
            for s in set {
                popped.append(pushed[s])
            }
            
            assert(pushed.count == popped.count)
            
            /// 方法一
            let result1 = validateStackSequences1(pushed, popped)

            /// 待验证的：方法二
            let result2 = validateStackSequences(pushed, popped)

            if result1 != result2 {
                isSucceed = false
                print("pushed = \(pushed) --- popped = \(popped)")
                break
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}


//do {
//    let s = _946_验证栈序列()
//    let result1 = s.validateStackSequences([1,2,3,4,5], [4,5,3,2,1])
//    assert(result1 == true)
//    let result2 = s.validateStackSequences([1,2,3,4,5], [4,3,5,1,2])
//    assert(result2 == false)
//
//    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
//    
//    /// 对数器测试
//    s.test()
//}

//: [Next](@next)
