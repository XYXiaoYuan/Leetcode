/**
 https://leetcode.cn/problems/two-sum/
 
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。

  

 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 示例 2：

 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 示例 3：

 输入：nums = [3,3], target = 6
 输出：[0,1]


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/**
 思路,哈希表
 用空间换时间
 first + second = target
 let first: Int = target - nums[i]
 以nums数组的value作为key,numbs数组的key,作为value,用一个字典存储所有hashMap
 当能以hashMap[first]取到对应的值时,说明匹配到了first,下标为hashMap[first],第二个数second下标为i
 那么就只需要返回[hashMap[first], i]就好了
 */

import Foundation
import XCTest
//_001_两数之和.Test.defaultTestSuite.run()

// t = O(N), s = O(N)
public class _001_两数之和 {
//class Solution {
    public init() {}
    
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var targetOffset = [Int: Int]()

        for (index, num) in nums.enumerated() {
            let second: Int = target - num
            if let first = targetOffset[second] {
                return [first, index]
            }
            
            targetOffset[num] = index
        }
        return [Int]()
    }
    
    public func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var targetOffset = [Int: Int]()

        for num in nums.enumerated() {
            if let offset = targetOffset[num.element] {
                return [num.offset, offset]
            }
            
            targetOffset[target - num.element] = num.offset
        }
        return [Int]()
    }
}

extension _001_两数之和 {
    class Test: XCTestCase {
        var s = _001_两数之和()
        
        func testExample1() {
            let result = s.twoSum([2, 7, 11, 15], 9).sorted()
            let answer = [0, 1].sorted()
            XCTAssertEqual(result, answer)
        }
        
        func testExample2() {
            let result = s.twoSum([3,2,4], 6).sorted()
            let answer = [1, 2].sorted()
            XCTAssertEqual(result, answer)
        }
        
        func testExample3() {
            let result = s.twoSum([3,3], 6).sorted()
            let answer = [0, 1].sorted()
            XCTAssertEqual(result, answer)
        }
        
        func testExample4() {
            let result = s.twoSum1([2, 7, 11, 15], 9).sorted()
            let answer = [0, 1].sorted()
            XCTAssertEqual(result, answer)
        }
        
        func testExample5() {
            let result = s.twoSum1([3,2,4], 6).sorted()
            let answer = [1, 2].sorted()
            XCTAssertEqual(result, answer)
        }
        
        func testExample6() {
            let result = s.twoSum1([3,3], 6).sorted()
            let answer = [0, 1].sorted()
            XCTAssertEqual(result, answer)
        }
    }
}

//let s = _001_两数之和()
//let result = s.twoSum([2, 5, 11, 7], 9)
//print(result)

//: [Next](@next)
