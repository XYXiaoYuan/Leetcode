/**
 https://leetcode-cn.com/problems/find-k-pairs-with-smallest-sums/
 和力扣上的这题一样
 */

let string1: String? = "3 1 1 2"
let string2: String? = "3 1 2 3"
let string3: String? = "2"

if let line1 = string1, let line2 = string2, let line = string3, let num = Int(line) {
    var array1: [Int] = line1.split(separator: " ").map { Int($0)! }.sorted()
    var array2: [Int] = line2.split(separator: " ").map { Int($0)! }.sorted()
    
    print(array1)
    print(array2)
    
    let array2Min = array2.min()!
    
    var sum: Int = 0
    for i in 0..<num-1 {
        for j in i..<num {
            let val1 = array1[i]
            let val2 = array2Min
            
//            print("\(i) \(val1)")
//            print("\(j) \(val2) \n")
            
            sum += val1 + val2
        }
    }
    
    print(sum)
        
}
