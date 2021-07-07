/**
 https://www.nowcoder.com/practice/e8480ed7501640709354db1cc4ffd42a?tpId=37&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 
 描述
 一个DNA序列由A/C/G/T四个字母的排列组合组成。G和C的比例（定义为GC-Ratio）是序列中G和C两个字母的总的出现次数除以总的字母数目（也就是序列长度）。在基因工程中，这个比例非常重要。因为高的GC-Ratio可能是基因的起始点。

 给定一个很长的DNA序列，以及限定的子串长度N，请帮助研究人员在给出的DNA序列中从左往右找出GC-Ratio最高且长度为N的第一个子串。
 DNA序列为ACGT的子串有:ACG,CG,CGT等等，但是没有AGT，CT等等
 输入描述：
 输入一个string型基因序列，和int型子串的长度

 输出描述：
 找出GC比例最高的子串,如果有多个则输出第一个的子串

 示例1
 输入：
 ACGT
 2
 
 输出：
 CG
 
 说明：
 ACGT长度为2的子串有AC,CG,GT3个，其中AC和GT2个的GC-Ratio都为0.5，CG为1，故输出CG
 示例2
 输入：
 AACTGTGCACGACCTGA
 5

 输出：
 GCACG

 说明：
 虽然CGACC的GC-Ratio也是最高，但它是从左往右找到的GC-Ratio最高的第2个子串，所以只能输出GCACG。

 */

import Foundation

func maxSlidingDNASequences(_ nums: String, _ k: Int) -> String {
    if nums.isEmpty || k < 1 {
        return ""
    }
    if k == 1 {
        return nums
    }
    
    let numsArr: [String] = nums.map { "\($0)" }

    typealias Element = (index: Int, gcCount: Int, content: String)
    var maxes: [Element] = [Element].init(repeating: (index: 0, gcCount: 0, content: ""), count: nums.count - k + 1)
    
    for li in 0..<maxes.count {
        let ri = li + k - 1
        var subStr: String = ""
        var gcCount: Int = 0
        for j in li...ri {
            let val = numsArr[j]
            subStr.append(val)
            if val == "C" || val == "G" {
                gcCount += 1
            }
        }
        maxes[li] = (index: li, gcCount: gcCount, content: subStr)
    }
    
    maxes = maxes.sorted {
        switch ($0.gcCount, $1.gcCount) {
        case let (lhs, rhs) where lhs == rhs:
            return $0.index < $1.index
        case let (lhs, rhs):
            return lhs > rhs
        }
    }
    
    return maxes.first?.content ?? ""
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let nums: String = "AACTGTGCACGACCTGA"
    let k: Int = 5
    let result = maxSlidingDNASequences(nums, k)
    print(result)
} else {
    while let nums = readLine(), let numLine = readLine(), let k = Int(numLine) {
        let result = maxSlidingDNASequences(nums, k)
        print(result)
    }
}

assert(maxSlidingDNASequences("ACGT", 2) == "CG")
assert(maxSlidingDNASequences("AACTGTGCACGACCTGA", 5) == "GCACG")

