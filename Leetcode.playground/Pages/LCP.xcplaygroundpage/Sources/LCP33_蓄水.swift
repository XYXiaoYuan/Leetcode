/**
 https://leetcode.cn/problems/o8SXZn/
 
 给定 N 个无限容量且初始均空的水缸，每个水缸配有一个水桶用来打水，第 i 个水缸配备的水桶容量记作 bucket[i]。小扣有以下两种操作：

 升级水桶：选择任意一个水桶，使其容量增加为 bucket[i]+1
 蓄水：将全部水桶接满水，倒入各自对应的水缸
 每个水缸对应最低蓄水量记作 vat[i]，返回小扣至少需要多少次操作可以完成所有水缸蓄水要求。

 注意：实际蓄水量 达到或超过 最低蓄水量，即完成蓄水要求。

 示例 1：

 输入：bucket = [1,3], vat = [6,8]

 输出：4

 解释：
 第 1 次操作升级 bucket[0]；
 第 2 ~ 4 次操作均选择蓄水，即可完成蓄水要求。


 示例 2：

 输入：bucket = [9,0,1], vat = [0,2,2]

 输出：3

 解释：
 第 1 次操作均选择升级 bucket[1]
 第 2~3 次操作选择蓄水，即可完成蓄水要求。

 提示：

 1 <= bucket.length == vat.length <= 100
 0 <= bucket[i], vat[i] <= 10^4


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/o8SXZn
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
import Darwin
// import XCTest

public class LCP33_蓄水 {
    //class Solution {
    public init() {}
        
    /// 维持一个记录蓄水次数的大根堆
    public func storeWater(_ bucket: [Int], _ vat: [Int]) -> Int {
        var upgradeBucketCount = 0
        var operations = bucket.enumerated().map { index, element -> (storeCount: Int, bucketVal: Int, vatVal: Int) in
            var bucketVal = element, vatVal = vat[index]
            if vatVal == 0 {
                return (storeCount: 0, bucketVal: bucketVal, vatVal: vatVal)
            }
            if bucketVal == 0 {
                bucketVal = 1
                upgradeBucketCount += 1
            }
            return (storeCount: Int(ceil(Double(vatVal) / Double(bucketVal))), bucketVal: bucketVal, vatVal: vatVal)
        }
        heapfiy(array: &operations)
        var minTotalOperationCount = upgradeBucketCount + operations[0].storeCount
        // 蓄水次数如果为2，则最小为1，增加容量1次，没有优化空间
        while operations[0].storeCount > 2 {
            var operation = operations[0]
            let originalStoreCount = operation.storeCount
            var operationUpgradeBucketCount = upgradeBucketCount
            while operation.storeCount == originalStoreCount {
                operation.bucketVal += 1
                operation.storeCount = Int(ceil(Double(operation.vatVal) / Double(operation.bucketVal)))
                operationUpgradeBucketCount += 1
                // 如果升级操作比最小操作次数大，则不会再有优化空间，退出循环
                if operationUpgradeBucketCount >= minTotalOperationCount {
                    return minTotalOperationCount
                }
            }
            upgradeBucketCount = operationUpgradeBucketCount
            operations[0] = operation
            heapfiy(array: &operations, index: 0, heapSize: operations.count)
            let totalOperationCount = upgradeBucketCount + operations[0].storeCount
            minTotalOperationCount = min(minTotalOperationCount, totalOperationCount)
        }
        return minTotalOperationCount
    }

    func heapfiy(array: inout [(storeCount: Int, bucketVal: Int, vatVal: Int)]) {
        guard array.count > 1 else {
            return
        }
        for index in (0 ..< array.count).reversed() {
            heapfiy(array: &array, index: index, heapSize: array.count)
        }
    }

    func heapfiy(array: inout [(storeCount: Int, bucketVal: Int, vatVal: Int)], index: Int, heapSize: Int) {
        var index = index
        var left = index * 2 + 1
        var right = left + 1
        while left < heapSize {
            let large = (right < heapSize && array[left].storeCount < array[right].storeCount) ? right : left
            if array[large].storeCount <= array[index].storeCount {
                break
            }
            array.swapAt(large, index)
            index = large
            left = index * 2 + 1
            right = left + 1
        }
    }

    
    public func storeWater0(_ bucket: [Int], _ vat: [Int]) -> Int {
        let maxVat = vat.max() ?? 0
        if maxVat == 0 { return 0 } /// 最大容量为0，代表不需蓄水，直接返回0
        var ans = 10001
        for pour in 1...10000 { /// 枚举倒水次数1-10000
            if pour >= ans {
                break
            }
            var upgrade = 0
            for i in 0..<vat.count { /// 枚举每个水桶，计算总升级次数
                /// 容量/倒水次数-初始蓄水量=升级次数
                let cur = Int(ceil(Double(vat[i] / pour - bucket[i])))
                upgrade += cur > 0 ? cur : 0
                if upgrade >= ans {
                    break
                }
            }
            ans = min(ans, upgrade + pour) /// 倒水次数 + 总升级次数 = 总次数
        }
        
        return ans
    }
    
}

extension LCP33_蓄水 {
    public func test() {
        let testTime = 10
        print("对数器开始工作, 执行 【\(testTime)】 次")
        var isSucceed = true
        let minLength = 1
        let maxLength = 10//100000
        
        let minValue = 0
        let maxValue = 10//100000
        
        for i in 0..<testTime {
            let count = Int.random(in: minLength...maxLength)
            var nums1 = [Int]()
            for _ in 0..<count {
                let t = Int.random(in: minValue...maxValue)
                nums1.append(t)
            }
            var nums2 = [Int]()
            for _ in 0..<count {
                let t = Int.random(in: minValue...maxValue)
                nums2.append(t)
            }
            
            let result0 = self.storeWater(nums1, nums2)
            let result1 = self.storeWater(nums1, nums2)

            if result0 != result1 {
                isSucceed = false
                print("第 \(i + 1) 次测试失败, nums = \(nums1), target = \(nums2), result = \(result1)")
                break
            } else {
                print("第 \(i + 1) 次测试成功, nums = \(nums1), target = \(nums2), result = \(result1)")
            }
        }

        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
    }
}

//do {
//    let s = LCP33_蓄水()
//
//    let result1 = s.storeWater([1,3], [6,8])
//    assert(result1 == 4)
//    print(result1)
//
//    let result2 = s.storeWater([9,0,1], [0,2,2])
//    assert(result2 == 3)
//    print(result2)
//
//    s.test()
//}


//: [Next](@next)
