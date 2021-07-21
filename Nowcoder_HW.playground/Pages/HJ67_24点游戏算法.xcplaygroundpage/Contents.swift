/**
 https://www.nowcoder.com/practice/fbc417f314f745b1978fc751a54ac8cb?tpId=37&&tqId=21290&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 问题描述：给出4个1-10的数字，通过加减乘除，得到数字为24就算胜利
 输入：
 4个1-10的数字。[数字允许重复，但每个数字仅允许使用一次，测试用例保证无异常数字。
 输出：

 true or false

 本题含有多组样例输入。
 输入描述：
 输入4个int整数

 输出描述：
 返回能否得到24点，能输出true，不能输出false

 示例1
 输入：
 7 2 1 10
 复制
 输出：
 true
 复制

 */

func judgePoint24(_ input: String) -> Bool {
    let inputs = input.split(separator: " ")
    var nums: [Int] = [Int]()
    for ele in inputs {
        if let val = Int(ele) {
            nums.append(val)
        }
    }
    
    return judgePoint24(nums.map({ Double($0) }))
}

func judgePoint24(_ nums: [Double]) -> Bool {
    if nums.count == 1 {
        return abs(nums[0] - 24.0) < 1e-6
    }
    
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if i == j {
                continue
            }
            var nums_ = nums.enumerated().filter({ $0.0 != i && $0.0 != j }).map({ $0.1 })
            dprint("nums_ = \(nums_)")
            let parts = possibleParts(a: nums[i], b: nums[j])
            for p in parts {
                nums_.append(p)
                if judgePoint24(nums_) {
                    return true
                }
                nums_ = nums_.dropLast()
            }
        }
    }
    return false
}

func possibleParts(a: Double, b: Double) -> [Double] {
    var res = [a + b, a - b, a * b]
    if a != 0 {
        res.append(b / a)
    }
    return res
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let input = "7 2 1 10"
    let result = judgePoint24(input)
    print(result)
} else {
    while let input = readLine() {
        let result = judgePoint24(input)
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
