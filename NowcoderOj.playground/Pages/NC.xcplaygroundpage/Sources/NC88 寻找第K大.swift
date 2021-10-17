/**
 https://www.nowcoder.com/practice/e016ad9b7f0b45048c58a9f27ba618bf?tpId=194&&tqId=35797&rp=1&ru=/activity/oj&qru=/ta/job-code-high-client/question-ranking
 
 描述
 有一个整数数组，请你根据快速排序的思路，找出数组中第K大的数。

 给定一个整数数组a,同时给定它的大小n和要找的K(1<=K<=n)，请返回第K大的数(包括重复的元素，不用去重)，保证答案存在。

 示例1
 输入：
 [1,3,5,2,2],5,3
 复制
 返回值：
 2
 复制
 示例2
 输入：
 [10,10,9,9,8,7,5,6,4,3,4,2],12,3
 复制
 返回值：
 9
 复制
 说明：
 去重后的第3大是8，但本题要求包含重复的元素，不用去重，所以输出9

 */

public class NC8_寻找第K大 {
//class Solution {
    public init() {}

        
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param a int整型一维数组
     * @param n int整型
     * @param K int整型
     * @return int整型
     */
    func findKth ( _ input: [Int],  _ n: Int,  _ k: Int) -> Int {
        var heap: MinHeap<Int> = MinHeap()
        for i in 0..<n {
            let val = input[i]
            if heap.size < k {
                heap.add(val)
            }
            else if let top = heap.peek(), val > top {
                heap.pull()
                heap.add(val)
            }
        }
                
        var result: [Int] = [Int]()
        for value in heap {
            result.append(value)
        }
        
        print(result)
        
        return heap.peek() ?? 0
    }
}

//let s = Solution()
//let result = s.findKth([1332802,1177178,1514891,871248,753214,123866,1615405,328656,1540395,968891,1884022,252932,1034406,1455178,821713,486232,860175,1896237,852300,566715,1285209,1845742,883142,259266,520911,1844960,218188,1528217,332380,261485,1111670,16920,1249664,1199799,1959818,1546744,1904944,51047,1176397,190970,48715,349690,673887,1648782,1010556,1165786,937247,986578,798663],49,24)
//print(result)
//
////assert(s.maxValue(input1) == 12)
//
///// 全局打印,发布时不触发, isDebug == false时不打印
//public func print<T>(_ msg: T,
//                     line: Int = #line) {
//    let prefix = "🏷_\(line)"
//    print(prefix, msg)
//}

