
let string1: String? = "8"
let string2: String? = "123 124 125 121 119 122 126 123"


if let line = string1, let num = Int(line), let line = string2 {
    let array: [Int] = line.split(separator: " ").map { Int($0)! }

    print(array)
    
    var result: [Int] = [Int].init(repeating: 0, count: num)
    for (i, val) in array.enumerated() {
        for j in (i + 1)..<num where val < array[j] {
            result[i] = j
            break
        }
    }
    
    
    print(result)
    
//    print(result.map { "\($0)" }.joined(separator: " ") )
}
