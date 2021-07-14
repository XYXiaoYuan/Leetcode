/**
 https://www.nowcoder.com/practice/3245215fffb84b7b81285493eae92ff0?tpId=37&&tqId=21226&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 明明想在学校中请一些同学一起做一项问卷调查，为了实验的客观性，他先用计算机生成了N个1到1000之间的随机整数（N≤1000），对于其中重复的数字，只保留一个，把其余相同的数去掉，不同的数对应着不同的学生的学号。然后再把这些数从小到大排序，按照排好的顺序去找同学做调查。请你协助明明完成“去重”与“排序”的工作(同一个测试用例里可能会有多组数据(用于不同的调查)，希望大家能正确处理)。


 注：测试用例保证输入参数的正确性，答题者无需验证。测试用例不止一组。

 当没有新的输入时，说明输入结束。

 输入描述：
 注意：输入可能有多组数据(用于不同的调查)。每组数据都包括多行，第一行先输入随机整数的个数N，接下来的N行再输入相应个数的整数。具体格式请看下面的"示例"。

 输出描述：
 返回多行，处理后的结果

 示例1
 输入：
 3
 2
 2
 1
 11
 10
 20
 40
 32
 67
 40
 20
 89
 300
 400
 15
 复制
 输出：
 1
 2
 10
 15
 20
 32
 40
 67
 89
 300
 400
 复制
 说明：
 输入解释：
 第一个数字是3，也即这个小样例的N=3，说明用计算机生成了3个1到1000之间的随机整数，接下来每行一个随机数字，共3行，也即这3个随机数字为：
 2
 1
 1
 所以第一个小样例的输出为：
 1
 2
 第二个小样例的第一个数字为11，也即...(类似上面的解释)...
 所以第二个小样例的输出为：
 10
 15
 20
 32
 40
 67
 89
 300
 400
 所以示例1包含了两个小样例！！
 */

import Foundation

func randomSort(_ num: Int, _ nums: [Int]) -> String {
    
    var set: SortedSet<Int> = SortedSet<Int>()
    for n in nums {
        set.insert(n)
    }
    
    var res: String = ""
    for i in 0..<set.count {
        let val = set[i]
        res.append("\(val)\n")
    }
    
    return res
}

/// TODO:题目有问题
func randomSort2(_ num: Int, _ nums: [Int]) -> String {
    
    var set: Set<Int> = Set<Int>()
    for n in nums {
        set.insert(n)
    }
        
    return set.sorted().map { "\($0)" }.joined(separator: "\n")
}

func randomSort1(_ num: Int, _ nums: [Int]) -> String {
    
    var dict = [Int: Int]()
    for num in nums {
        dict[num] = 1
    }
    let result = dict.keys.sorted().map { "\($0)" }.joined(separator: "\n")
    
    return result
}

/// 是否是Debug模式
var isDebug: Bool = true
let input = [
    3,
    2,
    2,
    1,
    11,
    10,
    20,
    40,
    32,
    67,
    40,
    20,
    89,
    300,
    400,
    15,
]
let result = [
    1,
    2,
    10,
    15,
    20,
    32,
    40,
    67,
    89,
    300,
    400,
]
if isDebug {
    let num = 3
    let numebrs = [2, 2, 1]
    let result = randomSort(16, input)
    print(result)
} else {
    while let line = readLine(), let num = Int(line) {
        var numbers: [Int] = [Int]()
        while let inputLine = readLine() {
            if let v = Int(inputLine) {
                numbers.append(v)
            }
        }
        let result = randomSort(num, numbers)
        print(result)
    }
}

/// 全局打印,发布时不触发, isDebug == false时不打印
public func dprint<T>(_ msg: T,
                      line: Int = #line) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}


//let res = result.map { String($0) }.joined(separator: "\n")
//assert(randomSort(16, input) == res)


public struct SortedSet<T: Comparable> {
  private var internalSet = [T]()
  
  public init() { }
  
  // Returns the number of elements in the SortedSet.
  public var count: Int {
    return internalSet.count
  }
  
  // Inserts an item. Performance: O(n)
  public mutating func insert(_ item: T) {
    if exists(item) {
      return  // don't add an item if it already exists
    }
    
    // Insert new the item just before the one that is larger.
    for i in 0..<count {
      if internalSet[i] > item {
        internalSet.insert(item, at: i)
        return
      }
    }
    
    // Append to the back if the new item is greater than any other in the set.
    internalSet.append(item)
  }
  
  // Removes an item if it exists. Performance: O(n)
  public mutating func remove(_ item: T) {
    if let index = index(of: item) {
      internalSet.remove(at: index)
    }
  }
  
  // Returns true if and only if the item exists somewhere in the set.
  public func exists(_ item: T) -> Bool {
    return index(of: item) != nil
  }
  
  // Returns the index of an item if it exists, or -1 otherwise.
  public func index(of item: T) -> Int? {
    var leftBound = 0
    var rightBound = count - 1
    
    while leftBound <= rightBound {
      let mid = leftBound + ((rightBound - leftBound) / 2)
      
      if internalSet[mid] > item {
        rightBound = mid - 1
      } else if internalSet[mid] < item {
        leftBound = mid + 1
      } else if internalSet[mid] == item {
        return mid
      } else {
        // When we get here, we've landed on an item whose value is equal to the
        // value of the item we're looking for, but the items themselves are not
        // equal. We need to check the items with the same value to the right
        // and to the left in order to find an exact match.
        
        // Check to the right.
        for j in stride(from: mid, to: count - 1, by: 1) {
          if internalSet[j + 1] == item {
            return j + 1
          } else if internalSet[j] < internalSet[j + 1] {
            break
          }
        }
        
        // Check to the left.
        for j in stride(from: mid, to: 0, by: -1) {
          if internalSet[j - 1] == item {
            return j - 1
          } else if internalSet[j] > internalSet[j - 1] {
            break
          }
        }
        return nil
      }
    }
    return nil
  }
  
  // Returns the item at the given index.
  // Assertion fails if the index is out of the range of [0, count).
  public subscript(index: Int) -> T {
    assert(index >= 0 && index < count)
    return internalSet[index]
  }
  
  // Returns the 'maximum' or 'largest' value in the set.
  public func max() -> T? {
    return count == 0 ? nil : internalSet[count - 1]
  }
  
  // Returns the 'minimum' or 'smallest' value in the set.
  public func min() -> T? {
    return count == 0 ? nil : internalSet[0]
  }
  
  // Returns the k-th largest element in the set, if k is in the range
  // [1, count]. Returns nil otherwise.
  public func kLargest(_ k: Int) -> T? {
    return k > count || k <= 0 ? nil : internalSet[count - k]
  }
  
  // Returns the k-th smallest element in the set, if k is in the range
  // [1, count]. Returns nil otherwise.
  public func kSmallest(_ k: Int) -> T? {
    return k > count || k <= 0 ? nil : internalSet[k - 1]
  }
}
