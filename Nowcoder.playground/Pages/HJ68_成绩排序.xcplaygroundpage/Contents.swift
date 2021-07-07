/**
 https://www.nowcoder.com/practice/8e400fd9905747e4acc2aeed7240978b?tpId=37&&tqId=21291&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 查找和排序

 题目：输入任意（用户，成绩）序列，可以获得成绩从高到低或从低到高的排列,相同成绩
 都按先录入排列在前的规则处理。

 例示：
 jack      70
 peter     96
 Tom       70
 smith     67

 从高到低  成绩
 peter     96
 jack      70
 Tom       70
 smith     67

 从低到高

 smith     67

 jack      70

 Tom       70
 peter     96

 注：0代表从高到低，1代表从低到高

 本题含有多组输入数据！
 输入描述：
 输入多行，先输入要排序的人的个数，然后分别输入他们的名字和成绩，以一个空格隔开

 输出描述：
 按照指定方式输出名字和成绩，名字和成绩之间以一个空格隔开

 示例1
 输入：
 3
 0
 fang 90
 yang 50
 ning 70

 输出：
 fang 90
 ning 70
 yang 50
 
 */

import Foundation

struct Grade {
    var index: Int
    var name: String
    var score: Int
}

func gradeRank(_ nums: Int, _ isAsc: Bool, _ students: [Grade]) -> [Grade] {
    let result = students.sorted {
        switch ($0.score, $1.score) {
        case let (lhs, rhs) where lhs == rhs:
            return $0.index < $1.index
        case let (lhs, rhs):
            if isAsc {
                return lhs < rhs
            } else {
                return lhs > rhs
            }
        }
    }
    return result
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let nums: Int = 3
    let isAsc: Bool = false
    let grades: [Grade] = [
        Grade(index: 0, name: "fang", score: 90),
        Grade(index: 1, name: "yang", score: 50),
        Grade(index: 2, name: "fang", score: 70),
    ]
    
    let result = gradeRank(nums, isAsc, grades)
    let res = result.map { "\($0.name) \($0.score)" }.joined(separator: "\n")
    print(res)
} else {
    while let line1 = readLine(), let nums = Int(line1), let line2 = readLine(), let isAsc = Int(line2) {
        var grades: [Grade] = [Grade]()
        for i in 0..<nums {
            let line = readLine()
            if let line = line {
                let parts = line.split(separator: " ")
                let name = String(parts[0])
                if let score = Int(parts[1]) {
                    let grade = Grade(index: i, name: name, score: score)
                    grades.append(grade)
                }
            }
        }
        
        let result = gradeRank(nums, isAsc == 1, grades)
        let res = result.map { "\($0.name) \($0.score)" }.joined(separator: "\n")
        print(res)
    }
}

