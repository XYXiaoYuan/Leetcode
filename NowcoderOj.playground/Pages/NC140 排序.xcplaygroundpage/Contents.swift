/**
 https://www.nowcoder.com/practice/2baf799ea0594abd974d37139de27896?tpId=194&&tqId=37494&rp=1&ru=/activity/oj&qru=/ta/job-code-high-client/question-ranking
 
 描述
 给定一个数组，请你编写一个函数，返回该数组排序后的形式。
 示例1
 输入：
 [5,2,3,1,4]
 复制
 返回值：
 [1,2,3,4,5]
 复制
 示例2
 输入：
 [5,1,6,2,5]
 复制
 返回值：
 [1,2,5,5,6]
 复制
 备注：
 数组的长度不大于100000，数组中每个数的绝对值不超过10^910
 9
  

 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 将给定数组排序
     * @param arr int整型一维数组 待排序的数组
     * @return int整型一维数组
     */
    func MySort ( _ arr: [Int]) -> [Int] {
        var arr = arr
        quickSort(&arr, 0, arr.count - 1)
        return arr
    }
    
    private func quickSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        
        var l = left
        var r = right
        let midValue = arr[left]
        
        while l < r {
            while l < r && arr[r] >= midValue {
                r -= 1
            }
            arr[l] = arr[r]
            
            while l < r && arr[l] <= midValue {
                l += 1
            }
            arr[r] = arr[l]
        }
        
        arr[r] = midValue
        
        quickSort(&arr, left, r - 1)
        quickSort(&arr, l + 1, right)
    }
    
    func MySort1( _ array: [Int]) -> [Int] {
        return array.sorted()
//        if array.count < 1 {
//            return array
//        }
//        
//        let pivot = array[array.count / 2]
//        let less = array.filter { $0 < pivot }
//        let equal = array.filter { $0 == pivot }
//        let more  = array.filter { $0 > pivot }
//        
//        return MySort(less) + equal + MySort(more)
    }
}


//let s = Solution()
//let result = s.MySort([5,2,3,1,4])
//print(result)

//assert(s.maxValue(input1) == 12)

/// 全局打印,发布时不触发, isDebug == false时不打印
public func print<T>(_ msg: T,
                     line: Int = #line) {
    let prefix = "🏷_\(line)"
    print(prefix, msg)
}

