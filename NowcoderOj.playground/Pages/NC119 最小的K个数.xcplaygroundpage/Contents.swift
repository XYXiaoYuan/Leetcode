/**
 https://www.nowcoder.com/practice/6a296eb82cf844ca8539b57c23e6e9bf?tpId=188&&tqId=38570&rp=1&ru=/activity/oj&qru=/ta/job-code-high-week/question-ranking
 

 描述
 给定一个数组，找出其中最小的K个数。例如数组元素是4,5,1,6,2,7,3,8这8个数字，则最小的4个数字是1,2,3,4。
 0 <= k <= input.length <= 10000
 0 <= input[i] <= 10000

 示例1
 输入：
 [4,5,1,6,2,7,3,8],4
 复制
 返回值：
 [1,2,3,4]
 复制
 说明：
 返回最小的4个数即可，返回[1,3,2,4]也可以
 示例2
 输入：
 [1],0
 复制
 返回值：
 []
 复制
 示例3
 输入：
 [0,1,2,1,2],3
 复制
 返回值：
 [0,1,1]
 复制

 */

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param input int整型一维数组
     * @param k int整型
     * @return int整型一维数组
     */
    func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
        var heap: MaxHeap<Int> = MaxHeap()
        for i in 0..<input.count {
            let val = input[i]
            if heap.size < k {
                heap.add(val)
            }
            else if (val < heap.peek() ?? 0) {
                heap.pull()
                heap.add(val)
            }
        }
                
        var result: [Int] = [Int]()
        for value in heap {
            result.append(value)
        }
        
        return result
    }
}

let s = Solution()
let result = s.GetLeastNumbers_Solution([4,5,1,6,2,7,3,8], 4)
print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}
